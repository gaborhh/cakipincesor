<?php
include 'assets/php/latogato.php';
?>
<!DOCTYPE html>
<html lang="hu">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Cáki pincesor</title>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <link rel="stylesheet" href="assets/css/index.css">
  <link rel="stylesheet" href="assets/css/styles.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
  <div class="overlay"></div>
  <nav>
    <input type="checkbox" id="check">
    <label for="check" class="check-btn">
      <div class="line"></div>
      <div class="line"></div>
      <div class="line"></div>
    </label>
    <label class="logo">Cáki Pincesor</label>
    <ul>
      <li><a class="active" href="#">Kezdőlap</a></li>
      <li><a href="events.php">Rendezvények</a></li>
      <li><a href="history.php">Történetünk</a></li>
      <li><a href="gallery.php">Galéria</a></li>
      <li><a href="contact.php">Kapcsolat</a></li>
    </ul>
  </nav>
  <div class="slider">
    <div class="slide current">
      <div class="content">
        <h1>Példa1</h1>
        <p>Példa1</p>
      </div>
    </div>
    <div class="slide">
      <div class="content">
        <h1>Példa2</h1>
        <p>Példa2</p>
      </div>
    </div>
    <div class="slide">
      <div class="content">
        <h1>Példa3</h1>
        <p>Példa3</p>
      </div>
    </div>
    <div class="slide">
      <div class="content">
        <h1>Példa4</h1>
        <p>Példa4</p>
      </div>
    </div>
    <div class="slide">
      <div class="content">
        <h1>Példa5</h1>
        <p>Példa5</p>
      </div>
    </div>
    <div class="slide">
      <div class="content">
        <h1>Példa6</h1>
        <p>Példa6</p>
      </div>
    </div>
  </div>
  <div class="buttons">
    <button id="prev"><i class="fas fa-arrow-left"></i></button>
    <button id="next"><i class="fas fa-arrow-right"></i></button>
  </div>
  <header class="main-header">
    <h1>Aktuális rendezvényünk</h1>
    <div class="down-arrow"></div>
  </header>
  <section id="timeline">
  <div class="left-container">
    <?php
    $servername = "localhost";
    $username = "root";
    $password = "tpq7j3twUXfxDu886zD2";
    $database = "cakipincesor";
    $conn = new mysqli($servername, $username, $password, $database);
    if ($conn->connect_error) {
        die("Sikertelen kapcsolódás az adatbázishoz: " . $conn->connect_error);
    }
    $sql = "SELECT * FROM events ORDER BY event_date DESC LIMIT 1";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo "<div class='square-image-container'>";
        echo "<img class='square-image' src='uploads/" . $row["image_name"] . "' alt='" . $row["image_alt"] . "'>";
        echo "</div>";
    } else {
        echo "<head><style>.form-group{display:none;} #timeline{ display:block;}</style></head><p style='text-align:center;'>Nincs elérhető bejegyzés.</p>";
    }
    $conn->close();
    ?>
</div>
    <div class="right-container"> 
        <div class="h2">
            <h2><?php echo $row["event_name"]; ?></h2>
        </div>  
        <div class="description">
        <p class="p">
    <?php
        $event_description = $row["event_description"];
        $max_chars = 250;
        if (strlen($event_description) > $max_chars) {
            $words = explode(' ', $event_description);
            $display_text = '';
            $char_count = 0;
            foreach ($words as $word) {
                if ($char_count + strlen($word) > $max_chars) {
                    break;
                }
                $display_text .= $word . ' ';
                $char_count += strlen($word) + 1; 
            }
            echo $display_text . '...';
        } else {
            echo $event_description;
        }
    ?>
</p>
        </div>
        <div class="form-group">
            <a href="events.php?event=<?php echo $row["id"]; ?>"><p>További információk</p></a>
        </div>
    </div>
</section>
  <div class="containerr">
    <h1>Szolgáltatások</h1>
    <br>
    <div class="services">
    <div class="service">
        <h2>Borkóstolás</h2>
        <br>
        <p>Ismerje meg pincénk különleges borait egy kóstoló során. Képzett szakembereink segítségével fedezze fel a legjobb borokat és élvezze az ízek gazdagságát.</p>
        <br>
        <img src="images/bor.jpg" alt="Borkóstolás">
    </div>
    <div class="service">
        <h2>Pinceséták</h2>
        <br>
        <p>Vegyen részt vezetett séta során pincénkben, ahol szakértő vezetőnk bemutatja a borászat folyamatát és megosztja velünk a hagyományokat és titkokat.</p>
        <br>
        <img src="images/pince.jpg" alt="Pinceséták">
    </div>
    <div class="service">
        <h2>Gasztronómiai Élmények</h2>
        <br>
        <p>Élvezze a gasztronómiai élményeket pincénkben, ahol kiváló minőségű helyi ételeket és csemegéket kínálunk. Ízlelje meg a vidék ízeit és hangulatát.</p>
        <br>
        <img src="images/etel.jpg" alt="Gasztronómiai Élmények">
    </div>
