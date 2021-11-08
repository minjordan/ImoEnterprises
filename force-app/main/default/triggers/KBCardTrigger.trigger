trigger KBCardTrigger on KBCard__c (before insert, after insert, before update, after update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        // Process after insert or update
	    //Always reset after insert
        System.debug('kbcardtrigger after insert');
        list<KBCard__c> kbcardlist = trigger.new;
        for(KBCard__c kbc:kbcardlist){
            System.debug('kbcard.name=' + kbc.name);            
            HierarchyMethods.ResetCurrentRecordHierarchyFields(kbc.id);
        }   
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        // Process after insert or update
	    // Only reset after update if certain conditions are met
        System.debug('kbcardtrigger after insert');
        list<KBCard__c> kbcardlist = trigger.new;
        for(KBCard__c kbc:kbcardlist){
            System.debug('kbcard.name=' + kbc.name);  
            if ((kbc.KBCExtID__c != trigger.oldMap.get(kbc.Id).KBCExtID__c)
             ||(kbc.ParentKBCard__c != trigger.oldMap.get(kbc.Id).ParentKBCard__c)
             ||(kbc.RecordTypeId != trigger.oldMap.get(kbc.Id).RecordTypeId)){	
            	HierarchyMethods.ResetCurrentRecordHierarchyFields(kbc.id);
            }
        }   
    }
}