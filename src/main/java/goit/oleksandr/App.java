package goit.oleksandr;

import goit.oleksandr.data.FlywayConfig;
import org.apache.log4j.Logger;
import goit.oleksandr.data.OsbbCrud;

import java.io.IOException;
import java.sql.SQLException;

public class App {

    private static final Logger logger = Logger.getLogger(App.class);
    public static void main(String[] args) {
        logger.info("The program has started");
        FlywayConfig.flywayMigration();
        try (OsbbCrud crud = new OsbbCrud().startConnection()){
            crud.printMembersWithoutCarAccess();
        } catch (SQLException | IOException e){
            logger.fatal(e);
        }

    }
}
