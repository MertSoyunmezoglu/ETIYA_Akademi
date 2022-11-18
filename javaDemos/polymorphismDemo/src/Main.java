public class Main {
    public static void main(String[] args) {
  /*  BaseLogger[] loggers = new  BaseLogger[]{new FileLogger(),new DataBaseLogger(), new EmailLogger()};

    for(BaseLogger logger:loggers){
        logger.Log("Base Logger inheritance");
    }*/
        CustomerManager customerManager = new CustomerManager(new EmailLogger());
        customerManager.Add();
    }
}