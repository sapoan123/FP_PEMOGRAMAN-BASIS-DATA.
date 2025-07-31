<?php
include "connection.php";

if (!isset($_GET['id'])) {
    echo "ID tidak ditemukan!";
    exit;
}

$id = $_GET['id'];
$result = mysqli_query($conn, "SELECT * FROM products WHERE id = $id");
$product = mysqli_fetch_assoc($result);

if (!$product) {
    echo "Produk tidak ditemukan!";
    exit;
}

// Proses jika form disubmit
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $stock = $_POST['stock'];
    $price = $_POST['price'];

    $update = mysqli_query($conn, "UPDATE products SET name='$name', stock=$stock, price=$price WHERE id=$id");

    if ($update) {
        header("Location: products.php");
        exit;
    } else {
        echo "Gagal mengupdate produk.";
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Produk</title>
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
    <h3 class="mb-4">Edit Produk</h3>
    <form method="POST" class="w-50">
        <div class="mb-3">
            <label>Nama Produk</label>
            <input type="text" name="name" class="form-control" value="<?= $product['name'] ?>" required>
        </div>
        <div class="mb-3">
            <label>Stok</label>
            <input type="number" name="stock" class="form-control" value="<?= $product['stock'] ?>" required>
        </div>
        <div class="mb-3">
            <label>Harga</label>
            <input type="number" name="price" class="form-control" value="<?= $product['price'] ?>" required>
        </div>
        <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
        <a href="products.php" class="btn btn-secondary">Batal</a>
    </form>
</div>

</body>
</html>
