public with sharing class orderCard {
    public orderCard() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Order> showOrder(){
        //Id accId = [SELECT id,accountId FROM Contact WHERE id = :userId].id;
        //Id userId = UserInfo.getUserId();
        Id accId = [SELECT ContactId, Contact.AccountId FROM User WHERE Id = :UserInfo.getUserId()].Contact.AccountId;
        return [
            SELECT Id, Name, Warranty_End_Date__c FROM order WHERE AccountId = :accId
        ];
    }
}