({
getAccountData: function(component, event, helper) {
        var action = component.get("c.serverGetAccount");
        action.setParams({        
         'acIdS'  : component.get('v.recordId')
            alert ("Test")
      });
    
       action.setCallback(this, function(response) {
            var state = response.getState();
           alert (state);
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.AccountSchemaDef", response.getReturnValue());
                alert ("v.AccountSchemaDef");
      //          this.updateTotal(component);
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
            }
        });
        $A.enqueueAction(action);
    
 //    action.setCallback(this, function(response) {
 //           if (response.getState() === "SUCCESS") {
 //               params.callback(null, response.getReturnValue());
 //           } else {
 //               params.callback(response.getError());
 //           }
 //       });
 //   	$A.enqueueAction(action);
      
}
})