package config;
//서블릭콘텍스트 리스너
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppInitializer implements ServletContextListener{
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("[SERVER] oracle connect library load sucess");
		}catch( Exception e) {
			e.printStackTrace();
			System.out.println("[SERVER] ojdbc library load failed");
			System.exit(0);
		}
	}

}
