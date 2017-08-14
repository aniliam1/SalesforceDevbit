trigger ContactAfterUpdate on Account (After insert, After Update) {
    
    
    for (Account acc:Trigger.new)
    {
        Contact[] C=  [Select Lastname,phone from contact where Accountid IN : Trigger.new];
        for (Contact c1:c)
        {
            c1.phone=acc.Phone;
            
        }
        update c;
        
    }

}