</div>
<div class="media">
    <h1>Media</h1>
    <img src="images/mobile.png" alt="">
</div>
       <footer id="footer">
          <div class="container">
               <div class="row">
               <div class="opening-hours">
        <h1 class="opening">Nyitvatartási idő</h1>
          <table>
              <tr class="monday fvl-d">
                  <td><span>Hétfő</span></td>
                  <td>8.00 - 11.30</td>
                  <td>14.30 - 18.00</td>
              </tr>
              <tr class="tuesday fvl-d">
                  <td><span>Kedd</span></td>
                  <td>8.00 - 11.30</td>
                  <td>14.30 - 18.00</td>
              </tr>
              <tr class="wednesday fvl-d">
                  <td><span>Szerda</span></td>
                  <td>8.00 - 12.00</td>
              </tr>
              <tr class="thursday fvl-d">
                  <td><span>Csütörtök</span></td>
                  <td>8.00 - 11.30</td>
                  <td>14.30 - 18.00</td>
              </tr>
              <tr class="friday fvl-d">
                  <td><span>Péntek</span></td>
                  <td>12.00 - 22.00</td>
              </tr>
              <tr class="saturday fvl-d">
                  <td><span>Szombat</span></td>
                  <td>17.00 - 22.00</td>
              </tr>
              <tr class="sunday fvl-d">
                  <td><span>Vasárnap</span></td>
                  <td>Zárva</td>
              </tr>
          </table>
    </div>
                    <div class="col-md-4 col-sm-6">
                         <div class="footer-info">
                              <div class="section-title">
                                   <h2>Kapcsolat</h2>
                              </div>
                              <address>
                                   <p>+36 20 123 45 67</p>
                                   <p><a href="mailto:youremail.com">cakipincesor@gmail.com</a></p>
                              </address>

                              <div class="footer_menu">
                                   <h2>Gyors linkek</h2>
                                   <ul>
                                        <li><a href="./admin/">Admin</a></li>
                                   </ul>
                              </div>
                         </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                    <div class="footer-info newsletter-form">
                        <div class="section-title">
                            <h2>Iratkozzon fel hírlevelünkre</h2>
                        </div>
                        <div>
                            <div class="form-group">
                            <form id="subscribe-form" method="post">
                                <input type="email" name="email" placeholder="E-mail cím" required>
                                <input type="submit" class="form-control" name="submit" id="form-submit" value="Feliratkozás">
                            </form>
                                <span><sup>*</sup>Felhívjuk figyelmét, hogy e-mailjeit nem küldjük spamre.</span>
                            </div>
                        </div>
                        <div id="message"></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script>
        $(document).ready(function(){
            $("#subscribe-form").submit(function(event){
                event.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "assets/php/submit.php",
                    data: $(this).serialize(),
                    dataType: "json",
                    success: function(response){
                        $("#message").text(response.message);
                    }
                });
            });
        });
    </script>
  <script>
    const time = () => {
        const activerow = document.querySelector('#activerow');
        const monday = document.querySelector('.monday');
        const tuesday = document.querySelector('.tuesday');
        const wednesday = document.querySelector('.wednesday');
        const thursday = document.querySelector('.thursday');
        const friday = document.querySelector('.friday');
        const saturday = document.querySelector('.saturday');
        const sunday = document.querySelector('.sunday');
        switch (new Date().getDay()) {
            case 1:
                monday.setAttribute("id", "activerow");
                break;
            case 2:
                tuesday.setAttribute("id", "activerow");
                break;
            case 3:
                wednesday.setAttribute("id", "activerow");
                break;
            case 4:
                thursday.setAttribute("id", "activerow");
                break;
            case 5:
                friday.setAttribute("id", "activerow");
                break;
            case 6:
                saturday.setAttribute("id", "activerow");
                break;
            case 0:
                sunday.setAttribute("id", "activerow");
                break;
        }
    }
    time();
    </script>
  <script src="assets/js/main.js"></script>
  <script>
  document.addEventListener("DOMContentLoaded", function() {
    const check = document.getElementById("check");
    const overlay = document.querySelector(".overlay");
    check.addEventListener("click", function() {
      if (check.checked) {
        overlay.classList.add("active");
        document.body.style.overflow = "hidden";
      } else {
        overlay.classList.remove("active");
        document.body.style.overflow = "";
      }
    });
    overlay.addEventListener("click", function() {
      check.checked = false;
      overlay.classList.remove("active");
      document.body.style.overflow = "";
    });
  });
</script>
</body>
</html>
