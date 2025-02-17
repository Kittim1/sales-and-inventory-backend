<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

class Inventory {
    
    // Fetch all inventory data
    function getInventory() {
        include "connection.php"; // Include the database connection file

        try {
            $sql = "SELECT * FROM tblinventory";
            $stmt = $conn->prepare($sql);
            $stmt->execute();
            $inventory = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($inventory) {
                return json_encode(["status" => "success", "data" => $inventory]);
            } else {
                return json_encode(["status" => "error", "message" => "No inventory data found"]);
            }
        } catch (PDOException $e) {
            return json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
        }
    }

    // Add a new inventory item
    function addInventory($json) {
        include "connection.php"; // Include the database connection file

        $data = json_decode($json, true);
        if (!$data || !isset($data["prod_id"]) || !isset($data["stock_in"]) || !isset($data["stock_out"]) || !isset($data["current_stock"])) {
            return json_encode(["status" => "error", "message" => "Invalid input data"]);
        }

        try {
            $sql = "INSERT INTO tblinventory (prod_id, stock_in, stock_out, current_stock) VALUES (:prod_id, :stock_in, :stock_out, :current_stock)";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(":prod_id", $data["prod_id"]);
            $stmt->bindParam(":stock_in", $data["stock_in"]);
            $stmt->bindParam(":stock_out", $data["stock_out"]);
            $stmt->bindParam(":current_stock", $data["current_stock"]);

            if ($stmt->execute()) {
                return json_encode(["status" => "success", "message" => "Inventory item added successfully"]);
            } else {
                return json_encode(["status" => "error", "message" => "Failed to add inventory item"]);
            }
        } catch (PDOException $e) {
            return json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
        }
    }
}

// Read JSON request data
$json = isset($_POST["json"]) ? $_POST["json"] : "0";
$operation = isset($_POST["operation"]) ? $_POST["operation"] : "0";

$inventory = new Inventory();

switch ($operation) {
    case "get":
        echo $inventory->getInventory();
        break;
    case "add":
        echo $inventory->addInventory($json);
        break;
    default:
        echo json_encode(["status" => "error", "message" => "Invalid operation"]);
}
?>