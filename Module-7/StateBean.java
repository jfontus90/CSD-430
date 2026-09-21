package beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * StateBean connects the JSP application to the CSD430 database.
 * It retrieves state IDs and state information from the
 * jasmine_states_data table.
 */
public class StateBean implements Serializable {

    private static final long serialVersionUID = 1L;

    // Database connection information
    private String url = "jdbc:mysql://localhost:3306/CSD430";
    private String username = "student1";
    private String password = "pass";

    // State fields
    private int stateId;
    private String stateName;
    private String abbreviation;
    private String capital;
    private String region;
    private int population;

    /**
     * Default constructor for the JavaBean.
     */
    public StateBean() {
    }

    // Getter methods

    public int getStateId() {
        return stateId;
    }

    public String getStateName() {
        return stateName;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public String getCapital() {
        return capital;
    }

    public String getRegion() {
        return region;
    }

    public int getPopulation() {
        return population;
    }

    /**
     * Gets all state IDs from the database.
     * These IDs will be displayed in the JSP dropdown menu.
     */
    public List<Integer> getStateIds() {

        List<Integer> stateIds = new ArrayList<Integer>();

        String sql =
            "SELECT state_id FROM jasmine_states_data ORDER BY state_id";

        try (
            Connection connection =
                DriverManager.getConnection(url, username, password);

            PreparedStatement statement =
                connection.prepareStatement(sql);

            ResultSet results =
                statement.executeQuery();
        ) {

            while (results.next()) {
                stateIds.add(results.getInt("state_id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return stateIds;
    }

    /**
     * Gets one state record based on the selected state ID.
     *
     * @param id selected state ID
     * @return true if the state is found, otherwise false
     */
    public boolean getStateById(int id) {

        String sql =
            "SELECT * FROM jasmine_states_data WHERE state_id = ?";

        try (
            Connection connection =
                DriverManager.getConnection(url, username, password);

            PreparedStatement statement =
                connection.prepareStatement(sql);
        ) {

            statement.setInt(1, id);

            try (ResultSet results = statement.executeQuery()) {

                if (results.next()) {

                    stateId = results.getInt("state_id");
                    stateName = results.getString("state_name");
                    abbreviation = results.getString("abbreviation");
                    capital = results.getString("capital");
                    region = results.getString("region");
                    population = results.getInt("population");

                    return true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}