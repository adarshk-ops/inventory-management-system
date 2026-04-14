<html>
<head>
<style>
body {
    font-family: Arial;
    text-align: center;
}

form {
    margin-top: 50px;
}

input {
    padding: 8px;
    margin: 5px;
}

button {
    padding: 10px;
    background-color: green;
    color: white;
    border: none;
}
</style>
</head>
<body>

<h2>Add Product</h2>

<form action="addProduct" method="post">
    Name: <input type="text" name="name"><br><br>
    Quantity: <input type="number" name="quantity"><br><br>
    Price: <input type="number" name="price"><br><br>

    <input type="submit" value="Add Product">
</form>

</body>
</html>