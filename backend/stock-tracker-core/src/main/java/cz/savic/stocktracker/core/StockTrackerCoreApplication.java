package cz.savic.stocktracker.core;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class StockTrackerCoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(StockTrackerCoreApplication.class, args);
	}

	@Bean
	public CommandLineRunner commandLineRunner() {
		return args -> {
			System.out.println("Application started: http://localhost:8080/");
			// TODO - add swagger later
//			System.out.println("Swagger UI available at: http://localhost:8080/swagger-ui.html");
		};
	}

}
