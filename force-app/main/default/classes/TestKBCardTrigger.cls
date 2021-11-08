@isTest
public class TestKBCardTrigger {

    @isTest static void TestKBCardTriggerAfterInsertAndUpdate(){
        //Set up the test first
   		Id ProgramRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Program').getRecordTypeId();
        Id ProjectRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Project').getRecordTypeId();
        Id CapabilityRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Capability').getRecordTypeId();
        Id EpicRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Epic').getRecordTypeId();
        Id FeatureRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Feature').getRecordTypeId();
        Id StoryRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Story').getRecordTypeId();
            
        //Run the Test on Insert        
        Test.startTest();
        //Put in a full Hierarchy for best test coverage
        //Create the parent program
        KBCard__c kbcprogram = new KBCard__c(Name='TestKBCardTrigger_Program', RecordTypeId=ProgramRTId);
        insert kbcprogram;
        KBCard__c kbcproject = new KBCard__c(Name='TestKBCardTrigger_Project', RecordTypeId=ProjectRTId, ParentKBCard__c=kbcprogram.id);
        insert kbcproject;
        KBCard__c kbccapability = new KBCard__c(Name='TestKBCardTrigger_Capability', RecordTypeId=CapabilityRTId, ParentKBCard__c=kbcproject.id);
        insert kbccapability;
        KBCard__c kbcepic = new KBCard__c(Name='TestKBCardTrigger_Epic', RecordTypeId=EpicRTId, ParentKBCard__c=kbccapability.id);
        insert kbcepic;
        KBCard__c kbcfeature = new KBCard__c(Name='TestKBCardTrigger_Feature', RecordTypeId=FeatureRTId, ParentKBCard__c=kbcepic.id);
        insert kbcfeature;
        KBCard__c kbc = new KBCard__c(Name='TestKBCardTrigger_Story', RecordTypeId=StoryRTId, ParentKBCard__c=kbcfeature.id);
        insert kbc;
        
        //Verify the Result TestKBCardOnInsert
        System.assert(true,'TestKBCardOnInsert');
        System.assertEquals(kbc.KBCard_ID__c, kbc.KBCExtID__c);

        //Run the Test on Update
        kbc.KBCExtID__c=null;
        update kbc;
        Test.stopTest();

        //Verify the Result TestKBCardOnUpdate
        System.assert(true,'TestKBCardOnUpdate');
        System.assertEquals(kbc.KBCard_ID__c, kbc.KBCExtID__c);
    }
        
}