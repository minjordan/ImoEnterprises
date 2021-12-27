public class EntityHierarchyMethods {
//Write it the expensive way first
// EntityHierarchyMethods.ResetEntityHierarchy();
// 
	
    public static void ResetEntityHierarchy(){
    	EntityHierarchyMethods.IterateEntityHierarchy(null, 0, 0);
    }
    
    public static void IterateEntityHierarchy(ID parentID, integer iLevel, integer iHierarchySort){
        integer currentLevel=iLevel;
        integer currentHierarchySort=iHierarchySort;
        String p='';
		p=p.leftPad(currentLevel*5,'-');
        currentLevel++;
        List<Entity__c> iterateEntities = [SELECT Id, Name, Level__c, LineDisplay__c, ParentEntity__c FROM Entity__c WHERE ParentEntity__c=:parentId ORDER BY Name];
        for(Entity__c e : iterateEntities){
            currentHierarchySort++;
            System.debug('currentHierarchySort=' + currentHierarchySort + '  Name=' + e.Name);
			e.HierarchySort__c=currentHierarchySort;
            e.Level__c=currentLevel;
            e.LineDisplay__c=p + e.Name;
            update e;
    		EntityHierarchyMethods.IterateEntityHierarchy(e.Id, currentLevel, currentHierarchySort);
            
        }
        
    }
}