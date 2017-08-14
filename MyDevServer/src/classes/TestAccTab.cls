@isTest
Private class TestAccTab {


        @isTest static void TestgetAcc()
        {
                 List<Account> Acres =  createTestRecord();
             System.assert(Account.Name !=null);
            
        }
    
       static List<Account> createTestRecord()
      {
         Account AcccTest = new Account(
			  Name='TestAc',
              Type='TestType',
              Industry='IT',
              phone='9999999999');
        insert AcccTest;
       List<Account> Account = new List<Account>{AcccTest};

        return Account;
          
      }
        
    
    
    
}