public class OnScratchOrgCreation {
/* to execute
 * 
 * OnScratchOrgCreation.CreateOrgRecords();
 *
*/  
    
    public static void CreateOrgRecords(){

    	Id ProgramRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Program').getRecordTypeId();
    	Id ProjectRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Project').getRecordTypeId();
    	Id CapabilityRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Capability').getRecordTypeId();
    	Id EpicRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Epic').getRecordTypeId();
    	Id FeatureRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Feature').getRecordTypeId();
    	Id StoryRTId = Schema.SObjectType.KBCard__c.getRecordTypeInfosByDeveloperName().get('Story').getRecordTypeId();

        Id parentProgramID1;
        Id parentProgramID2;
        Id parentProjectID1;
        Id parentProjectID2;
        Id parentCapabilityID1;
        ID parentCapabilityID2;
        ID parentEpicID1;
        ID parentEpicID2;
        ID parentFeatureID1;
        ID parentFeatureID2;
        ID parentStoryID1;
        ID parentStoryID2;
        ID parentKBCardID;
   
        try {
          
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
            
        	//Update Level 2 - Projects
            kbc=new KBCard__c();
            kbc.RecordTypeId=ProjectRTId;
            kbc.Name='T_IE_R';
            kbc.KBCExtID__c='T_SFLL-000001';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='Research';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentProgramID1;
            insert kbc;
            parentProjectID1= kbc.id;
            System.debug('T_IE_R id=' + parentProjectID1 );
   
            kbc=new KBCard__c();
            kbc.RecordTypeId=ProjectRTId;
            kbc.Name='T_IE_S';
            kbc.KBCExtID__c='T_SFLL-000006';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='Software';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentProgramID1;
            insert kbc;
            parentProjectID2= kbc.id;
            System.debug('T_IE_S id=' + parentProjectID2 );
            
            //Update Level 3 - Capabilities
            kbc=new KBCard__c();
            kbc.RecordTypeId=CapabilityRTId;
            kbc.Name='T_Finance';
            kbc.KBCExtID__c='T_IE_S-001';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentProjectID2;
            insert kbc;
            parentCapabilityID1= kbc.id;
            System.debug('T_Finance id=' + parentCapabilityID1);           

            kbc=new KBCard__c();
            kbc.RecordTypeId=CapabilityRTId;
            kbc.Name='T_Project_Management';
            kbc.KBCExtID__c='T_IE_S-007';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentProjectID2;
            insert kbc;
            parentCapabilityID2= kbc.id;
            System.debug('T_Project_Management id=' + parentCapabilityID2);    
            
            //Update Level 4 - Epics
            kbc=new KBCard__c();
            kbc.RecordTypeId=EpicRTId;
            kbc.Name='T_Software_Utilities';
            kbc.KBCExtID__c='T_IESPM-0001';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentCapabilityID2;
            insert kbc;
            parentEpicID1= kbc.id;
            System.debug('T_Software_Utilities id=' + parentEpicID1);    

            kbc=new KBCard__c();
            kbc.RecordTypeId=EpicRTId;
            kbc.Name='T_Kanban_Cards_User_Interface';
            kbc.KBCExtID__c='T_IESPM-0002';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentCapabilityID2;
            insert kbc;
            parentEpicID2= kbc.id;
            System.debug('T_Kanban_Cards_User_Interface id=' + parentEpicID2);   

            //Update Level 5 - Features
            kbc=new KBCard__c();
            kbc.RecordTypeId=FeatureRTId;
            kbc.Name='T_Hierarchy_Utilities';
            kbc.KBCExtID__c='T_IESPMF-0001';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentEpicID1;
            insert kbc;
            parentFeatureID1= kbc.id;
            System.debug('T_Hierarchy_Utilities id=' + parentFeatureID1);    

            kbc=new KBCard__c();
            kbc.RecordTypeId=FeatureRTId;
            kbc.Name='T_Kanban_Card_Object_Record_Types_Permissions ';
            kbc.KBCExtID__c='T_IESPMF-0002';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentEpicID2;
            insert kbc;
            parentFeatureID2= kbc.id;
            System.debug('T_Kanban_Card_Object_Record_Types_Permissions id=' + parentFeatureID2);    

            //Update Level 6 - Stories
            kbc=new KBCard__c();
            kbc.RecordTypeId=StoryRTId;
            kbc.Name='T_Generate_Hierarchy_Records';
            kbc.KBCExtID__c='IESPMS-0001';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentFeatureID1;
            insert kbc;
            parentStoryID1= kbc.id;
            System.debug('T_Generate_Hierarchy_Records id=' + parentStoryID1);    

            kbc=new KBCard__c();
            kbc.RecordTypeId=StoryRTId;
            kbc.Name='T_Update_Source_Object_Hierarchy';
            kbc.KBCExtID__c='IESPMS-0002';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentFeatureID1;
            insert kbc;
            parentStoryID2= kbc.id;
            System.debug('T_Update_Source_Object_Hierarchy id=' + parentStoryID2); 

            kbc=new KBCard__c();
            kbc.RecordTypeId=StoryRTId;
            kbc.Name='T_SFLL_Superuser';
            kbc.KBCExtID__c='IESPMS-0003';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentFeatureID2;
            insert kbc;
            parentStoryID1= kbc.id;
            System.debug('T_SFLL_Superuser id=' + parentStoryID1);    

            kbc=new KBCard__c();
            kbc.RecordTypeId=StoryRTId;
            kbc.Name='T_Kanban_Object_Record_Type';
            kbc.KBCExtID__c='IESPMS-0004';
            kbc.Entity__c='Imo Enterprises (IE)';
            kbc.Type__c='NA';
            kbc.Status__c='1-Backlog';
            kbc.ParentKBCard__c=parentFeatureID2;
            insert kbc;
            parentStoryID2= kbc.id;
            System.debug('T_Kanban_Object_Record_Type id=' + parentStoryID2);      
            
            HierarchyMethods.ResetAllKBCardHierarchyPath();
            
        } catch(DmlException e){
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        
       
	}
}