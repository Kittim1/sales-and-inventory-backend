<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization");

class User {
    
    // 🔹 **Login Function**
    function login($json) {
        include "connection.php"; 
    
        // Debug received JSON data
        file_put_contents('debug.log', "Received JSON: " . $json . "\n", FILE_APPEND);
    
        $data = json_decode($json, true);
        if (!$data || !isset($data["username"]) || !isset($data["password"])) {
            return json_encode(["error" => "Invalid input data"]);
        }
    
        $sql = "SELECT * FROM tblusers WHERE user_name = :username"; 
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":username", $data["username"]);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
        // Debug password verification
        file_put_contents('debug.log', "Entered: " . $data["password"] . "\nStored: " . $user["user_password"] . "\n", FILE_APPEND);
    
        if ($user && password_verify($data["password"], $user["user_password"])) {
            return json_encode(["status" => "success", "user" => $user]);
        } else {
            return json_encode(["status" => "error", "message" => "Invalid username or password"]);
        }
    }
    
    

    // 🔹 **Register Function**
    function register($json) {
        include "connection.php"; 
    
        $data = json_decode($json, true);
        if (!$data || !isset($data["username"]) || !isset($data["password"]) || !isset($data["role"])) {
            return json_encode(["error" => "Invalid input data"]);
        }
    
        // Check if username already exists
        $check_sql = "SELECT * FROM tblusers WHERE user_name = :username";
        $check_stmt = $conn->prepare($check_sql);
        $check_stmt->bindParam(":username", $data["username"]);
        $check_stmt->execute();
    
        if ($check_stmt->rowCount() > 0) {
            return json_encode(["status" => "error", "message" => "Username already exists!"]);
        }
    
        // **Ensure password is hashed before storing**
        $hashed_password = password_hash(trim($data["password"]), PASSWORD_BCRYPT);
    
        // Insert new user
        $sql = "INSERT INTO tblusers (user_name, user_password, user_role) VALUES (:username, :password, :role)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":username", $data["username"]);
        $stmt->bindParam(":password", $hashed_password);
        $stmt->bindParam(":role", $data["role"]);
    
        if ($stmt->execute()) {
            return json_encode(["status" => "success", "message" => "User registered successfully"]);
        } else {
            return json_encode(["status" => "error", "message" => "Registration failed"]);
        }
    }
    
}

// **Read JSON request data**
$json = isset($_POST["json"]) ? $_POST["json"] : "0";
$operation = isset($_POST["operation"]) ? $_POST["operation"] : "0";

$user = new User();

switch ($operation) {
    case "login":
        echo $user->login($json);
        break;
    case "register":
        echo $user->register($json);
        break;
    default:
        echo json_encode(["status" => "error", "message" => "Invalid operation"]);
}
?>
