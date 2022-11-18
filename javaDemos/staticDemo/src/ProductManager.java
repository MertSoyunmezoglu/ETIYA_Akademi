public class ProductManager {
    public void Add(Product product){
        if (ProductValidator.isValid(product))
        {
            System.out.println("Eklendi..");
        }else {
            System.out.println("Bilgileri kontrol ediniz");
        }
    }
}
