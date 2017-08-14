({
	
    handleClick: function(component, event, helper) {
        	var btnclick=event.getSource();
        var btnlabel=btnclick.get("v.label");
      helper.getCalc(component,btnlabel);
    },
    
        handleOps: function(component, event, helper) {
        	var btnclick=event.getSource();
       	 var btnlabel=btnclick.get("v.label");
    	  helper.getOps(component,btnlabel);
          component.set("v.LastOps",btnlabel);
            
          
    
    },
                           
})