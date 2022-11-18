public class Main {
    public static void main(String[] args) {
         ekle();

        String yeniMesaj= sehirVer();
        System.out.println(yeniMesaj);
        System.out.println(topla(3,5));
        System.out.println(topla2(3,5,7,9));
    }
    public static void ekle(){
        System.out.println("Eklendi");
    }
    public static void sil(){
        System.out.println("sil");
    }
    public static void guncelle(){
        System.out.println("guncelle");
    }
    public static String sehirVer()
    {
        return "Ankara";
    }
    public static int topla(int x,int y){
        return x+y;
    }
    //Variable Argument düzeninde toplama JS deki Spread operatörü gibi bir int arrayi oluşturuyoruz
    public static int topla2( int... sayilar){
        int toplam=0;
        for (int sayi : sayilar){
           toplam +=sayi;
        }
        return toplam;
    }
}