global class KBCardProcessorHierarchyPath implements Database.Batchable <SObject> {
    global integer recordsProcessed = 0;
    
    //START METHOD
    global Database.QueryLocator start(Database.BatchableContext bc){
        Id ProgramRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Program').getRecordTypeId();
        String Query='Select id, KBCard_ID__c, KBCExtID__c, Level__c, Name from KBCard__c Order by Level__c, KBCExtID__c';
        System.debug(Query);
        return Database.getQueryLocator(Query);
     
    }
    //EXECUTE METHOD
    global void execute(Database.BatchableContext bc, List<KBCard__c> scope){
        for(KBCard__c kbc : scope){
            //update record here
            System.debug('Processing Level=' + kbc.Level__c + ' KBCExtID=' + kbc.KBCard_ID__c);
            HierarchyMethods.ResetCurrentRecordHierarchyFields(kbc.Id);
            recordsProcessed=recordsProcessed+1;
        }
        try{
        	//normally update list here
        } catch(Exception e) {
            System.debug(e);
        }
    }
    //FINISH METHOD
    global void finish(Database.BatchableContext bc){
        Id job=bc.getJobId();
        System.debug(job);
        System.debug('Records processed=' + recordsProcessed);
         
    }
}