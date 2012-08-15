package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection
	{
		public ResultSet resultSet;
		private Statement statement;
		private Connection connection;
		private String nameOfDriver;

		public void executeQuery(String Query) throws SQLException, NullPointerException
			{
				if (!connection.isClosed())
					{
						resultSet = statement.executeQuery(Query);
					} else
					throw new SQLException("Connection is not Open");

			}

		public void executeUpdate(String Query) throws SQLException, NullPointerException
			{
				if (!connection.isClosed())
					{
						statement.executeUpdate(Query);
					} else
					throw new SQLException("Connection is not Open");

			}

		private void connect() throws ClassNotFoundException, SQLException
			{
				disconnect();
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				connection = DriverManager.getConnection("jdbc:odbc:" + nameOfDriver, "",
						"");
				statement = connection.createStatement();
			}

		public void disconnect() throws SQLException
			{
				if (statement != null)
					statement.close();
				if (connection != null)
					connection.close();

				resultSet = null;
				statement = null;
				connection = null;

			}

		public DatabaseConnection(String nameOfDriver) throws ClassNotFoundException,
				SQLException
			{
				resultSet = null;
				statement = null;
				connection = null;
				this.nameOfDriver = nameOfDriver;
				this.connect();
			}

		@Override
		public void finalize() throws SQLException
			{
				disconnect();
				try
					{
						super.finalize();
					}
				catch (Throwable throwable)
					{
						throwable.printStackTrace();
					}
			}

	}
