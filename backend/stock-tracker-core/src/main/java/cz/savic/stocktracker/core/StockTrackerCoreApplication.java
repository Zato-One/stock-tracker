package cz.savic.stocktracker.core;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

@Slf4j
@SpringBootApplication
public class StockTrackerCoreApplication {

    @Value("${server.port:8080}")
    private int port;

    public static void main(String[] args) {
        SpringApplication.run(StockTrackerCoreApplication.class, args);
    }

	@EventListener
	public void onApplicationReady(ApplicationReadyEvent event) {
        log.info("Application started: http://localhost:{}/", port);
        log.info("Swagger UI available at: http://localhost:{}/swagger-ui.html", port);
    }

}
