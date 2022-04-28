# Discussion 14 - Friday, April 29<sup>th</sup>


## Recap

Go over last week's discussion (Box, Rc, Refcell) if you did not finish or if students have questions 

## Lambda Calculus Review

Go over lambda calculus problems as located on the 330 webpage to review for the quiz due today

## Final Exam Review 

Start walking through a practice final exam located on the 330 webpage 







## Web Security Review (NOT DOING THIS ANYMORE)
* Even established programming languages are subject to issues; we'll see how popular languages like HTML and SQL can be exploited, and how we can protect ourselves from that
* The important thing to note is that programming languages are growing and changing; what works well today might not work tomorrow
* HTML 
  * Websites are composed of a lot of parts, including a server, front-end display, etc.
  * There are a lot of different languages that play a role here
  * HTML and CSS are in charge of the static front-end display. When you see staticimages or hyperlinks on a webpage, or even just the header or lines of text, that is all HTML and CSS
  * Javascript provides the dynamic parts of a webpage, such as alerts like we saw
last week
  * Script tags are HTML tags that run Javascript; in general these are useful when you want parts of your website to be dynamic, but it’s not enough to write a full Javascript file. For convenience, you can use the script tags
  * We can manipulate the HTML on a webpage to inject Javascript attacks, like we saw last week with the script tags and alert() function
* SQL
  * For SQL, all you’ll really need to know for the purposes of this class and project are select queries
  * The syntax of a select query is: SELECT attributes FROM table WHERE predicate;
    * Attributes are just columns in the table, we can use \* to specify all the columns
    * Table is just the name of the table we are manipulating
    * The predicate is some condition that has to be met. If the condition is met by some row A in the table, then the query will return the specified attributes of A
  * Comments in SQL are two dashes: -- They are useful for SQL injections because we don’t want the original query to mess up the new query we have injected, so we just comment out the rest of the original query.
  * One more useful concept is DROP TABLE table
  * This deletes the specified table from the database
  * CAREFUL! This command cannot be undone. If you do drop a table from the database, use git checkout database to reload it into your project 
  * It is generally recommended to use select statements or any other SQL statements before using drop statements when testing for vulnerabilities 
  * Let’s look at an example of select statements: [https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc](https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc)
  * Use a few different example queries to demonstrate how selection works
* Approaching P6 - Might help to run the project and show examples
  * The goal of this project is first to attack the webpage, to try and uncover vulnerabilities
  * For example, when you try to log in, see if it prevents code injections like we saw with SQL or Javascript, or that it is authenticating the user properly
  * Once you find attacks that succeed, your goal changes to fixing the bugs in the webpage program that cause these vulnerabilities
  * For example, if code injections are working, try blacklisting or other forms of defense to fix the bug
  * To check if your bug fixes worked, rerun the webpage and try using the same attacks. If you can no long attack the webpage the same way, then you have successfully fixed the vulnerability
  * There is also a pinned Piazza post that goes into some more details about specific project requirements
  
## Web Security Practice (30 minutes)
Practice is available at: 
1. SQL Injection Practice - [https://injection.pythonanywhere.com/](https://injection.pythonanywhere.com/)
2. XSS Practice - [https://xss-game.appspot.com/](https://xss-game.appspot.com/)
