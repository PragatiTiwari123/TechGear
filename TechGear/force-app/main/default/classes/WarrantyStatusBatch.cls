global class WarrantyStatusBatch implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Warranty_End_Date__c FROM Order]);
    }
    global void execute(Database.BatchableContext bc, List<Order> scope) {
        // for each order in scope, compute status based on Warranty_End_Date__c
        // build a list of Orders with Warranty_Status__c set
        // update that list
        List<Order> updateOrderList = new List<Order>();
        for(Order ord : scope){
            if(ord.Warranty_End_Date__c == System.today()){
                ord.Warranty_Status__c = 'Expiring Soon';
            }
            else if(ord.Warranty_End_Date__c > System.today()){
                ord.Warranty_Status__c = 'Active';
            }
            else{
                ord.Warranty_Status__c = 'Expired';
            }
            updateOrderList.add(ord);
        }
        update updateOrderList;
    }
    global void finish(Database.BatchableContext bc) {
        // optional: log completion, or email yourself a summary
    }
}
