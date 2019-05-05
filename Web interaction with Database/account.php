<?php
	session_start();
?>
<?php
if($_POST){
	if (empty($_SESSION['dbs'])){
			include_once('createAccountTable.php');
			$_SESSION['dbs'] = 1;
			$_SESSION['servername'] = $servername;
			$_SESSION['username'] = $username;
			$_SESSION['password'] = $password;
			$_SESSION['dbname'] = $dbname;
		}
}
?>
<?php
	// add new account
	if ($_POST['action']=='add'){
      $name = $_POST['name'];
      $newuserid = $_POST['newuserid'];
      $newpassword = $_POST['newpassword'];
			$conn = mysqli_connect($_SESSION['servername'], $_SESSION['username'],$_SESSION['password'], $_SESSION['dbname']);
			if (!$conn) {
				die("Connection failed: " . mysqli_connect_error());
			}
			$sql = "select * from Accounts where userId = '$newuserid';";
			$result = mysqli_query($conn, $sql);
			if (mysqli_num_rows($result) > 0) {
				mysqli_close($conn);
				echo "<h2>".$newuserid." alreday exists--please select another user id</h2>";
			}else{
				$query = "INSERT INTO Accounts Values('$name','$newuserid','$newpassword');";
				mysqli_query($conn, $query);
				mysqli_close($conn);
				echo "<h2>Account ".$newuserid." created--Welcome ".$name."!</h2>";
			}
		}
?>

<?php
	//login in
	if ($_POST['action']=='login'){
		$userid = $_POST['userid'];
		$password = $_POST['password'];
		$conn = mysqli_connect($_SESSION['servername'], $_SESSION['username'],$_SESSION['password'], $_SESSION['dbname']);
		if (!$conn) {
			die("Connection failed: " . mysqli_connect_error());
		}
		$sql = "select * from Accounts where userId = '$userid';";
		$result = mysqli_query($conn, $sql);
		if (mysqli_num_rows($result) > 0){
			$row = mysqli_fetch_array($result);
			if($password == $row['password']){
				echo "<h2>Welcome ".$row['name']."!<h2/>";
			}else{
				echo "<h2>Invalid password</h2>";
			}
		}else{
			echo "<h2>Invalid userid: ".$userid."</h2>";
		}
	}
?>

<?php
	//delete
	if ($_POST['action']=='delete'){
		$deluserid = $_POST['deluserid'];
		$conn = mysqli_connect($_SESSION['servername'], $_SESSION['username'],$_SESSION['password'], $_SESSION['dbname']);
		if (!$conn) {
			die("Connection failed: " . mysqli_connect_error());
		}
		$sql = "select * from Accounts where userId = '$deluserid';";
		$result = mysqli_query($conn, $sql);
		if (mysqli_num_rows($result) > 0){
			$row = mysqli_fetch_array($result);
			echo "<h2>".$row['name']." successfully deleted</h2>";
			$query = "DELETE FROM Accounts Where userId = '$deluserid';";
			mysqli_query($conn, $query);
			mysqli_close($conn);
		}else{
			echo "<h2>".$deluserid." not found</h2>";
		}
	}
?>
