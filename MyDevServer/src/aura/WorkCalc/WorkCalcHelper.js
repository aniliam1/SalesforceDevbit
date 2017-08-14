({
 getCalc: function(component,btnlabel) {
     
  	
       	var tot = component.find("amount");
        var totn = tot.get("v.value");
        
      
        if (isNaN(totn)||totn==''){
             component.set("v.InValue",btnlabel);
        } else {
        	component.set("v.InValue",totn+btnlabel);
        }
    
	},
    
  getOps: function(component) {
		
      	var loP=component.get("v.LastOps");
  
      	var loA=component.get("v.GlovalA");
        var loV=component.get("v.InValue");
      
        var action = component.get("c.Calculate");
         action.setParams({ "Lops": loP,"GloA": loA,"InV": loV });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
           //      alert("From server:" + response.getReturnValue());
              // var nmRes= data.getReturnvalue();
               var nmRes=response.getReturnValue();
                component.set("v.GlovalA",loV);
                component.set("v.InValue",nmRes);
    			
               
            }
           
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

        $A.enqueueAction(action);
    }               
})