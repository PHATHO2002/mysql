<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
</head>


<body>

    <?php include 'layout/header.php'; ?>

    <div class="container">
        <?php

        if ($_SERVER['REQUEST_METHOD'] == "GET") {

            if (isset($_GET["action"])) {

                switch ($_GET["action"]) {
                    case "get_form_add":
                        include_once 'category/form/frmaddcategory.php';
                        break;
                    case "get_edit_form":

                        include_once 'category/form/edit_fr_category.php';
                        break;
                    default:

                        break;
                }
            } else {
                include_once 'category/handle/displaycategory.php';
            }
        }
        ?>

    </div>


    <?php include 'layout/footer.php'; ?>


</body>

</html>