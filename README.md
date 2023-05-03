# URLShortener
URLShortener program by Sahithi Jarugula.

## How to Run
The URLShortenerProgram is a ruby on rails program. If you copy this repository
and go into the URLShortenerProgram directory, you can run the command rails
server (or a similar command depending on the version of ruby on rails you have
installed). This will give a link (of the form http://217.0.0.1:3000). If you
paste this link into a web browser, you will be able to see the program.

## Document Details
There are three pages in this program, the index page (the home page), the encode
page and the decode page.

### Index Page
The Index page is the home page of the program. On this page the user is given the 
choice whether to encode (shorten the URL they provide) or decode (find the original 
long URL of the short URL they provie) a url. The html code behind it can be reached
through this path: URLShortenerProgram/app/views/url_shortener/index.html.erb. 

### Encode Page
If the user clicks on the encode button on the Index page they will be redirected to this page. 
The user can then provide a valid URL into the text_field they see on the screen. They can
submit this link to the program by clicking the submit button below the text_field. The
program will then generate a short URL for the given link and add both the long and short
URL into its internal database. Finally, the program will search for the row in the database
that contains both the long and short URLs and return that as a JSON as the final 
endpoint of the program.

### Decode Page
If the user clicks on the decode button on the Index page they will be redirected to this page. 
The user can then provide a valid short URL (one that has already been generated and exists in 
the internal database of the program) into the text_field they see on the screen. They can
submit this link to the program by clicking the submit button below the text_field. The
program will then search for the row in the database that contains both the long and short URLs 
and return that as a JSON as the final endpoint of the program.
