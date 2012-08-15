package beans;

import java.sql.SQLException;

public class Test
	{
		private String availableTables[];
		private int numberOfQuestionsInEachTable[], totalNumberOfQuestions;
		private int counter;
		private int currentQuestionNumber;
		private DatabaseConnection databaseConnection;

		public Test(String availableTables[]) throws SQLException,
				ClassNotFoundException, NullPointerException
			{
				if (availableTables.length <= 0)
					throw new NullPointerException("Invalid Table Names");

				databaseConnection = new DatabaseConnection("myDS");
				this.availableTables = availableTables;
				totalNumberOfQuestions = 0;
				numberOfQuestionsInEachTable = new int[this.availableTables.length];
				for (int i = 0; i < this.availableTables.length; i++)
					{
						databaseConnection.executeQuery("select count(*) as COUNT from "
								+ this.availableTables[i]);
						databaseConnection.resultSet.next();
						numberOfQuestionsInEachTable[i] = Integer
								.parseInt(databaseConnection.resultSet.getString("COUNT"));
						totalNumberOfQuestions += numberOfQuestionsInEachTable[i];
					}
				databaseConnection.disconnect();
			}

		public int getTotalLimit()
			{
				return totalNumberOfQuestions;
			}

		public void getRowFromTable(int questionNumber, Question question)
				throws SQLException, ClassNotFoundException
			{
				databaseConnection = new DatabaseConnection("myDS");
				for (counter = 0; counter < numberOfQuestionsInEachTable.length; counter++)
					{
						if (questionNumber < numberOfQuestionsInEachTable[counter])
							{
								databaseConnection.executeQuery("select * from "
										+ availableTables[counter] + " where Number="
										+ questionNumber);
								this.currentQuestionNumber = questionNumber;
								databaseConnection.resultSet.next();
								question.setQuestion(databaseConnection.resultSet
										.getString("Question"));
								question.setAnswer(databaseConnection.resultSet
										.getString("Answer"));
								question.setO1(databaseConnection.resultSet
										.getString("O1"));
								question.setO2(databaseConnection.resultSet
										.getString("O2"));
								question.setO3(databaseConnection.resultSet
										.getString("O3"));
								question.setO4(databaseConnection.resultSet
										.getString("O4"));
								question.setFlag(0);
								break;
							} else
							{
								questionNumber -= numberOfQuestionsInEachTable[counter];
							}
					}
				databaseConnection.disconnect();
			}

		public String getQuestionDetails()
			{
				return availableTables[counter] + " " + currentQuestionNumber;
			}
	}
