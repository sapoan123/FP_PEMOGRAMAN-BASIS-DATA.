<?php
session_start();
include "connection.php";
if (!isset($_SESSION["isSignin"])) {
    header("Location: signin.php");
    exit('acces denied !');
} else {
    // konfirmasi order
    if ($_GET['req'] == 'confirmO' && isset($_GET["id"]) && isset($_GET["productId"]) && isset($_GET["quantity"])) {
        mysqli_query($conn, "UPDATE products SET stock = stock - " . $_GET["quantity"] . " WHERE id = " . $_GET["productId"] . " AND stock >= " . $_GET["quantity"] . ";");
        if (mysqli_affected_rows($conn) != 0) {
            mysqli_query($conn, "UPDATE orders SET status = 'shipping' WHERE id = " . $_GET["id"] . " AND status = 'waiting confirm'");
        } else if (mysqli_affected_rows($conn) == 0) {
            header("Location: dashboard.php?error=01#pesananHead");
            exit();
        }
        header("Location: dashboard.php?message=01#pesananHead?");
    }

    / hapus order
    if ($_GET['req'] == 'deleteO' && isset($_GET["id"])) {
        $result = mysqli_query($conn, "DELETE FROM orders WHERE id = " . $_GET["id"] . " AND status = 'waiting confirm'");
        header("Location: dashboard.php#pesananHead");
        mysqli_close($conn);
    }
}
