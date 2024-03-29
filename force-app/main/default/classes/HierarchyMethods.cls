/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-31-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
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
        Id batchId = Database.executeBatch(kbcp, 30);        
    }
    
    public static void ResetCurrentRecordHierarchyFields(Id currentId){
        System.debug('here start');    
   		Id parentId;
        Boolean exitFunction = false;
        
        KBCard__c currentkbc = New KBCard__c();
        KBCard__c updatekbc = New KBCard__c();
        updatekbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:currentId];
        currentkbc=updatekbc;
        if(currentkbc.ParentKBCard__c==null && currentkbc.Level__c>1){
        	exitFunction = true;
        }         
        parentId=currentkbc.ParentKBCard__c;
        System.debug('Current='+currentkbc.Name);  
        
        updatekbc.HierarchyFeature__c=null;
        updatekbc.HierarchyEpic__c=null;
        updatekbc.HierarchyCapability__c=null;
        updatekbc.HierarchyProject__c=null;
        updatekbc.HierarchyProgram__c=null;
        
        if(updatekbc.KBCExtID__c == null || updatekbc.KBCExtID__c == ''){                
            updatekbc.KBCExtID__c = updatekbc.KBCard_ID__c;                    
        }
        if(currentkbc.Level__c==6 && exitFunction==false){
            System.debug('level 6');
            updatekbc.HierarchyFeature__c=currentkbc.ParentKBCard__c;
            update updatekbc;            
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            if(currentkbc.ParentKBCard__c==null){
        		exitFunction = true;
        	}  
            parentId=currentkbc.ParentKBCard__c;
        }
        if(currentkbc.Level__c==5 && exitFunction==false){
            System.debug('level 5');
            updatekbc.HierarchyEpic__c=currentkbc.ParentKBCard__c;
            update updatekbc;            
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            if(currentkbc.ParentKBCard__c==null){
        		exitFunction = true;
        	}  
            parentId=currentkbc.ParentKBCard__c;
        }
        if(currentkbc.Level__c==4 && exitFunction==false){
            System.debug('level 4');
            updatekbc.HierarchyCapability__c=currentkbc.ParentKBCard__c;
            update updatekbc;            
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            if(currentkbc.ParentKBCard__c==null){
        		exitFunction = true;
        	}  
            parentId=currentkbc.ParentKBCard__c;
        }
        if(currentkbc.Level__c==3 && exitFunction==false){
            System.debug('level 3');
            updatekbc.HierarchyProject__c=currentkbc.ParentKBCard__c;
            update updatekbc;            
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            if(currentkbc.ParentKBCard__c==null){
        		exitFunction = true;
        	}  
            parentId=currentkbc.ParentKBCard__c;
        }   
        if(currentkbc.Level__c==2 && exitFunction==false){
            System.debug('level 2');
            updatekbc.HierarchyProgram__c=currentkbc.ParentKBCard__c;
            update updatekbc;
            currentkbc = New KBCard__c();            
            currentkbc=[Select id, KBCard_ID__c, KBCExtID__c, Level__c, ParentKBCard__c, Name from KBCard__c where id=:parentId];
            if(currentkbc.ParentKBCard__c==null){
        		exitFunction = true;
        	}  
            parentId=currentkbc.ParentKBCard__c;
        }     
        
    }
}