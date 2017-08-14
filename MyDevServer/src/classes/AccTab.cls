public class AccTab {
    
     List<Account> accts;
          public List<Account> getAcc(){
             return accts;
         }
       
    
        public PageReference Accc() {
    
            accts=[Select Name, Type, Industry, phone from account where Type='Customer - Channel'];
    
            return null;
    
        }   
    
    
        public PageReference Accd() {
    	
            accts=[Select Name, Type, Industry, phone from account where Type='Customer - Direct'];
    
            return null;
    
        }   
    
    
}