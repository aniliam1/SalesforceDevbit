// Test class for the previous class.
@isTest
private class Testaccws {
  testMethod static void testAccountCreate() {
    naccwebs.AccountInfo info = new naccwebs.AccountInfo();
    info.AcctName = 'Manoj Cheenath';
    info.AcctNumber = 12345;
    Account acct = naccwebs.createAccount(info);
    System.assert(acct != null);
  }
}