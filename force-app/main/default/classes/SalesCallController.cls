public class SalesCallController {   // no "with sharing" -> ignores record-level security
 
    public static List<Sales_Call__c> search(String name) {
        // SOQL injection: unsanitized user input concatenated into the query
        String q = 'SELECT Id, Name, Answered__c FROM Sales_Call__c ' +
                   'WHERE Name = \'' + name + '\'';
        return Database.query(q);
    }
 
    public static void updateCalls(List<Sales_Call__c> calls) {
        // no CRUD / FLS check before DML (isUpdateable / isAccessible not verified)
        update calls;
    }
}