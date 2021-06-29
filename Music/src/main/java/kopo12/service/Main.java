package kopo12.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import kopo12.dao.MusicDao;
import kopo12.dao.MusicDaoImpl;

public class Main {

	public static WebDriver driver;
	public static String base_url = "https://www.melon.com/chart/index.htm";
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "C:\\Users\\kopo\\Desktop\\sel\\chromedriver.exe";
	public static List<List<String>> List;
	public static List<String> OneLine;

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		MusicDao musicdao = MusicDaoImpl.getInstance();
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		driver = new ChromeDriver();
		crawl();
		musicdao.create(List);
	}

	public static void crawl() {
		try {
			driver.get(base_url); // url 열겠다
			Thread.sleep(1000);
			List<WebElement> musList = driver
					.findElements(By.xpath("/html/body/div/div[3]/div/div/div[3]/form/div/table/tbody/tr"));
			List = new ArrayList<List<String>>();
			OneLine = new ArrayList<String>();

			for (WebElement webElement : musList) {
				String[] sp = webElement.getText().split("\n");
				OneLine = Arrays.asList(sp);
				List.add(OneLine);
			}
			

			base_url = "https://music.bugs.co.kr/chart/track/realtime/total?wl_ref=M_contents_03_01"; // 벅스
			driver.get(base_url);
			musList = driver
					.findElements(By.xpath("/html/body/div[2]/div[2]/article/section/div/div[1]/table/tbody/tr"));
			for (WebElement webElement : musList) {
				String[] sp = webElement.getText().split("\n");
				OneLine = Arrays.asList(sp);
				List.add(OneLine);
			}
			

			base_url = "https://www.genie.co.kr/chart/top200"; // 지니 1~50위
			driver.get(base_url);
			musList = driver.findElements(By.xpath("/html/body/div[3]/div[2]/div[1]/div[6]/div/table/tbody/tr"));
			for (WebElement webElement : musList) {
				String[] sp = webElement.getText().split("\n");
				OneLine = Arrays.asList(sp);
				List.add(OneLine);
			}
			

			driver.findElement(By.xpath("/html/body/div[3]/div[2]/div[1]/div[7]/a[2]")).click(); // 지니 51~100위
			Thread.sleep(1000);
			musList = driver.findElements(By.xpath("/html/body/div[3]/div[2]/div[1]/div[6]/div/table/tbody/tr"));
			for (WebElement webElement : musList) {
				String[] sp = webElement.getText().split("\n");
				OneLine = Arrays.asList(sp);
				List.add(OneLine);
			}

		} catch (Exception e) {

		} finally {
			driver.close();
		}
	}
}
