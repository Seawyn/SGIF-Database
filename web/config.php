<html>
    <body>
        <?php
            $user="ist186388";
            $host="db.ist.utl.pt";
            $port=5432;
            $password="12345678";
            $dbname = $user;

            $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);    
        ?>
    </body>    
</html>
