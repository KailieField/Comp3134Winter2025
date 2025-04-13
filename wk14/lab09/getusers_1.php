<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$mysqli = new mysqli("localhost", "root", "pass123", "lab09");

if ($mysqli->connect_error){
die("Failed Connection: " . $mysqli->connect_error);
}
?>

<form method="GET" action="">
<input type="text" name="firstname" placeholder="First Name">
<input type="submit" value="Search">
</form>

<?php
if (isset($_GET['firstname'])) {
$firstname = $_GET['firstname'];
$sql = "SELECT * FROM users WHERE firstname = '$firstname' AND active = 1";
$result = $mysqli->query($sql);

if ($result && $result->num_rows > 0) {
echo "<table style='border:1px solid black;'>";
echo "<tr>";
echo "<th>ID</th>";
echo "<th>Username</th>";
echo "<th>Email</th>";
echo "<th>First Name</th>";
echo "<th>Last Name</th>";
echo "<th>Active</th>";
echo "</tr>";

while ($row = $result->fetch_assoc()) {
echo "<tr>";
echo "<td>" . $row['id'] . "</td>";
echo "<td>" . $row['username'] . "</td>";
echo "<td>" . $row['email'] . "</td>";
echo "<td>" . $row['firstname'] . "</td>";
echo "<td>" . $row['lastname'] . "</td>";
echo "<td>" . $row['active'] . "</td>";
echo "</tr>";
}
echo "</table>";
} else {
echo "EMPTY";
}
}
?>