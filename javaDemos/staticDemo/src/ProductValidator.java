public class ProductValidator {

    static {
        System.out.println("Static Constructor Çalıştı..");
    }
    public ProductValidator(){
        System.out.println("Constructor Çalıştı..");
    }

    public static boolean  isValid(Product product){
        return product.price>0 && !product.name.isEmpty();
    }
}
