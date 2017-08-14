global class vCalculatorConc {
 @AuraEnabled
    public static String Calculate(String Lops,Integer GloA,Integer InV) {
   
		     String result = ' ';
            if (Lops=='+'){
           WsdlCalculator.ICalculator calculator = new  WsdlCalculator.ICalculator();
              Double x = double.valueOf(GloA);
               Double y = double.valueOf(InV);
                  Double r1 = Calculator.add(x,y);  
               	
                result=String.valueOf(r1);
                Return result; 
            }
        else{
            
             Return ''; 
        }
        
       
    }


}