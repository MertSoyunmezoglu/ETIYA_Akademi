public class Main {
    public static void main(String[] args) {
        Product product1 = new Product();
        product1.unitPrice = 50;
        product1.discountRate=13.5;
        product1.setName("Deri Bot")  ;
        product1.stock = 23;
        product1.imageUrl ="bot.jpeg";

        Product product2 = new Product();
        product2.stock=12;

        Product product3 = new Product(15,3);
        System.out.println(product1.getName());
    }
}