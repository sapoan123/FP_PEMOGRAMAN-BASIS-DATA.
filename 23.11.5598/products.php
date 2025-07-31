<?php
include "connection.php";

$products = mysqli_query($conn, "SELECT * FROM products");
$productsArr = [];

while ($row = mysqli_fetch_assoc($products)) {
    $productsArr[] = $row;
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kelola Produk</title>
    <link rel="stylesheet" href="assets/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            min-height: 100vh;
            font-family: sans-serif;
            background-color: #f8f9fa;
        }

        /* Sidebar */
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

        /* Main content */
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

    <hr> <!-- Garis pemisah antara produk dan keluar -->

    <a href="logout.php"><i class="bi bi-door-closed"></i> Keluar</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <h3 class="mb-4">Daftar Produk</h3>
    <a href="tambahProduk.php" class="btn btn-success mb-3">Tambah Produk</a>

    <table class="table table-bordered table-striped">
        <thead class="table-light">
            <tr>
                <th>ID Produk</th>
                <th>Nama</th>
                <th>Stok</th>
                <th>Harga</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($productsArr as $prod): ?>
            <tr>
                <td><?= $prod["id"] ?></td>
                <td><?= $prod["name"] ?></td>
                <td><?= $prod["stock"] ?></td>
                <td><?= number_format($prod["price"], 0, ',', '.') ?></td>
                <td>
                    <a href="editProduk.php?id=<?= $prod["id"] ?>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="hapusProduk.php?id=<?= $prod["id"] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Hapus produk ini?')">Hapus</a>
                </td>
            </tr>
            <?php endforeach ?>
        </tbody>
    </table>
</div>

</body>
</html>
