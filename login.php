<?php
session_start();
if (isset($_SESSION['level'])) {
	header("Location: dashboard.php");
	exit;
}
require 'functions/config.php';

if (isset($_POST['login'])) {
	$user = $_POST['username'];
	$pass = $_POST['password'];
	$pas  = md5($pass);
	$sql  = mysqli_query($conn, "SELECT * FROM users WHERE username = '$user' AND password = '$pas'");
	$row  = mysqli_fetch_array($sql);
	$username = $row['username'];
	$password = $row['password'];
	$level    = $row['level'];

	if ($user == $username && $pas == $password) {
		$_SESSION['level'] = $level;
		header("Location: dashboard.php");
	} else {
		$error = true;
	}
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Form Login</title>
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
	<style type="text/css">
		.kotak {
			margin-top: 150px;
			background-color: pink;
			/*#AAE25E*/
			color: #fff;
		}

		.kotak .input-group {
			margin-bottom: 20px;
		}
	</style>
</head>

<body>
	<form action="" method="post">
		<div class="col-md-3 col-md-offset-4 kotak">
			<h3 class="text-center">Login Form</h3>
			<?php if (isset($error)) : ?>
				<p style="color: red;font-style: italic;">Username / Password Salah!</p>
			<?php endif; ?>
			<div class="form-group">
				<input type="text" name="username" class="form-control" placeholder="Username" autocomplete="off" autofocus />
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="Password" name="password" autocomplete="off" />
			</div>
			<div class="form-group">
				<input type="submit" name="login" class="btn btn-primary form-control" value="Login">
			</div>
		</div>
	</form>
</body>

</html>