public class EntityHierarchyMethods {
//Write it the expensive way first.. At some point this should be all done in cache and then updated in batch
// EntityHierarchyMethods.ResetEntityHierarchy();
// 
	static integer currentHierarchySort=0;
    public static void ResetEntityHierarchy(){
    	EntityHierarchyMethods.IterateEntityHierarchy(null, 0);
    }
    
    public static void IterateEntityHierarchy(ID parentID, integer iLevel){
        integer currentLevel=iLevel;
        String p='';
		p=p.leftPad(currentLevel*5,'-');
        currentLevel++;
        List<Entity__c> iterateEntities = [SELECT Id, Name, Level__c, LineDisplay__c, ParentEntity__c FROM Entity__c WHERE ParentEntity__c=:parentId ORDER BY Name];
        for(Entity__c e : iterateEntities){
            currentHierarchySort=currentHierarchySort + 1;
            System.debug('currentHierarchySort=' + currentHierarchySort + '  Name=' + e.Name);
			e.HierarchySort__c=currentHierarchySort;
            e.Level__c=currentLevel;
            e.LineDisplay__c=p + e.Name;
            update e;
    		EntityHierarchyMethods.IterateEntityHierarchy(e.Id, currentLevel);
            
        }
        
    }
}