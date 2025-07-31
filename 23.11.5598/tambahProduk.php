<?php
include "connection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $stock = $_POST["stock"];
    $price = $_POST["price"];

    $insert = mysqli_query($conn, "INSERT INTO products (name, stock, price) VALUES ('$name', '$stock', '$price')");

    if ($insert) {
        header("Location: products.php?message=sukses");
        exit;
    } else {
        echo "<script>alert('Gagal menambah produk.');</script>";
    }

    mysqli_close($conn);
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tambah Produk</title>
    <link rel="stylesheet" href="assets/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            display: flex;
            min-height: 100vh;
            font-family: sans-serif;
            background-color: #f8f9fa;
        }

        .sidebar {
            width: 250px;
            background-color: #f8f9fa;
            padding: 20px;
            border-right: 1px solid #dee2e6;
        }

        .sidebar h5 {
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .sidebar p {
            margin-bottom: 20px;
        }

        .sidebar a {
            color: #0d6efd;
            text-decoration: none;
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            font-weight: 500;
        }

        .sidebar a i {
            margin-right: 8px;
        }

        .sidebar a:hover {
            text-decoration: underline;
        }

        .sidebar .active {
            font-weight: bold;
        }

        .sidebar hr {
            margin: 20px 0;
        }

        .main-content {
            flex-grow: 1;
            padding: 40px;
            background-color: #ffffff;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h5>Maju Jaya Dashboard</h5>
    <p>pengguna : Budi</p>

    <a href="dashboard.php"><i class="bi bi-box"></i> Pesanan</a>
    <a href="products.php" class="active"><i class="bi bi-cart-check"></i> Produk</a>

    <hr>

    <a href="logout.php"><i class="bi bi-door-closed"></i> Keluar</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <h3 class="mb-4">Tambah Produk Baru</h3>

    <form method="POST" action="">
        <div class="mb-3">
            <label for="name" class="form-label">Nama Produk</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <div class="mb-3">
            <label for="stock" class="form-label">Stok</label>
            <input type="number" class="form-control" id="stock" name="stock" required>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Harga</label>
            <input type="number" class="form-control" id="price" name="price" required>
        </div>

        <button type="submit" class="btn btn-primary">Simpan</button>
        <a href="products.php" class="btn btn-secondary">Kembali</a>
    </form>
</div>

</body>
</html>
