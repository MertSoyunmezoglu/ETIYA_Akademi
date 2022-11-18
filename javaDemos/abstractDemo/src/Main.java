public class Main {
    public static void main(String[] args) {
       CustomerManager customerManager = new CustomerManager();
       customerManager.databaseManager = new SqlServerDatabaseManager();
       customerManager.getCustomers();

        CustomerManager customerManager2 = new CustomerManager();
        customerManager2.databaseManager = new OracleDatabaseManager();
        customerManager2.getCustomers();
    }
}