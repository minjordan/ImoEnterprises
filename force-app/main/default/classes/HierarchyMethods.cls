public class HierarchyMethods {
/* to execute
 * 
 * HierarchyMethods.ResetAllKBCardHierarchyPath();
 *
 * https://www.sfdcpoint.com/salesforce/batch-apex-example-in-salesforce/  
 * 
 * HierarchyMethods.ResetCurrentRecordHierarchyFields('a012D000003ZTuDQAW');
 * 
*/  
    public static void ResetAllKBCardHierarchyPath(){
        KBCardProcessorHierarchyPath kbcp = new KBCardProcessorHierarchyPath();
        Id batchId = Database.executeBatch(kbcp);        
    }
    
    public static void ResetCurrentRecordHierarchyFields(Id currentId){
        System.debug('here start');        
		Id parentId;
        
        KBCard__c currentkbc = New KBCard__c();
        KBCard__c updatekbc = New KBCard__c();
        updatekbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:currentId];
        currentkbc=updatekbc;
        parentId=currentkbc.ParentKBCard__c;
        System.debug('Current='+currentkbc.Name);        
        if(currentkbc.Level__c==6){
            System.debug('level 6');
            updatekbc.HierarchyFeature__c=currentkbc.ParentKBCard__c;
            update updatekbc;            
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            parentId=currentkbc.ParentKBCard__c;
        }
        if(currentkbc.Level__c==5){
            System.debug('level 5');
            updatekbc.HierarchyEpic__c=currentkbc.ParentKBCard__c;
            update updatekbc;            
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            parentId=currentkbc.ParentKBCard__c;
        }
        if(currentkbc.Level__c==4){
            System.debug('level 4');
            updatekbc.HierarchyCapability__c=currentkbc.ParentKBCard__c;
            update updatekbc;            
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            parentId=currentkbc.ParentKBCard__c;
        }
        if(currentkbc.Level__c==3){
            System.debug('level 3');
            updatekbc.HierarchyProject__c=currentkbc.ParentKBCard__c;
            update updatekbc;            
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            parentId=currentkbc.ParentKBCard__c;
        }   
        if(currentkbc.Level__c==2){
            System.debug('level 2');
            updatekbc.HierarchyProgram__c=currentkbc.ParentKBCard__c;
            update updatekbc;
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            parentId=currentkbc.ParentKBCard__c;
        }                         
    }
}