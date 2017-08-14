trigger ContactBeforeUpdate on Contact (before Update) {
for (contact c:Trigger.new)
{
    c.Description ='Contact updated by '+userInfo.getUserName();    
}
    
    
}