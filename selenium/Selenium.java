package selenium;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Selenium {

    public static WebDriver driver;
    public static String base_url = "https://www.melon.com/chart/index.htm";
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:\\Users\\kopo\\Desktop\\sel\\chromedriver.exe";

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        // TODO Auto-generated method stub
        // Properties
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.16:3306/kopoctc", "root", "kopoctc");

        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        driver = new ChromeDriver();
        crawl();
    }

    public static void crawl() {
          try {              
              driver.get(base_url); //url 열겠다
              Thread.sleep(1000);
              List<WebElement> musList = driver.findElements(By.xpath("/html/body/div/div[3]/div/div/div[3]/form/div/table/tbody/tr"));
              List<List<String>> List = new ArrayList<List<String>>();
              List<String> OneLine = new ArrayList<String>();
              int cnt = 1;
              for(WebElement webElement : musList) {
                  String[] sp = webElement.getText().split("\n");
                  OneLine = Arrays.asList(sp);
                  List.add(OneLine);
              }
              //System.out.println(List.get(0).get(0) + " " + List.get(0).get(1));    //제목, 가수

          }catch(Exception e)  {
              
          }finally {

          }
    }
}
