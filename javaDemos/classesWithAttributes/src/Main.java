public class Main {
    public static void main(String[] args) {
        
        //Constructor ile çalışacaksak aşağıdaki yapıyı kullanırız.
        Product product = new Product(1, "Asus", "14 inch", 3400, 3, "Red", "12");

        //getter ve setter ile çalışacağımızda ise aşağıdaki şekilde kullanılırz
   /*    Product product = new Product();
        product.setId(1);
        product.setName("Laptop");
        product.setDescription("Asus 14 inch");
        product.setStockAmount(24);
        product.setKod("TR");
        product.setPrice(2421.5);
    */
        ProductManager productManager = new ProductManager();
        productManager.Add(product);
    }
}