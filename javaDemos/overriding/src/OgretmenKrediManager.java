public class OgretmenKrediManager extends BaseKrediManager{
    public double hesapla(double tutar){
        System.out.println("Ogretmen Kredi Oranı");
        return tutar * 1.16;
    }
}
