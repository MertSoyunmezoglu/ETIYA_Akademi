public class Main {
    public static void main(String[] args) {
        Product laptop=new Product();
        laptop.name="Gaming Laptop";
        laptop.price=10000;

        ProductManager manager=new ProductManager();
        manager.Add(laptop);
    }
}