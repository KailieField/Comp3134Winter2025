#-----------------------------------------------[ ASSIGNMENT 04 || Kailie Field   ]-------------------------------------------------
#---------------------------------------------------------[ TASK 1 ]----------------------------------------------------------------
#
#   [1]: Create page a4_reflected.php (1 mark)
#           a) In PHP, output a query string value without sanitizing it (2 marks)
#           b) In browser navigate to page above and pass query string value to alert message to screen.
#
#                           i. Write the query in a text file named step1b.txt  (1 mark)
#                          ii. Save a screenshot of the output in an image file named step1b.png (1 mark)
#
#-----------------------------------------------------------------------------------------------------------------------------------
<?PHP

if(isset($_GET['message'])) {
    
    $message = $_GET['message'];
    echo $message;
    
}else {
    
    echo "MESSAGE NIL."
}
?>
