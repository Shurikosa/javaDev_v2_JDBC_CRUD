package goit.oleksandr.data;

import org.apache.log4j.Logger;
import org.flywaydb.core.Flyway;

import static goit.oleksandr.Config.*;

public class FlywayConfig {

    private static final Logger logger = Logger.getLogger(FlywayConfig.class);

    private FlywayConfig(){

    }
    public static void flywayMigration(){
        logger.debug("Flyway migration execute");

        Flyway.configure()
                .dataSource(jdbcUrl, username, password)
                .locations("classpath:flyway/scripts")
                .load()
                .migrate();
    }
}
