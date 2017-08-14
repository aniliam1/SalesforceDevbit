({
	injectComponent: function (name, target,cmpName) {
        $A.createComponent(name, {"v.recordId": cmpName
        }, function (contentComponent, status, error) {
            alert(status);
            if (status === "SUCCESS") {
                target.set('v.body', contentComponent);
               
            } else {
                throw new Error(error);
            }
        });
    }
})