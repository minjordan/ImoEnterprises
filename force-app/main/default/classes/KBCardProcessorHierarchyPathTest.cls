@isTest
public class KBCardProcessorHierarchyPathTest {
	@testSetup 
    static void setup() {
		Id ProgramRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Program').getRecordTypeId();
        Id parentProgramID1;
        Id parentProgramID2;
        //Update Level 1 - Program
        KBCard__c kbc=new KBCard__c();
        kbc.RecordTypeId=ProgramRTId;
        kbc.Name='T_SFLL';
        kbc.KBCExtID__c='T_PRG-000001';
        kbc.Entity__c='Imo Enterprises (IE)';
        kbc.Type__c='NA';
        kbc.Status__c='1-Backlog';
        kbc.ParentKBCard__c=null;
        insert kbc;
        parentProgramID1= kbc.id;
        System.debug('TSFLL id=' + parentProgramID1);
        
        kbc=new KBCard__c();
        kbc.RecordTypeId=ProgramRTId;
        kbc.Name='T_Another_Program';
        kbc.KBCExtID__c='T_PRG-000002';
        kbc.Entity__c='Imo Enterprises (IE)';
        kbc.Type__c='NA';
        kbc.Status__c='1-Backlog';
        kbc.ParentKBCard__c=null;
        insert kbc;
        parentProgramID2= kbc.id;
        System.debug('T_Another_Program id=' + parentProgramID2);
    }

    static testmethod void test() {  
        Test.startTest();
        KBCardProcessorHierarchyPath kbcp = new KBCardProcessorHierarchyPath();
        Id batchId = Database.executeBatch(kbcp);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(2, [select count() from KBCard__c where HierarchyPath__c != '']);
    }
}