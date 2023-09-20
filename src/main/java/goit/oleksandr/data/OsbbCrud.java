package goit.oleksandr.data;

import static goit.oleksandr.Config.*;
import org.apache.log4j.Logger;
import org.flywaydb.core.Flyway;
import java.io.Closeable;
import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class OsbbCrud implements Closeable{
    private static final Logger logger = Logger.getLogger(OsbbCrud.class);
    private static final String sqlMembersWithoutCarAccessQuery = "SELECT \n" +
            "om.first_name, \n" +
            "om.second_name, \n" +
            "om.email, \n" +
            "b.building_adress, \n" +
            "f.flat_number, \n" +
            "f.area_m2\n" +
            "FROM OSBB_members AS om\n" +
            "JOIN Residents res ON om.member_id = res.member_id\n" +
            "JOIN Flats f ON res.flat_id = f.flat_id\n" +
            "JOIN Buildings b ON f.building_id = b.building_id\n" +
            "WHERE res.car_access = FALSE";
    private Connection connection = null;
    public OsbbCrud startConnection() throws SQLException{
        logger.info("Crud initialized");
        connection = DriverManager.getConnection(jdbcUrl, username, password);
        return this;
    }
    @Override
    public void close() throws IOException {
        try{
            connection.close();
            connection = null;
        }catch (SQLException e){
            throw new IOException(e);
        }
    }

    public List<Member> getMembersWithoutCarAccess() throws SQLException {
        logger.trace ("Call getting members without car access method");
        final List<Member> result = new LinkedList<>();
        try(PreparedStatement preparedStatement = connection.prepareStatement(sqlMembersWithoutCarAccessQuery)){
            final ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                        Member member = new Member();
                                member.setFirstName(resultSet.getString("first_name"));
                                member.setLastName(resultSet.getString("second_name"));
                                member.setEmail(resultSet.getString("email"));
                                member.setFlatNumber(resultSet.getInt("flat_number"));
                                member.setArea(resultSet.getInt("area_m2"));
                                member.setBuildingAdress(resultSet.getString("building_adress"));
                                result.add(member);
            }
        }
        return result;
    }

    public void printMembersWithoutCarAccess() throws SQLException {
        List<Member> members = getMembersWithoutCarAccess();
        for (Member member : members){
            System.out.println(member.toString());
        }
    }
}


