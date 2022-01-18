global class KBCardHierarchyMethods {
// KBCardHierarchyMethods.ResetHierarchy();

    static integer currentHierarchySort=0;
       
    webservice static void ResetHierarchy(){
        KBCardHierarchyMethods.IterateHierarchy(null, 0);
    }
    public static void IterateHierarchy(ID parentID, integer iLevel){
        integer currentLevel=iLevel;
        String p='';
		p=p.leftPad(currentLevel*5,'-');
        currentLevel++;
        List<KBCard__c> iterateEntities = [SELECT Id, Name, Type__c, Level_Number__c, LineDisplay__c, ParentKBCard__c FROM KBCard__c WHERE ParentKBCard__c=:parentId ORDER BY Name];
        for(KBCard__c rec : iterateEntities){
            currentHierarchySort=currentHierarchySort + 1;
			rec.Hierarchy_Sort_Number__c=currentHierarchySort;
            rec.Level_Number__c=currentLevel;
            
            if (rec.Type__c != null){
                if (rec.Type__c != 'NA'){
                    rec.LineDisplay__c=p + rec.Name + ' ' + rec.Type__c;  
                } else {
                    rec.LineDisplay__c=p + rec.Name;
                }
            } else {
                rec.LineDisplay__c=p + rec.Name;
            }
            
            update rec;
    		KBCardHierarchyMethods.IterateHierarchy(rec.Id, currentLevel);
            
        }
        
    }
}