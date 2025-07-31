<?php
include "connection.php";

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $delete = mysqli_query($conn, "DELETE FROM products WHERE id = $id");

    if ($delete) {
        header("Location: products.php");
        exit;
    } else {
        echo "Gagal menghapus produk.";
    }
} else {
    echo "ID tidak ditemukan!";
}
?>
