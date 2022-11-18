public class Product {


    private String name;
    private double unitPrice;
    private String imageUrl;
    private double discountRate;
    private int stock;
    public Product(){

    }

    public Product(String name, double unitPrice, String imageUrl, double discountRate, int stock) {
        this.name = name;
        this.unitPrice = unitPrice;
        this.imageUrl = imageUrl;
        this.discountRate = discountRate;
        this.stock = stock;
    }

    public void setName(String name){
        this.name = name;
    }
    public String getName(){
        return this.name;
    }
    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(double discountRate) {
        this.discountRate = discountRate;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

}
