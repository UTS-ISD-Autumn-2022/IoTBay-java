package au.edu.uts.isd.iotbay.models;

import java.sql.*;
import com.zaxxer.hikari.*;

public class DbContext {
    private static DbContext dbCtx = null;
    private HikariDataSource dataSource;

    private DbContext() {
        HikariConfig config = new HikariConfig("database.properties");
        dataSource = new HikariDataSource(config);
    }

    private HikariDataSource getDataSource() {
        return dataSource;
    }

    public static Connection getConn() throws SQLException {
        if (dbCtx == null) {
            dbCtx = new DbContext();
        }

        return dbCtx.getDataSource().getConnection();
    }
}