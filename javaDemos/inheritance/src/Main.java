public class Main {
    public static void main(String[] args) {
        Customer customer = new Customer();
        System.out.println(customer.email);

        Employee employee = new Employee();
        employee.salary=32525;
        System.out.println(employee.salary);

        CustomerManager customerManager = new CustomerManager();
        customerManager.Add();
        customerManager.Gift();

        EmployeeManager employeeManager = new EmployeeManager();
        employeeManager.Add();
        employeeManager.Reject();
    }
}