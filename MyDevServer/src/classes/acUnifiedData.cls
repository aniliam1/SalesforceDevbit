public with sharing class acUnifiedData {
    
    @auraenabled
    Public static AccountschemaDef.Accountschema serverGetAccount ( id acId)
    
    {
       
        AccountschemaDef.Accountschema results = searchAcc(acId);

        return results;
              
    }
       @auraenabled
     public static AccountschemaDef.Accountschema searchAcc(id acIdS)
     {

            AccountschemaDef.Accountschema  results = new AccountschemaDef.Accountschema();
	
         Account ascm= [SELECT id,Name,Industry,Type FROM Account Where id = '0030v0000030bncAAA'];
                  results.accountId=ascm.id;
         	results.accountName=ascm.Name;
         	results.accType=ascm.Type;
         	results.department=ascm.Industry;
                                        
       return results;
     }
}