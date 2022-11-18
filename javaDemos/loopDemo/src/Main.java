public class Main {
    public static void main(String[] args) {
        //for
        for (int i = 2; i < 11; i += 2) {
            System.out.println(i);
        } System.out.println("Döngü Bitti");

            System.out.println("-------------------------");

        int i = 0;
        // While
        while (i < 10) {
            System.out.println(i);
            i += 2;
        }
        System.out.println("While Döngüsü Bitti");

        System.out.println("-------------------------");

        int j=100;
        do{
            System.out.println("Loglandı");
            System.out.println(j);
            j+=2;
        }while(j<10);
        System.out.println("Do-While Döngüsü Bitti");
    }
}