({
    doInit : function(component, event, helper) {
      component.set("v.rec",component.get("v.recordId"));
        
          helper.initialize(component);
    },
    
    handleActive: function (cmp, event, helper) {
        var tab = event.getSource();
        switch (tab.get('v.id')) {
            case 'accountInfo' :
     //   alert(cmp.get("v.accountid"));	
               helper.injectComponent('c:AccountInfoCmp', tab,cmp);
           //  helper.injectComponent('c:AccountInfoCmp', tab,"43252345234");
                break;
            case 'contactList' :
           //    alert(cmp.get("v.id"));
              
               // helper.injectComponent('c:shelfCmp', tab,cmp.get("v.recordId"));
                break;
            case 'eventlist' :
          //    alert(cmp.get("v.id"));
                // helper.injectComponent('c:hotelFolioCmp', tab,cmp.get("v.recordId"));
                break;
            case 'locationMap' :
        //    alert(cmp.get("v.id"));
            //    helper.injectComponent('c:contactInfoCmp', tab,cmp.get("v.recordId"));
                break;

        }
    }
})