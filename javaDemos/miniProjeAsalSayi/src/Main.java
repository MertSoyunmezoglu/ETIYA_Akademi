public class Main {
    public static void main(String[] args) {
        int sayi=32;
        boolean asalMi=true;

        if(sayi == 1){
            System.out.println("Sayı asal değildir ");
            return;
        }
        if(sayi<1){
            System.out.println("Geçersiz sayı");
            return;
        }

        for(int i=2; i<sayi;i++){
            if (sayi % i==0){
                asalMi=false;
                break;
            }
        }
        if(asalMi == true){
            System.out.println("Sayi Asaldır " + sayi);
        }
        else {
            System.out.println("Sayi Asal değildir " + sayi);
        }
    }
}