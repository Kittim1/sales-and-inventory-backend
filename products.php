<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

class Products {
    
    // Fetch all products
    function getProducts() {
        include "connection.php"; // Include the database connection file

        try {
            $sql = "SELECT * FROM tblproducts";
            $stmt = $conn->prepare($sql);
            $stmt->execute();
            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($products) {
                return json_encode(["status" => "success", "data" => $products]);
            } else {
                return json_encode(["status" => "error", "message" => "No products found"]);
            }
        } catch (PDOException $e) {
            return json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
        }
    }

    // Add a new product
    function addProduct($json) {
        include "connection.php"; // Include the database connection file

        $data = json_decode($json, true);
        if (!$data || !isset($data["prod_code"]) || !isset($data["prod_name"]) || !isset($data["prod_description"]) || !isset($data["prod_qty_stock"]) || !isset($data["prod_onhand"]) || !isset($data["prod_price"]) || !isset($data["prod_category_id"]) || !isset($data["prod_supplier_id"])) {
            return json_encode(["status" => "error", "message" => "Invalid input data"]);
        }

        try {
            $sql = "INSERT INTO tblproducts (prod_code, prod_name, prod_description, prod_qty_stock, prod_onhand, prod_price, prod_category_id, prod_supplier_id) VALUES (:prod_code, :prod_name, :prod_description, :prod_qty_stock, :prod_onhand, :prod_price, :prod_category_id, :prod_supplier_id)";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(":prod_code", $data["prod_code"]);
            $stmt->bindParam(":prod_name", $data["prod_name"]);
            $stmt->bindParam(":prod_description", $data["prod_description"]);
            $stmt->bindParam(":prod_qty_stock", $data["prod_qty_stock"]);
            $stmt->bindParam(":prod_onhand", $data["prod_onhand"]);
            $stmt->bindParam(":prod_price", $data["prod_price"]);
            $stmt->bindParam(":prod_category_id", $data["prod_category_id"]);
            $stmt->bindParam(":prod_supplier_id", $data["prod_supplier_id"]);

            if ($stmt->execute()) {
                return json_encode(["status" => "success", "message" => "Product added successfully"]);
            } else {
                return json_encode(["status" => "error", "message" => "Failed to add product"]);
            }
        } catch (PDOException $e) {
            return json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
        }
    }
}

// Read JSON request data
$json = isset($_POST["json"]) ? $_POST["json"] : "0";
$operation = isset($_POST["operation"]) ? $_POST["operation"] : "0";

$products = new Products();

switch ($operation) {
    case "get":
        echo $products->getProducts();
        break;
    case "add":
        echo $products->addProduct($json);
        break;
    default:
        echo json_encode(["status" => "error", "message" => "Invalid operation"]);
}
?>