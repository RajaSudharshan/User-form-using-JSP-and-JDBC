# User Details Form

This project demonstrates a simple web application to capture user details (Name and Age) and store them in a MySQL database using JSP and Servlets.

## Prerequisites

1. **Java Development Kit (JDK)**: Ensure you have JDK 8 or later installed on your system.
2. **Apache Tomcat**: You need a servlet container like Apache Tomcat to run the web application. [Download Apache Tomcat](https://tomcat.apache.org/download-90.cgi)
3. **MySQL Database**: Install MySQL and create a database named `userdb`.
4. **JDBC Driver for MySQL**: Download the MySQL JDBC driver JAR file.

## Installation

1. **Clone the Repository**

    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Create MySQL Database**

    - Log in to MySQL and create the database and table:

      ```sql
      CREATE DATABASE userdb;
      USE userdb;
      CREATE TABLE users (
          id INT AUTO_INCREMENT PRIMARY KEY,
          name VARCHAR(255) NOT NULL,
          age INT NOT NULL
      );
      ```

3. **Download JDBC Driver**

    - Download the MySQL JDBC driver JAR file from the [official MySQL website](https://dev.mysql.com/downloads/connector/j/).
    - Place the JAR file (e.g., `mysql-connector-java-x.x.x.jar`) in the `lib` directory of your Apache Tomcat installation.

4. **Configure Apache Tomcat**

    - Place the web application (including the JSP and HTML files) in the `webapps` directory of your Apache Tomcat installation.
    - Ensure that the JDBC driver JAR file is located in the `lib` directory of Apache Tomcat.

5. **Deploy and Run the Application**

    - Start Apache Tomcat using the startup script provided in the `bin` directory of your Tomcat installation.

    - Access the application in your web browser:

      ```
      http://localhost:8080/<project-name>/index.html
      ```

## Usage

1. Open `index.html` in your browser.
2. Enter the user details and submit the form.
3. You will be redirected to a page showing the submitted details or an error message.

## Troubleshooting

- **Database Connection Issues**: Ensure that the MySQL server is running, and the database credentials are correct.
- **JDBC Driver Not Found**: Verify that the JDBC driver JAR file is correctly placed in the `lib` directory of Apache Tomcat.

## Acknowledgements

- [Apache Tomcat](https://tomcat.apache.org/download-90.cgi)
- [MySQL](https://www.mysql.com/)
- [JDBC Driver for MySQL](https://dev.mysql.com/downloads/connector/j/)
