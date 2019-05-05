<?php
  $servername = "";
  $username = "";
  $password = "";
  $dbname = "";

	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	// Check connection
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}
	// sql to create table
	$sql = "drop table if exists Accounts;";
	$sql .= "create table Accounts(
		name varchar(30),
		userId varchar(30),
		password varchar(30));";
	mysqli_multi_query($conn, $sql);
  mysqli_close($conn);
?>
