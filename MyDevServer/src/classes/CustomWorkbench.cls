public with sharing class CustomWorkbench {

 public string header{get;set;}
    public List<wrapper> lstwrapper {get; set;}
    public class wrapper{
        public string name {get; set;}
        public string id{get; set;}
        public string city{get; set;}
        public string state{get; set;}

    public boolean isExcel {get;set;}
    public boolean isCsv {get;set;}   
    }


 
    public CustomWorkbench(){
  //          Filetype = '';
            lstwrapper = new List<wrapper>();
   //         header = 'Ship To,Search Number,Account Name,Business Unit,Date,Expiration Date,Expiration End Date,Expiration Start Date,Group,Implant Date ,Invoice Date,Invoice Number\r\n';                     
    }

    public List<sObject> recordlist { get; set; }
    public String query1 { get; set; }
    public List<String> fieldNameToString { get; set; }
    public List<SelectOption> fieldNames{get; set;}
    public String CorrespondingFields{ get; set; }
    public String AllObjectsList { get; set; }
    public List<String> SelfieldNameToString { get; set; }
    
        
    public PageReference DisplayRecords() {
        if(CorrespondingFields != null){
            integer length = CorrespondingFields.length();
            CorrespondingFields= CorrespondingFields.substring(1,length-1);
            String[] separate = CorrespondingFields.split(',\\s*');
                  SelfieldNameToString = new List<String>();
            for (String var:separate){
           	           SelfieldNameToString.add(var);
                 }	
                      
            query1 = 'Select ' + CorrespondingFields + ' from ' + AllObjectsList;
            try{
            recordlist.clear();
            }
            catch(Exception es){
                ApexPages.addMessages(es);
            }
       
        }
        return null;
    }
    
    
    
       public PageReference exportToExcel(){
          string queryString = 'Select name, id from account'; 
          List<account> aname = DataBase.Query(queryString);
          system.debug('aname :'+aname.size());
          if(aname.size()>0){
              for(account csd :aname){
                  wrapper w = new wrapper();
                  w.name = csd.name ;
                  w.id = csd.id;
                  lstwrapper.add(w);               
              }             
          }
         return null;
       }
    
    
    
    
      public PageReference RunQuery() {
      //  if(query1 != null){
           
            try{
          
           
              recordlist = Database.query(query1);
            }
            catch(Exception es){
                ApexPages.addMessages(es);
            }
       
    //    }
        return null;
    } 
    

    

    
    
    public void getAllFields() {
         fieldNameToString = new List<String>();
        fieldNames = new List<SelectOption>();
        if(AllObjectsList != null){
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjectSchema = schemaMap.get(AllObjectsList);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            
            for(String fieldName: fieldMap.keySet()) {  
                fieldNames.add(new SelectOption(fieldName,fieldName));
                fieldNameToString.add(fieldName);
                //  fieldNameToString = (List<String>)fieldNames;
            }
        }
      
    
    }

    public List<SelectOption> getAllObjects() {
        List<Schema.sObjectType> gd = Schema.getGlobalDescribe().Values();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','--------Select--------'));
        for(Schema.sObjectType gd1 : gd){
            options.add(new SelectOption(gd1.getDescribe().getName(),gd1.getDescribe().getName()));
        }
        options.sort();
        return options;
    }

    public List<sObject> getDisplayRecords() {
        if(CorrespondingFields != null){
            integer length = CorrespondingFields.length();
            CorrespondingFields= CorrespondingFields.substring(1,length-1);
       	
            String[] separate = CorrespondingFields.split(',\\s*');
            System.debug('separate :' + separate[0] );
      
             
          //       query1 = 'Select ' + CorrespondingFields + ' from ' + AllObjectsList;
      //      recordlist = Database.query(query1);
      
        }
        return recordlist ;
    }
}