public with sharing class caseCard {
    public caseCard() {

    }
    @AuraEnabled(cacheable = true)
    public static List<Case> showCase(){
        Id conId = [SELECT contactId FROM User WHERE Id = :UserInfo.getUserId()].ContactId;
        return [SELECT CaseNumber, Subject, Status, LastModifiedDate , CreatedDate FROM Case 
                WHERE ContactId = :conId];
    }
}