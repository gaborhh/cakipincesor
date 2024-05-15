-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 172.17.0.1:3306
-- Létrehozás ideje: 2024. Máj 15. 19:51
-- Kiszolgáló verziója: 10.5.22-MariaDB-1:10.5.22+maria~ubu2004-log
-- PHP verzió: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `7cnouzuz`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`) VALUES
(4, 'admin', '$2y$10$1yOK4nA.9K5n7KVtlCfOue70lowkoGf8LPC23fzq5XZtcBMBb5A1G', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `reply_count` int(11) NOT NULL DEFAULT 0,
  `event_id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `comments`
--

INSERT INTO `comments` (`id`, `parent_comment_id`, `reply_count`, `event_id`, `user_id`, `name`, `email`, `comment`, `created_at`) VALUES
(89, NULL, 1, 52, 0, 'Teszt Elek', 'tesztelek@gmail.com', 'velemeny', '2024-04-17 20:48:03'),
(90, 89, 0, 52, 36, 'Vincs Eszter', 'vincseszter@gmail.com', 'valasz', '2024-04-17 20:49:49'),
(91, NULL, 0, 52, 2, 'd', 'gaborszente114@gmail.com', 'asdasd', '2024-05-03 18:51:22');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `event_description` text NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `f_ar` int(255) NOT NULL,
  `d_ar` int(255) NOT NULL,
  `ny_ar` int(255) NOT NULL,
  `csa_ar` int(255) NOT NULL,
  `cso_ar` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `events`
--

INSERT INTO `events` (`id`, `event_name`, `event_date`, `event_description`, `image_name`, `image_path`, `f_ar`, `d_ar`, `ny_ar`, `csa_ar`, `cso_ar`) VALUES
(52, 'Szent György napi pincesor piknik', '2028-01-04', 'A Tájházszövetség által meghirdetett Tájházak és szabadtéri múzeumok napja országos rendezvénysorozathoz csatlakozva várják a vendégeket a Cák melletti gesztenyésben található műemlék zsúpfedeles pincesorhoz. Tíz órakor nyit a kézműves vásár, ahol termelői mézet, kézműves süteményeket, ásványékszereket is vásárolhatunk, valamint házi készítésű húsételekkel és büfével készül az egyik környékbeli gazdaság. Pajor Andreával a kosárfonás, nemezelés, szövés fortélyaival ismerkedhetnek az érdeklődők. Népi fajátékokat – kosárhintát, lengőtekét, csibepofozót, az íjászkodást és ügyességi játékokat is – kipróbálhatnak a gyerekek, akik állatsimogatásra és lovaglásra is jelentkezhetnek a helyszínen. Szüleiknek borkóstolót kínál az egyik borház.\r\n\r\n13 és 15 óra között a pincesor mögötti réten a Kőszegi-hegység növényvilágával ismerteti meg a kíváncsiakat Keszei Balázs középiskolai tanár. A csoportos sétához a pincesor szabadtéri színpada mellett van a gyülekező. 15-től 17 óráig az amatőr művészeti csoportok váltják egymást a színpadon: a Derű Néptáncegyüttes és a Vigyorkák; a Lukácsházi Színjátszó Kör a Kutya vagy gyerek című bohózatával, utánuk a Velemi Néptánccsoport vasi táncokat mutat be, majd táncházhoz csatlakozhatunk. Az önkormányzat szeretettel vár minden érdeklődőt.', 'cák pince.jpg', 'uploads/cák pince.jpg', 500, 300, 300, 1000, 300);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `gallery`
--

INSERT INTO `gallery` (`id`, `image`) VALUES
(2, 'kep1.jpg'),
(3, 'kep2.jpg'),
(4, 'kep3.jpg'),
(5, 'kep4.jpg'),
(6, 'kep5.jpg'),
(7, 'kep6.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`) VALUES
(1, 'asd@gmail.com', '2024-04-09 17:29:30'),
(4, 'dsa@gmail.com', '2024-04-09 18:09:44'),
(8, 'valaki@example.hu', '2024-04-10 21:12:10'),
(9, 'admin@ssn.com', '2024-05-06 09:16:59');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `revenue` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `event_id`, `quantity`, `revenue`, `date`) VALUES
(9, 46, 300, 300.00, '2024-04-10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `visits`
--

CREATE TABLE `visits` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `visit_date` datetime NOT NULL,
  `page_visited` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `visits`
--

INSERT INTO `visits` (`id`, `ip_address`, `session_id`, `visit_date`, `page_visited`) VALUES
(4, '192.168.1.1', 'jp1huaq7cnvm8qqjsqlpqs5o5h', '2024-04-16 20:09:08', 'index.php'),
(5, '157.119.232.164', 'mie6tb2n71mp6o62puiususaog', '2024-04-16 21:55:37', 'index.php'),
(6, '171.244.43.14', '43169nmk1qq5dle2cdj1s6psuj', '2024-04-17 00:25:32', 'index.php'),
(7, '209.127.106.9', '48uqjm79s39lpaqq1d66se13j7', '2024-04-17 02:05:00', 'index.php'),
(8, '95.164.156.67', '05ug4mhgrj9jtjs0pbeib1uimm', '2024-04-17 02:05:01', 'index.php'),
(9, '191.102.179.172', 'rsv7munosiqd8bhhn7oid1isiv', '2024-04-17 02:05:02', 'index.php'),
(10, '8.41.221.51', 'p7nau6dqigc0san2u93kji7gdf', '2024-04-17 04:24:15', 'index.php'),
(11, '8.41.221.51', 'nsovvns0a7fmktcrvlelp5g43k', '2024-04-17 04:24:16', 'index.php'),
(12, '149.56.160.143', 'sp66skopt0oe3mopn7rhequav0', '2024-04-17 07:42:22', 'index.php'),
(13, '149.56.160.143', 'k193m9dipsua240no0i4bgaaei', '2024-04-17 07:42:23', 'index.php'),
(14, '149.56.160.143', 'sp66skopt0oe3mopn7rhequav0', '2024-04-17 07:42:24', 'events.php'),
(15, '149.56.160.143', 'sp66skopt0oe3mopn7rhequav0', '2024-04-17 07:42:25', 'history.php'),
(16, '149.56.160.143', 'sp66skopt0oe3mopn7rhequav0', '2024-04-17 07:42:26', 'gallery.php'),
(17, '144.217.135.244', 'cfjkv2ldcjc29fkariig325npu', '2024-04-17 07:43:02', 'index.php'),
(18, '199.45.154.20', 'sp2tgp11nudr0gge520b6cbi2m', '2024-04-17 07:58:11', 'index.php'),
(19, '199.45.154.55', '15c6tm35o60tdnfh3ovtdvie8l', '2024-04-17 08:17:23', 'index.php'),
(20, '199.45.155.38', '61bsq1ckq2fj2g98f1rdc9auam', '2024-04-17 08:41:24', 'index.php'),
(21, '47.254.74.59', 'aqkhdlrp29d621ncld11jdo0aq', '2024-04-17 08:51:19', 'index.php'),
(22, '47.88.5.56', 'v74494c56j9tk9tc3apecfsi6h', '2024-04-17 08:51:19', 'index.php'),
(23, '51.44.5.199', 'of66dnivjt6lau8b818rkuuuih', '2024-04-17 09:34:12', 'index.php'),
(24, '13.39.109.73', '6g0p1rs6b0sb3dmicohpsl5i3f', '2024-04-17 09:39:08', 'index.php'),
(25, '13.39.109.73', 'couj51apc230fp615bcl67rcme', '2024-04-17 09:39:08', 'index.php'),
(26, '51.159.103.13', '0pctq034hoah4kv9pl4rhvsi8h', '2024-04-17 10:17:20', 'index.php'),
(27, '51.159.103.13', '491ipoulhu0b1vidrtrrke7v9k', '2024-04-17 10:17:22', 'index.php'),
(28, '51.159.103.13', 'bjv499m1r8b9qt3hfo1d8iog2h', '2024-04-17 10:17:25', 'index.php'),
(29, '195.199.251.129', 'qdoh5k3msdeo8p9hd0d07ckums', '2024-04-17 10:17:43', 'index.php'),
(30, '195.199.251.129', 'qdoh5k3msdeo8p9hd0d07ckums', '2024-04-17 10:17:45', 'events.php'),
(31, '195.199.251.129', 'qdoh5k3msdeo8p9hd0d07ckums', '2024-04-17 10:24:53', 'gallery.php'),
(32, '195.199.251.129', 'qdoh5k3msdeo8p9hd0d07ckums', '2024-04-17 10:24:54', 'history.php'),
(33, '195.199.251.129', '2aphr9sl6jfb1o781t69i4ki9h', '2024-04-17 10:53:20', 'index.php'),
(34, '195.199.251.129', '2aphr9sl6jfb1o781t69i4ki9h', '2024-04-17 10:53:32', 'events.php'),
(35, '195.199.251.129', 'olmkvjilrnnf7rp2v2512h0afc', '2024-04-17 11:54:14', 'index.php'),
(36, '195.199.251.129', 'olmkvjilrnnf7rp2v2512h0afc', '2024-04-17 11:57:07', 'events.php'),
(37, '87.236.176.73', 'c03e4tjvp6oqm7hldgigm9i4rp', '2024-04-17 12:14:03', 'index.php'),
(38, '213.188.90.154', 'r5ogvnd2u1la0jq9kf63bj2v4d', '2024-04-17 12:21:11', 'index.php'),
(39, '168.151.165.234', '9pru39k5i1cu9fgs048mou63gg', '2024-04-17 12:23:04', 'index.php'),
(40, '17.241.227.212', 'o4tt2mkn8hd4pkgdqd853a40am', '2024-04-17 13:04:34', 'index.php'),
(41, '17.241.227.188', 'e88egi8ne0tc06qf762jigqnuv', '2024-04-17 13:18:01', 'index.php'),
(42, '87.236.176.132', 'j2gr95353lg2b2aqqc4lpgcsri', '2024-04-17 13:20:02', 'index.php'),
(43, '17.241.75.150', 'qtf31r25nln6hr9gbfgr3qbauq', '2024-04-17 13:27:46', 'index.php'),
(44, '17.241.227.30', '44dlrmlnnn3kki87d9lssjfc2b', '2024-04-17 13:29:28', 'index.php'),
(45, '20.229.51.198', 'h7sva1q16da6helnionp9a2ku5', '2024-04-17 13:57:39', 'index.php'),
(46, '104.166.80.96', '12r21lncaqvig59knsubu9bu6m', '2024-04-17 14:00:47', 'index.php'),
(47, '84.225.188.226', '4216hqem09ggtv995m7bljh6j8', '2024-04-17 15:13:01', 'index.php'),
(48, '84.225.188.226', '4216hqem09ggtv995m7bljh6j8', '2024-04-17 15:13:06', 'events.php'),
(49, '34.221.87.58', '9g1i09fe29sanldotdqk6g9sef', '2024-04-17 16:57:55', 'index.php'),
(50, '54.69.253.171', '5mlt4h11f7gf4repakk069jv7p', '2024-04-17 16:57:56', 'index.php'),
(51, '84.225.183.187', 'h1v5jdll2njap94j7mad3npkok', '2024-04-17 18:06:33', 'index.php'),
(52, '192.168.1.1', 'k7n8qfv95ao27nmre9c0hpgcp5', '2024-04-17 18:50:34', 'index.php'),
(53, '192.168.1.1', 'k7n8qfv95ao27nmre9c0hpgcp5', '2024-04-17 19:11:10', 'events.php'),
(54, '192.168.1.1', 'k7n8qfv95ao27nmre9c0hpgcp5', '2024-04-17 19:11:12', 'history.php'),
(55, '192.168.1.1', 'k7n8qfv95ao27nmre9c0hpgcp5', '2024-04-17 19:11:13', 'gallery.php'),
(56, '192.168.1.1', 'vsnuvjsndmdf3df50c2uq2help', '2024-04-17 19:34:18', 'index.php'),
(57, '185.106.115.37', '8lls3sv03f7dgjsuupc86hnord', '2024-04-17 19:35:22', 'index.php'),
(58, '192.168.1.1', 'vsnuvjsndmdf3df50c2uq2help', '2024-04-17 19:36:02', 'events.php'),
(59, '192.168.1.1', 'vsnuvjsndmdf3df50c2uq2help', '2024-04-17 19:36:05', 'history.php'),
(60, '192.168.1.1', 'vsnuvjsndmdf3df50c2uq2help', '2024-04-17 19:36:07', 'gallery.php'),
(61, '192.168.1.1', 'mc761bp48i00o47c7g2k4si833', '2024-04-17 19:41:06', 'index.php'),
(62, '192.168.1.1', 'vo2eamj4h0qglgbrl0rcoarnrv', '2024-04-17 19:42:12', 'index.php'),
(63, '192.168.1.1', 'vo2eamj4h0qglgbrl0rcoarnrv', '2024-04-17 19:42:17', 'events.php'),
(64, '192.168.1.1', '4l33ifepvnb8mbutk6g4ulore1', '2024-04-17 19:44:23', 'events.php'),
(65, '192.168.1.1', '4l33ifepvnb8mbutk6g4ulore1', '2024-04-17 19:44:27', 'index.php'),
(66, '192.168.1.1', '4l33ifepvnb8mbutk6g4ulore1', '2024-04-17 19:44:30', 'gallery.php'),
(67, '192.168.1.1', '4l33ifepvnb8mbutk6g4ulore1', '2024-04-17 19:44:31', 'history.php'),
(68, '192.168.1.1', 'n93l7ua7fqps3ajk7gdk50kame', '2024-04-17 19:44:47', 'index.php'),
(69, '192.168.1.1', 'n93l7ua7fqps3ajk7gdk50kame', '2024-04-17 19:44:51', 'events.php'),
(70, '192.168.1.1', 'n93l7ua7fqps3ajk7gdk50kame', '2024-04-17 19:44:56', 'history.php'),
(71, '192.168.1.1', 'n93l7ua7fqps3ajk7gdk50kame', '2024-04-17 19:44:59', 'gallery.php'),
(72, '45.11.111.48', '0v9vi8tjg6jeh63t4ormoib605', '2024-04-17 19:45:12', 'index.php'),
(73, '45.11.111.48', '0v9vi8tjg6jeh63t4ormoib605', '2024-04-17 19:45:24', 'events.php'),
(74, '45.11.111.48', '0v9vi8tjg6jeh63t4ormoib605', '2024-04-17 19:45:30', 'history.php'),
(75, '45.11.111.48', '0v9vi8tjg6jeh63t4ormoib605', '2024-04-17 19:45:34', 'gallery.php'),
(76, '37.76.1.198', 'c87h1nppc6dk8vevbcam23tgdv', '2024-04-17 19:50:34', 'index.php'),
(77, '192.168.1.1', 'aarq3rpeis8st77h8nbol620vv', '2024-04-17 20:17:50', 'index.php'),
(78, '192.168.1.1', 'aarq3rpeis8st77h8nbol620vv', '2024-04-17 20:17:52', 'history.php'),
(79, '192.168.1.1', 'aarq3rpeis8st77h8nbol620vv', '2024-04-17 20:37:03', 'events.php'),
(80, '192.168.1.1', 'aarq3rpeis8st77h8nbol620vv', '2024-04-17 20:37:06', 'gallery.php'),
(81, '192.168.1.1', 'p511bnp333v0358nvagd7s3mn6', '2024-04-17 21:00:40', 'index.php'),
(82, '104.166.80.111', '5dghnmpi2fb1c8eo9o9p583nqv', '2024-04-17 21:17:57', 'index.php'),
(83, '68.183.9.137', 'fpf1v5u73vdp1tb4nmst4317k6', '2024-04-17 22:00:00', 'index.php'),
(84, '68.183.9.137', '674mlqbhbnlgsaqgo7rhu12rvr', '2024-04-17 22:00:00', 'index.php'),
(85, '192.168.1.1', 'p6njlenkl3n54tkfl1raj7iuo1', '2024-04-18 08:41:21', 'index.php'),
(86, '192.168.1.1', 'p6njlenkl3n54tkfl1raj7iuo1', '2024-04-18 08:41:24', 'events.php'),
(87, '15.204.183.221', '96sglpp1sgh2jmhones1m6gn3i', '2024-04-18 08:49:39', 'index.php'),
(88, '15.204.183.221', 'nqr55fa8bv5go619c1ddnsr8oa', '2024-04-18 08:49:40', 'index.php'),
(89, '192.168.1.1', 'pni4rs10t6f0ru0ul470fh4pui', '2024-04-18 09:41:40', 'events.php'),
(90, '37.76.30.102', 'qf0brqm1e9ib35g8hovsu2sfi5', '2024-04-18 09:49:00', 'index.php'),
(91, '37.76.30.102', 'qf0brqm1e9ib35g8hovsu2sfi5', '2024-04-18 09:50:43', 'events.php'),
(92, '209.127.97.207', 'hmft5ciagcn6so3u6pq485dqh7', '2024-04-18 10:02:24', 'index.php'),
(93, '170.254.178.184', 'o0rq06b84phdmtp8af88vesjoq', '2024-04-18 10:02:28', 'index.php'),
(94, '138.122.193.66', '7emis97c9qe485qq64046vpdpf', '2024-04-18 10:02:29', 'index.php'),
(95, '132.255.133.107', '5c8304045uvis8t7ism66tcfuj', '2024-04-18 10:05:58', 'index.php'),
(96, '191.102.155.155', '2oid0ep3gl6rvduk27eketl006', '2024-04-18 10:24:26', 'index.php'),
(97, '191.102.157.97', '1l14k7uv02tn3ppprs3j1bjb82', '2024-04-18 10:24:27', 'index.php'),
(98, '170.254.179.165', 'rd3bgmnlf3jf57sjuk2dt0g0pi', '2024-04-18 10:24:31', 'index.php'),
(99, '94.44.242.222', 'rb3c72545g6pcm84515qrlio53', '2024-04-18 10:38:19', 'index.php'),
(100, '84.225.173.52', 'djrh0lh6i93p2b9orc055haumm', '2024-04-18 10:40:19', 'index.php'),
(101, '176.77.141.41', 'djrh0lh6i93p2b9orc055haumm', '2024-04-18 10:40:34', 'events.php'),
(102, '84.225.173.52', 'djrh0lh6i93p2b9orc055haumm', '2024-04-18 10:41:15', 'history.php'),
(103, '206.232.113.146', 'fq9sagjo2lqmg5j4qm7l6l5vod', '2024-04-18 10:55:41', 'index.php'),
(104, '35.153.18.156', 'e6u2s0p8eupgtot2us2eipn0e0', '2024-04-18 10:56:02', 'index.php'),
(105, '107.21.179.42', '6geqrd2sjjrsfukol0nalvchs9', '2024-04-18 10:56:05', 'index.php'),
(106, '186.179.59.32', 'vcq83ej7vbh54bjjkmd95fg24b', '2024-04-18 11:11:55', 'index.php'),
(107, '195.199.251.129', 'aqiloa9ipt5bl7durk99vb25li', '2024-04-18 11:19:57', 'index.php'),
(108, '65.154.226.168', '2gahebrk3sj5hbge7qpmoafm59', '2024-04-18 11:20:11', 'index.php'),
(109, '31.13.103.120', 'lr19uub1fm2o5e676itjva5kf0', '2024-04-18 11:20:34', 'index.php'),
(110, '34.97.73.227', '2em2su0697pctl4rsqe564sil0', '2024-04-18 11:21:08', 'index.php'),
(111, '205.169.39.193', 'qopfbtuueah7852fp91gmdrvgv', '2024-04-18 11:21:19', 'index.php'),
(112, '205.169.39.193', 'qv1ghtc3bb93lugsvlu8sp2gtj', '2024-04-18 11:21:23', 'index.php'),
(113, '65.154.226.166', 'fmpo1tutddu8erc6u2dc530d9a', '2024-04-18 11:22:59', 'index.php'),
(114, '205.169.39.196', 'jo81uknmikktqa3esi5vbaohe3', '2024-04-18 11:23:30', 'index.php'),
(115, '205.169.39.196', 'eibtg10ugq1slj6a827akjqhfs', '2024-04-18 11:23:34', 'index.php'),
(116, '34.218.255.183', 'gjipmjcgv63c7j9reipbofp2b3', '2024-04-18 12:15:15', 'index.php'),
(117, '54.212.207.60', 'i9b04hf5s8m9772huudmsgok0j', '2024-04-18 12:15:17', 'index.php'),
(118, '157.181.26.41', 'huvrl08emplvb59dsm5d5jkna2', '2024-04-18 12:26:28', 'index.php'),
(119, '157.181.26.41', 'huvrl08emplvb59dsm5d5jkna2', '2024-04-18 12:26:49', 'gallery.php'),
(120, '157.181.26.41', 'huvrl08emplvb59dsm5d5jkna2', '2024-04-18 12:27:25', 'events.php'),
(121, '157.181.26.41', 'huvrl08emplvb59dsm5d5jkna2', '2024-04-18 12:29:14', 'history.php'),
(122, '176.77.144.218', '6tql14i1s1o2v8dqq6ltpsv63l', '2024-04-18 13:28:28', 'events.php'),
(123, '104.166.80.254', 'nakfmoa7kgfbrbmokglcaj21um', '2024-04-18 14:10:28', 'index.php'),
(124, '195.199.251.129', 'nsa2s7rplt8q6hm3407g5gl5in', '2024-04-18 14:53:43', 'index.php'),
(125, '65.154.226.168', '3vp1gfsa1fjj7tohipcg57e4jc', '2024-04-18 14:53:54', 'index.php'),
(126, '176.77.151.197', 'a19cqe0cnmj8d0coid0cp7f2tq', '2024-04-18 15:12:40', 'index.php'),
(127, '176.77.151.197', 'a19cqe0cnmj8d0coid0cp7f2tq', '2024-04-18 15:12:50', 'events.php'),
(128, '176.77.151.197', 'es4f95n6bnovk0pcnmplij9dn8', '2024-04-18 15:13:07', 'index.php'),
(129, '176.77.151.161', 'gcmqupa4378mgi9182kneaavlk', '2024-04-18 15:13:57', 'index.php'),
(130, '176.77.151.161', 'gcmqupa4378mgi9182kneaavlk', '2024-04-18 15:14:06', 'events.php'),
(131, '176.77.151.161', 'gcmqupa4378mgi9182kneaavlk', '2024-04-18 15:14:16', 'history.php'),
(132, '176.77.151.161', 'gcmqupa4378mgi9182kneaavlk', '2024-04-18 15:14:17', 'gallery.php'),
(133, '176.77.151.161', '2rqk0bct75ciscauclnkomlcpj', '2024-04-18 15:14:29', 'index.php'),
(134, '176.77.153.237', '3hjft0ifb9gvom4oakqegkoogt', '2024-04-18 18:37:38', 'index.php'),
(135, '176.77.153.237', '3hjft0ifb9gvom4oakqegkoogt', '2024-04-18 18:37:49', 'events.php'),
(136, '176.77.153.237', '3hjft0ifb9gvom4oakqegkoogt', '2024-04-18 18:38:09', 'gallery.php'),
(137, '101.36.97.74', 'r2ne2o26sauo00f2234r6a9rne', '2024-04-18 19:07:16', 'index.php'),
(138, '101.36.97.74', 'deg1g9t17mmki5n6rcc53nv2k4', '2024-04-18 19:07:25', 'index.php'),
(139, '45.90.60.1', 'cmpgumjgvd32j2evd6vh1asddm', '2024-04-18 21:07:45', 'index.php'),
(140, '195.199.251.129', 'gro26gvgadnkn0b9haiv2k1nb2', '2024-04-19 11:56:25', 'index.php'),
(141, '195.199.248.164', 'oli229o31bkib82tusl5dk8mrc', '2024-04-19 12:08:08', 'index.php'),
(142, '37.76.26.173', '57ca0kelhv70h9e0bgv4ho8iro', '2024-04-19 12:14:04', 'index.php'),
(143, '37.76.26.173', '57ca0kelhv70h9e0bgv4ho8iro', '2024-04-19 12:15:16', 'events.php'),
(144, '37.76.26.173', '57ca0kelhv70h9e0bgv4ho8iro', '2024-04-19 12:18:54', 'gallery.php'),
(145, '37.76.26.173', '57ca0kelhv70h9e0bgv4ho8iro', '2024-04-19 12:19:09', 'history.php'),
(146, '168.151.115.237', '6dltp41uhl272cj5dgrldppq2t', '2024-04-19 12:21:22', 'index.php'),
(147, '93.180.195.106', 'e2k1t6khqsgl7to0sqifbs5606', '2024-04-19 12:22:34', 'index.php'),
(148, '35.94.126.190', '0ikku0mor1bn25ujj7fjqrudlt', '2024-04-19 12:44:44', 'index.php'),
(149, '54.244.199.81', '4t4o9gbevkhcnufaeer2jtm1s7', '2024-04-19 12:44:46', 'index.php'),
(150, '45.79.206.66', 'ar06nhc0cv768479eccs7mr8bn', '2024-04-19 13:23:03', 'index.php'),
(151, '208.115.223.68', '5r1jpgpdkm4iojnlhlr43p60mg', '2024-04-19 13:23:04', 'index.php'),
(152, '104.166.80.145', 'mttq1negoln8c1tu1ggmfq9h4s', '2024-04-19 14:07:44', 'index.php'),
(153, '118.193.33.130', '0kcs4uaju6kfofnr87jcj4mb5g', '2024-04-19 14:53:09', 'index.php'),
(154, '152.32.134.166', 'm0hfkv78nua3n870gkkb80bm6e', '2024-04-19 14:53:36', 'index.php'),
(155, '3.10.214.191', 'g3tt9qvh4h6o4s3imc6ajp6urc', '2024-04-19 18:16:44', 'index.php'),
(156, '84.225.177.104', 'ssfevgjarnljslurmm9fj7jcdt', '2024-04-19 20:27:04', 'index.php'),
(157, '84.225.177.104', 'ssfevgjarnljslurmm9fj7jcdt', '2024-04-19 20:28:42', 'events.php'),
(158, '84.225.177.104', 'ssfevgjarnljslurmm9fj7jcdt', '2024-04-19 20:28:49', 'history.php'),
(159, '84.225.177.104', 'ssfevgjarnljslurmm9fj7jcdt', '2024-04-19 20:29:33', 'gallery.php'),
(160, '84.225.177.104', 'mknjh7546l717bpfa02n23qcjq', '2024-04-19 20:40:19', 'index.php'),
(161, '104.166.80.36', 'stonaugfl00jl1muosl9jolmcp', '2024-04-19 22:31:17', 'index.php'),
(162, '159.203.25.140', '5pv8gl2ba5dv6s8im9hbsn3jhs', '2024-04-19 22:53:41', 'index.php'),
(163, '159.203.25.140', 'v3jt6leokvmqtmkcbvekk6oec0', '2024-04-19 22:53:42', 'index.php'),
(164, '51.158.37.210', 'nudve5us5tc4uofpdvji780a9q', '2024-04-20 00:59:53', 'index.php'),
(165, '51.158.37.210', '00iifhnaejj2rpmlfvc9thqe63', '2024-04-20 00:59:55', 'index.php'),
(166, '51.158.37.210', 'f8tnindkfbksd9e8a4k1cv03s5', '2024-04-20 00:59:58', 'index.php'),
(167, '3.80.166.194', 'vg3skeuka4k8t027ih6oh5emcg', '2024-04-20 03:00:08', 'index.php'),
(168, '165.227.232.209', 'vs0hmp21194evs36a46u4n2la7', '2024-04-20 03:29:38', 'index.php'),
(169, '165.227.232.209', 'p3almmlrtnrem474o67ehueh7s', '2024-04-20 03:29:38', 'index.php'),
(170, '66.249.74.96', 'sjnn6ptj9bkh7tpnhvdh0bpl9c', '2024-04-20 06:04:30', 'index.php'),
(171, '66.249.74.110', 'k0h4t6uleagb5ob00tt87qps8v', '2024-04-20 06:04:43', 'index.php'),
(172, '66.249.74.110', '3t1r4hdbqq1r0jm34rsd3ff398', '2024-04-20 06:04:43', 'index.php'),
(173, '66.249.74.110', '0anmado9r0eno9gnp01j9klbm4', '2024-04-20 06:49:30', 'index.php'),
(174, '66.249.74.109', '7jjan72h7o4a6ps3g0dkuk92a2', '2024-04-20 07:34:30', 'events.php'),
(175, '66.249.74.96', 'idg4vnfoqtq589atonkqn1jump', '2024-04-20 08:19:30', 'events.php'),
(176, '66.249.74.96', 's8ud5i8mtirdpes6stuijko9uu', '2024-04-20 10:49:39', 'history.php'),
(177, '66.249.74.110', '764a8fqg9hb9c5kcf6k7staqgs', '2024-04-20 11:19:30', 'gallery.php'),
(178, '35.89.145.126', 'hocqqjj7kd9c5mu1nd1onbn435', '2024-04-20 12:22:27', 'index.php'),
(179, '54.187.155.226', '7o7ohjkesseeu5lfkrgd0tr36p', '2024-04-20 12:22:28', 'index.php'),
(180, '104.166.80.79', 't3kenr14p7iiqa22gtfgv0t7ea', '2024-04-20 14:13:13', 'index.php'),
(181, '5.38.212.221', '7725f2b371db0e36353abf06276b0a9e', '2024-05-03 15:22:05', 'index.php'),
(182, '5.38.212.221', '0c3555420d0d3256f7b527b83940ff99', '2024-05-03 15:37:54', 'index.php'),
(183, '104.166.80.8', '6619195938ffc988c6480f212cc99eb6', '2024-05-03 15:37:58', 'index.php'),
(184, '104.166.80.8', '5fb94227abd3cb3e3ae5c370cf4017ca', '2024-05-03 15:37:59', 'index.php'),
(185, '5.38.212.221', '7725f2b371db0e36353abf06276b0a9e', '2024-05-03 15:38:35', 'events.php'),
(186, '5.38.212.221', '0a544ee936b1a129aa3258c796d4be18', '2024-05-03 15:40:24', 'index.php'),
(187, '5.38.212.221', '0a544ee936b1a129aa3258c796d4be18', '2024-05-03 15:40:28', 'events.php'),
(188, '2a01:4a0:5a::7', 'e125ee694fbb2260d1ab9478643f4bc3', '2024-05-03 15:44:55', 'index.php'),
(189, '104.164.195.116', 'f65b91090b6d183b0bc18c1c82841f3a', '2024-05-03 15:46:29', 'index.php'),
(190, '64.57.140.132', '1ee74657c0d2a35565681c33874a23c7', '2024-05-03 15:46:41', 'index.php'),
(191, '45.133.176.71', '95d5cf8559423c8a6bf2437cbd597933', '2024-05-03 15:47:27', 'index.php'),
(192, '171.67.70.233', 'cba4b561a7bad897007492ca1ebb49ac', '2024-05-03 15:51:12', 'index.php'),
(193, '5.38.212.221', 'b70022e264a28c5e390142cad3db1d16', '2024-05-03 18:50:57', 'index.php'),
(194, '5.38.212.221', 'b70022e264a28c5e390142cad3db1d16', '2024-05-03 18:50:59', 'events.php'),
(195, '5.38.212.221', 'b70022e264a28c5e390142cad3db1d16', '2024-05-03 18:51:00', 'history.php'),
(196, '5.38.212.221', 'b70022e264a28c5e390142cad3db1d16', '2024-05-03 18:51:01', 'gallery.php'),
(197, '171.67.70.233', 'bb0a3cbef738a1c2a16be0b0496f7277', '2024-05-03 19:51:12', 'index.php'),
(198, '209.127.105.213', '7272e61a21b6429a3b7d038d94105112', '2024-05-03 21:07:31', 'index.php'),
(199, '66.249.66.8', '31994e77fc9c22b4cef5eb4939eb372e', '2024-05-03 21:13:29', 'index.php'),
(200, '66.249.66.8', '60728b9a6ca5a174a265ce12b12cf7e1', '2024-05-03 21:13:35', 'index.php'),
(201, '66.249.66.7', '6ca150c0b9770bcae0f74ff63f7478d0', '2024-05-03 21:13:36', 'index.php'),
(202, '212.143.94.254', 'df076c372ebe487e9b9d1356f7cc5eec', '2024-05-03 21:55:03', 'index.php'),
(203, '212.143.94.254', '0a2ba4c21b89f5eb05e810876f56c014', '2024-05-03 21:55:04', 'index.php'),
(204, '171.67.70.238', '6edde0f59855d8891f4bb1009352c77f', '2024-05-03 23:51:12', 'index.php'),
(205, '128.90.176.221', '03625dfd218aa71a25ead5cc62ed50df', '2024-05-03 23:58:46', 'index.php'),
(206, '146.70.114.36', '29ef794dec2ad1ba26f6a7cc3b10c03c', '2024-05-03 23:58:46', 'index.php'),
(207, '172.241.131.141', '80439a6e4b19e9b71f41ab95fc290aed', '2024-05-03 23:58:47', 'index.php'),
(208, '66.115.165.234', 'a917b9e4f468cf51e1c4a19f260ca6b7', '2024-05-03 23:58:47', 'index.php'),
(209, '2604:a880:4:1d0::32f:0', 'aa05d154d617b892ce5103549f389675', '2024-05-03 23:58:48', 'index.php'),
(210, '47.254.25.10', 'c9b413d1e25ec0ca5791ad426b5675c1', '2024-05-04 00:03:24', 'index.php'),
(211, '47.251.11.3', '0b516559349bd49232885bbeeee4ab55', '2024-05-04 00:03:24', 'index.php'),
(212, '47.89.195.210', 'd0655c468feb5a30193ee37f5c55dcb4', '2024-05-04 00:03:24', 'index.php'),
(213, '66.249.66.7', '46bf7ac1bd75e4bdc80a104cb67fc1a1', '2024-05-04 00:13:28', 'events.php'),
(214, '34.78.85.104', '58cae7643550a0e9b998f1494e6ebb11', '2024-05-04 00:18:14', 'index.php'),
(215, '34.140.108.54', '2b7d08330618a5c1b1593970a9b08160', '2024-05-04 00:18:15', 'index.php'),
(216, '179.43.169.181', '2b60151a899c37b719ec2d18143d6ad2', '2024-05-04 00:33:39', 'index.php'),
(217, '5.164.29.116', '889f3835ccdb8709b6a0667fb09fb1ab', '2024-05-04 00:41:11', 'index.php'),
(218, '209.127.107.86', 'f061dab0c9ba4401663e6920fd139081', '2024-05-04 02:02:11', 'index.php'),
(219, '38.154.186.204', 'c948aed989a843418c0df25b7cbde797', '2024-05-04 02:02:17', 'index.php'),
(220, '38.154.214.90', '96dacfbc374c0b7f524fc393a1d34f6c', '2024-05-04 02:02:18', 'index.php'),
(221, '104.166.80.209', '21ec02592c146efe8e1ddc2e0b8a2734', '2024-05-04 03:00:58', 'index.php'),
(222, '66.249.66.7', '5ab8bc11af864ea5afb17e9a8813e476', '2024-05-04 03:14:02', 'history.php'),
(223, '69.55.59.137', 'dee9048761e160a9904b3bcc79735423', '2024-05-04 03:39:42', 'index.php'),
(224, '69.55.59.137', '890b76d4ebc69043d24da95d4081ea28', '2024-05-04 03:39:42', 'index.php'),
(225, '66.249.66.9', '00820a628aa4c4c107e3ab314366399a', '2024-05-04 03:58:28', 'gallery.php'),
(226, '104.166.80.166', '49b9894ce19c60b9bbb335f24ca6b3d0', '2024-05-04 04:26:43', 'index.php'),
(227, '104.166.80.166', '3564c37a5f1dfcaf2e6fda4e42f922ba', '2024-05-04 04:26:44', 'index.php'),
(228, '199.244.88.224', '010920e519ea02b216885c551a108a85', '2024-05-04 12:00:18', 'index.php'),
(229, '104.166.80.13', '6760f7456d1f5d3ef08ba068d40f7d0b', '2024-05-04 14:20:16', 'index.php'),
(230, '66.249.66.7', '67adef3bb9d513167f2651eeb86a58d0', '2024-05-04 15:52:34', 'events.php'),
(231, '35.205.159.124', '5e7053c3b0f5e7249c4f6da66ad3e826', '2024-05-04 19:55:41', 'index.php'),
(232, '178.211.57.76', '3fb77299e43c4bc168d38534ecc0394f', '2024-05-04 19:55:42', 'index.php'),
(233, '66.249.66.23', 'c885658a3453a591aedcbff521c8e83e', '2024-05-04 20:26:09', 'index.php'),
(234, '191.102.174.33', '8e37b2f3ad851e8fc390d4b0e5e7fa00', '2024-05-05 00:17:30', 'index.php'),
(235, '36.99.136.135', '17db540709055e6d7d973e965235ed98', '2024-05-05 03:06:06', 'index.php'),
(236, '36.99.136.130', '5418907b4478a8c95a39114edb51b591', '2024-05-05 03:06:08', 'index.php'),
(237, '104.166.80.130', 'c332d70b5f15c88dd90709687495fc85', '2024-05-05 03:07:54', 'index.php'),
(238, '36.99.136.140', '30f999c1adecf9ab2621d8d02d02bd48', '2024-05-05 03:11:40', 'index.php'),
(239, '54.198.202.15', '245e21e482bf773ba79f01e0f991cd92', '2024-05-05 03:50:43', 'index.php'),
(240, '170.247.223.47', '80698ad0e597c2b6d652d1b898906947', '2024-05-05 10:17:14', 'index.php'),
(241, '193.34.73.187', '39d4c04a72ab44271b3c9bc24a5356a8', '2024-05-05 10:17:15', 'index.php'),
(242, '38.154.198.181', '1ea00b20600562223332c8299384fcff', '2024-05-05 10:17:16', 'index.php'),
(243, '34.219.143.108', '26df79ce304fdd59b5d837283660f38c', '2024-05-05 12:35:52', 'index.php'),
(244, '35.91.234.137', '374e1390b291800966b7234c8b4ec1c7', '2024-05-05 12:35:55', 'index.php'),
(245, '104.166.80.109', 'ccded8909c6b4cf1d081c7f597f27f59', '2024-05-05 14:13:48', 'index.php'),
(246, '87.236.176.140', '961008f451025725048ccafbc4f46798', '2024-05-05 14:15:15', 'index.php'),
(247, '2001:4c4e:10f6:c700:1ca:d6c7:50d9:6e17', '1a74dce2ce0894f2c4bb255f50d2a030', '2024-05-05 17:42:02', 'index.php'),
(248, '87.236.176.104', '125a803755f10976951beab1c892d91f', '2024-05-05 18:28:26', 'index.php'),
(249, '2408:8207:1925:aa70:1a8b:2a57:3acb:aa12', '3cdd56f47a470a858f21b8df14fdc198', '2024-05-06 00:42:15', 'index.php'),
(250, '104.166.80.151', '78534eb66c2aee60f52fe769c85f2da1', '2024-05-06 03:06:39', 'index.php'),
(251, '143.244.168.194', 'f7b6c54c3dc7978769b7e01240bca06b', '2024-05-06 03:55:52', 'index.php'),
(252, '143.244.168.194', '8ebf34bc2b23643ddf7f03e674cf4424', '2024-05-06 03:55:53', 'index.php'),
(253, '5.38.212.221', '091379ce3bda6d9b61cdec5b1aa6a700', '2024-05-06 11:16:50', 'index.php'),
(254, '5.38.212.221', '091379ce3bda6d9b61cdec5b1aa6a700', '2024-05-06 11:20:01', 'events.php'),
(255, '5.38.212.221', '091379ce3bda6d9b61cdec5b1aa6a700', '2024-05-06 11:20:05', 'history.php'),
(256, '5.38.212.221', '091379ce3bda6d9b61cdec5b1aa6a700', '2024-05-06 11:20:06', 'gallery.php'),
(257, '52.35.230.148', '87e2c6dabda113d9433f2eca706672e2', '2024-05-06 12:12:46', 'index.php'),
(258, '54.200.159.118', 'b554648e7644fbe618c0a7d410fa95b1', '2024-05-06 12:12:48', 'index.php'),
(259, '188.165.87.102', 'a76a12416f078e62593dd87d24a12d17', '2024-05-06 13:10:26', 'index.php'),
(260, '188.165.87.110', '947c98caccaa16351e8be58c20d76820', '2024-05-06 13:11:08', 'index.php'),
(261, '104.166.80.77', '406f83d0b454e4f224624923a83165e8', '2024-05-06 14:19:54', 'index.php'),
(262, '51.254.49.106', '4c30e904b1e5138a7aec43bbdb72a0d4', '2024-05-06 14:51:22', 'index.php'),
(263, '199.45.154.18', '54d638daf9982723d5097dcd9ab43c4a', '2024-05-06 16:31:47', 'index.php'),
(264, '66.249.77.98', 'ce0aa5fe3f7a3e61e05ea6e72ce77cac', '2024-05-06 20:22:38', 'index.php'),
(265, '66.249.77.97', '121cf08398c1fcd5f8752ddb4332bb1c', '2024-05-06 20:46:15', 'events.php'),
(266, '104.166.80.21', '0fe1dbd73897169e03de022553c4ca70', '2024-05-07 03:08:07', 'index.php'),
(267, '54.88.179.33', '244945d2df5f902b011d3e15f49b9a20', '2024-05-07 04:42:11', 'index.php'),
(268, '54.88.179.33', 'f09ccae44a953a926020610b912a034b', '2024-05-07 04:42:12', 'index.php'),
(269, '54.88.179.33', '566bced1f7bba7ac59f79c428a3cc2db', '2024-05-07 04:42:12', 'index.php'),
(270, '222.249.228.245', 'b2470e4a44ee78022a9f0685128e6ce1', '2024-05-07 07:51:20', 'index.php'),
(271, '34.222.129.0', 'ec78659acfea1057226fd0a79eb61cd3', '2024-05-07 09:10:55', 'index.php'),
(272, '123.58.200.120', 'da4421e1fde839f6158f964067637b07', '2024-05-07 11:23:58', 'index.php'),
(273, '123.58.200.120', '28758e47f34f080bc36e3adcf5f7b899', '2024-05-07 11:24:33', 'index.php'),
(274, '65.154.226.166', 'b6eae62c6aeac78e29a1ab1bcb9f050d', '2024-05-07 12:06:18', 'index.php'),
(275, '209.38.138.11', '902c77bcb72c8f00734e9bd641cdfc29', '2024-05-07 13:27:34', 'index.php'),
(276, '209.38.138.11', '4e420ec82d1bb97eb3c60ad58296fd1e', '2024-05-07 13:27:35', 'index.php'),
(277, '35.93.10.224', 'e48c58e4d4131b60382dd34b01bde5f4', '2024-05-07 13:49:30', 'index.php'),
(278, '34.221.37.140', '86692150fed1bf17a42626c42589aaa0', '2024-05-07 13:49:38', 'index.php'),
(279, '104.166.80.8', '9894c1b8354af882452deaa218d9d117', '2024-05-07 14:07:10', 'index.php'),
(280, '87.236.176.67', '591a97f5bfb8b80a996d9c594d1762b6', '2024-05-07 16:56:54', 'index.php'),
(281, '195.211.77.142', '9cc61ef75a92099764816bb8b271ae30', '2024-05-07 19:34:05', 'index.php'),
(282, '195.211.77.142', '23eaa5c626baf11f498fc617ddbb3a1c', '2024-05-07 19:34:16', 'index.php'),
(283, '216.24.213.27', 'a2423ec7e80ccd677d61b27c9993551e', '2024-05-07 21:17:37', 'index.php'),
(284, '152.32.218.201', '8df0f018019e3bf736e4e58254ccb23f', '2024-05-08 01:36:17', 'index.php'),
(285, '152.32.218.201', 'e1682286196622d4721647787df5c3bf', '2024-05-08 01:39:45', 'index.php'),
(286, '87.236.176.111', 'e58e9021f714a31639a9abb0b2312bf8', '2024-05-08 03:03:10', 'index.php'),
(287, '104.166.80.230', '79d355e041700e5e5cd4017ff318159c', '2024-05-08 03:35:12', 'index.php'),
(288, '161.35.90.53', '11b9ee7270b58ae2512e86dcde7c6368', '2024-05-08 04:35:47', 'index.php'),
(289, '161.35.90.53', '84f5e6dec13f31576f5c770745ae49bd', '2024-05-08 04:35:47', 'index.php'),
(290, '2001:bc8:1201:718:46a8:42ff:fe1c:487f', '5a235391b96740a770ffbcaf88c9f91c', '2024-05-08 04:42:47', 'index.php'),
(291, '2001:bc8:1201:718:46a8:42ff:fe1c:487f', 'e6dad8e24057546b320289de75915215', '2024-05-08 04:42:49', 'index.php'),
(292, '2001:bc8:1201:718:46a8:42ff:fe1c:487f', 'e92bbfacaa4bb2e6aa619ed0ca55fe5f', '2024-05-08 04:42:51', 'index.php'),
(293, '2001:4c4e:1016:c600:a0ab:2f53:1e8a:7f33', '3bf336a8293134b064c5ac0d3a2b2ac8', '2024-05-08 10:09:32', 'index.php'),
(294, '2001:4c4e:1016:c600:a0ab:2f53:1e8a:7f33', '3bf336a8293134b064c5ac0d3a2b2ac8', '2024-05-08 10:13:11', 'events.php'),
(295, '2001:4c4e:1016:c600:a0ab:2f53:1e8a:7f33', '3bf336a8293134b064c5ac0d3a2b2ac8', '2024-05-08 10:13:19', 'history.php'),
(296, '2001:4c4e:1016:c600:a0ab:2f53:1e8a:7f33', '3bf336a8293134b064c5ac0d3a2b2ac8', '2024-05-08 10:13:33', 'gallery.php'),
(297, '104.166.80.209', '67f06d2ffc7ffa9dafbb6fbcaa6ac13e', '2024-05-08 14:41:53', 'index.php'),
(298, '66.249.66.9', '9b2209e7cde0130fe0eaf0bf0f0ab9f7', '2024-05-08 22:58:03', 'events.php'),
(299, '199.244.88.232', '347426375df56c441ad0002a4d184b84', '2024-05-09 02:09:48', 'index.php'),
(300, '104.166.80.28', '9cf9cf7d5ef8862c1139abe5e76c1687', '2024-05-09 03:25:59', 'index.php'),
(301, '66.249.66.7', '457749f24ca9456cec2b338c458d6d4d', '2024-05-09 09:46:25', 'events.php'),
(302, '66.29.152.203', '6d8ce0f139a6c914951ef019b5a861b0', '2024-05-09 09:51:41', 'index.php'),
(303, '88.209.214.211', '85dba1692e48ce11a47695c80f45f68e', '2024-05-09 10:53:28', 'index.php'),
(304, '35.89.77.136', 'da6241d832d787811f694e82af1d33d8', '2024-05-09 13:07:36', 'index.php'),
(305, '52.13.98.235', 'f6a41a0f932a22cbe3c1fb464160d550', '2024-05-09 13:07:48', 'index.php'),
(306, '104.166.80.147', '83c19b65de2815760ba02fce5855f4aa', '2024-05-09 14:41:43', 'index.php'),
(307, '198.235.24.76', 'd4fba7b62a826f342aec91f38e858ae9', '2024-05-09 21:58:15', 'index.php'),
(308, '104.166.80.192', '470f4d032a0ce0fa35e5d03cce552e7a', '2024-05-10 03:22:42', 'index.php'),
(309, '164.92.251.125', 'bad80d105d3c1a633f6a678822d04561', '2024-05-10 04:24:56', 'index.php'),
(310, '164.92.251.125', 'c2186d034b41846c2e74114cb30281cb', '2024-05-10 04:24:56', 'index.php'),
(311, '104.166.80.0', 'b2736c262bd779224617bcec117291e3', '2024-05-10 14:28:46', 'index.php'),
(312, '2001:bc8:1201:2b:ba2a:72ff:fed9:efeb', 'f6991cb2672f96db5d687c3e53ecdd48', '2024-05-10 22:35:13', 'index.php'),
(313, '2001:bc8:1201:2b:ba2a:72ff:fed9:efeb', 'd3647d3462e49f145c0cfeb8e80e3400', '2024-05-10 22:35:15', 'index.php'),
(314, '2001:bc8:1201:2b:ba2a:72ff:fed9:efeb', '5d3b8118baa102a2a08bfc4fd3a097c3', '2024-05-10 22:35:18', 'index.php'),
(315, '104.166.80.83', '4d7f096fe18dad7be6687a001838fe70', '2024-05-11 03:12:54', 'index.php'),
(316, '35.203.211.244', '553701ed89fb4eb7e6d9c9fe9d0a3af9', '2024-05-11 04:01:27', 'index.php'),
(317, '35.86.183.188', '1514115147c3ac397fa0680e61e30f87', '2024-05-11 06:57:56', 'index.php'),
(318, '94.44.234.253', '6240d91d0cbcf0ee02bde7bde91c4136', '2024-05-11 11:10:07', 'index.php'),
(319, '179.43.152.66', 'e3bf39b188b3d06caf321f22e975d949', '2024-05-11 16:08:51', 'index.php'),
(320, '2408:8207:1925:aa70:8cbe:2e7c:14e9:b97', 'b18e227833979ecafed34b1727545ea1', '2024-05-12 00:39:17', 'index.php'),
(321, '161.35.37.52', '3843642f91249d4238c245e90ccd2386', '2024-05-12 03:35:13', 'index.php'),
(322, '161.35.37.52', 'd700d4fce792865e1c8b75c0d307b0fa', '2024-05-12 03:35:13', 'index.php'),
(323, '66.249.77.98', 'b0a5733b4b0c108ca14b4510cd81e45c', '2024-05-12 05:17:11', 'index.php'),
(324, '69.55.59.103', '4e9a09910b019398b6a6eeab33044b64', '2024-05-12 08:02:20', 'index.php'),
(325, '69.55.59.103', 'd5f837933de21ada1cac891f90c419b0', '2024-05-12 08:02:20', 'index.php'),
(326, '66.29.152.203', '0d7a157fed5dab51857513d492d5dedf', '2024-05-12 09:54:38', 'index.php'),
(327, '54.202.114.127', '90b624a02013e2fe1a95059854351e37', '2024-05-13 12:36:28', 'index.php'),
(328, '18.236.228.140', '6df22186eb115b8b55bbf9d778f5d6ff', '2024-05-13 12:36:29', 'index.php'),
(329, '104.166.80.117', '82d95670705c0aef926441053cfffffe', '2024-05-13 14:45:53', 'index.php'),
(330, '198.235.24.64', 'a20ae2cff34c58f253ad7b2c4e31f4ee', '2024-05-13 22:36:34', 'index.php'),
(331, '68.183.76.52', '6a5c10d9b122588ac18bceff80335aef', '2024-05-14 02:55:32', 'index.php'),
(332, '68.183.76.52', '9ff0b7cf208447282edc25cf2226dc88', '2024-05-14 02:55:32', 'index.php'),
(333, '104.166.80.158', '28b450b7fe7e3c64f33a6ae274e99759', '2024-05-14 03:55:40', 'index.php'),
(334, '2a00:1110:232:487e:0:1c:efc0:2401', '623b277b468dc320ee23fd019816f5fc', '2024-05-14 09:02:54', 'index.php'),
(335, '66.249.66.7', '45957fd70acc81f6b3e47be7e09c87a6', '2024-05-14 12:24:37', 'index.php'),
(336, '66.249.66.8', '798bed04b18cbc0aa95176f27dbbd7d6', '2024-05-14 12:24:38', 'index.php'),
(337, '54.188.15.54', '45b95f2b3fbcce4a4104ac9d4836f441', '2024-05-14 12:52:26', 'index.php'),
(338, '198.235.24.147', '55124eb67fe4af3fa89df7a825d45a95', '2024-05-14 14:39:16', 'index.php'),
(339, '65.154.226.166', '82620e744e28604dfbf9b605835c5e47', '2024-05-14 15:38:57', 'index.php'),
(340, '66.249.66.9', '51d5c01f7a8e935f1cb61b0ed39e7096', '2024-05-14 17:02:21', 'events.php'),
(341, '66.249.66.7', '61ab8a7bac272505f509480f2141242a', '2024-05-14 17:47:36', 'index.php'),
(342, '195.211.77.142', '06fffd6be41e47871a721f0259507e7e', '2024-05-14 22:44:19', 'index.php'),
(343, '195.211.77.142', '3dc67c09d8566a9fb8864a502eb64e41', '2024-05-14 22:44:45', 'index.php'),
(344, '66.249.66.7', '65228928705b1990cfeba0f396146686', '2024-05-15 10:18:28', 'history.php'),
(345, '195.199.251.129', '988e99730f742e7bebb67aa778624763', '2024-05-15 10:28:04', 'index.php'),
(346, '54.71.187.124', '1d85f3b575c555f426f0d939fdc23bca', '2024-05-15 10:36:52', 'index.php'),
(347, '54.71.187.124', '54683317227eeac971af1a2367a9c141', '2024-05-15 10:36:53', 'index.php'),
(348, '195.199.251.129', 'e1c22af827e03c5ad746d39054b73f52', '2024-05-15 10:46:44', 'index.php'),
(349, '84.2.118.211', '7290098116ec5cdcd391e62bcf19560a', '2024-05-15 10:47:51', 'index.php'),
(350, '66.249.64.9', '310ad8a039081617d8e191921332e115', '2024-05-15 10:55:51', 'index.php'),
(351, '195.199.251.129', 'b47979d1c9698ae171f12999e9252d50', '2024-05-15 11:26:49', 'index.php'),
(352, '2a02:ab88:6a82:4900:6c9a:2cee:ceb0:ae61', '0d55e573f76cd3ae81cc86ac94e0051b', '2024-05-15 12:13:59', 'index.php'),
(353, '2a02:ab88:6a82:4900:6c9a:2cee:ceb0:ae61', '0d55e573f76cd3ae81cc86ac94e0051b', '2024-05-15 12:14:20', 'events.php'),
(354, '2a02:ab88:6a82:4900:6c9a:2cee:ceb0:ae61', '0d55e573f76cd3ae81cc86ac94e0051b', '2024-05-15 12:14:39', 'history.php'),
(355, '2a02:ab88:6a82:4900:6c9a:2cee:ceb0:ae61', '0d55e573f76cd3ae81cc86ac94e0051b', '2024-05-15 12:14:49', 'gallery.php'),
(356, '65.154.226.170', 'f09005a790699189d994afef99f916ae', '2024-05-15 12:15:36', 'index.php'),
(357, '205.169.39.156', 'ec84a94f1a9f228419f65c626aaa34fa', '2024-05-15 12:16:14', 'index.php'),
(358, '205.169.39.156', '704ecddc2056a055332a328425d3452a', '2024-05-15 12:16:17', 'index.php'),
(359, '66.249.66.7', '388b5576885e9573292dc292ef338320', '2024-05-15 12:18:29', 'index.php'),
(360, '69.255.238.41', '1ea9decc226b55a8e2e37f550187e466', '2024-05-15 12:19:53', 'index.php'),
(361, '52.140.99.202', '95d1008f4287fab721c321f7d6f4f726', '2024-05-15 12:22:24', 'index.php'),
(362, '52.140.99.202', 'c4d9da4b1c2ed3946ae934d96ad1b27a', '2024-05-15 12:22:26', 'index.php'),
(363, '52.140.99.202', '052ba20a11c5f567c49225328a4c8d1f', '2024-05-15 12:22:27', 'index.php'),
(364, '54.208.201.249', 'a9a9ae6366f9a37e0edfd676ac90f12a', '2024-05-15 12:22:28', 'index.php'),
(365, '207.241.232.212', 'a01805bccbf9352d142f8c2ab3040fb8', '2024-05-15 12:22:29', 'index.php'),
(366, '52.140.99.202', '052ba20a11c5f567c49225328a4c8d1f', '2024-05-15 12:23:29', 'events.php'),
(367, '195.199.251.129', 'b8ededf18d9193a0f0664b65c47d8dc0', '2024-05-15 12:45:08', 'index.php'),
(368, '66.249.64.13', '523e06732d4d2b85f62b328020cf3705', '2024-05-15 12:55:58', 'index.php'),
(369, '66.249.64.14', '69759290524eac85a6d6fc99843f2446', '2024-05-15 12:56:08', 'index.php'),
(370, '66.249.64.13', 'ec0195fb1f2e31000a986612252f8da3', '2024-05-15 12:56:08', 'index.php'),
(371, '65.154.226.171', '1ff2130c49f043eb0b2937c1a94e3db6', '2024-05-15 13:06:15', 'index.php'),
(372, '65.154.226.166', '35c446d61f38781acda50e0ef4d283ab', '2024-05-15 13:07:32', 'index.php'),
(373, '2a00:6800:3:7bc::1', '2429ce81093a9ae1ce1894d8ec50f745', '2024-05-15 13:19:01', 'index.php'),
(374, '66.249.66.8', 'da2048ca19ac3c485e2ebd5c32ae27e3', '2024-05-15 13:48:29', 'events.php'),
(375, '2a02:ab88:b07:b170::100b', '5ec6cdc87f14a3bc3bf4487d03588313', '2024-05-15 13:54:52', 'index.php'),
(376, '2a02:ab88:b07:b170::100b', '5ec6cdc87f14a3bc3bf4487d03588313', '2024-05-15 13:54:56', 'events.php'),
(377, '2a02:ab88:b07:b170::100b', '5ec6cdc87f14a3bc3bf4487d03588313', '2024-05-15 13:55:00', 'history.php'),
(378, '2a02:ab88:b07:b170::100b', '5ec6cdc87f14a3bc3bf4487d03588313', '2024-05-15 13:55:02', 'gallery.php'),
(379, '134.238.236.250', 'f105d7434d8245d16d18febb00601657', '2024-05-15 14:26:18', 'index.php'),
(380, '65.154.226.100', '4d0cb993a8e5bc6818b1c8239b21d100', '2024-05-15 14:26:22', 'index.php'),
(381, '65.154.226.100', '88ed5e38bc5601c97000aca6dcd213b7', '2024-05-15 14:26:24', 'index.php'),
(382, '65.154.226.100', 'e6c5061ab8be6eb7ae45fa69a8bd6005', '2024-05-15 14:26:25', 'index.php'),
(383, '65.154.226.100', 'c5baffa6bb6390ad9182534dad72bc72', '2024-05-15 14:26:25', 'index.php'),
(384, '65.154.226.100', '1272cc832c421012f0bd911d8c596e42', '2024-05-15 14:26:25', 'index.php'),
(385, '65.154.226.100', 'a19f584319417b4dacd949a9a924f82c', '2024-05-15 14:26:25', 'index.php'),
(386, '207.241.235.246', 'de08561b1b8a1af611666fb56f751a9b', '2024-05-15 14:26:29', 'index.php'),
(387, '134.238.236.250', 'f105d7434d8245d16d18febb00601657', '2024-05-15 14:26:57', 'events.php'),
(388, '134.238.236.250', 'f105d7434d8245d16d18febb00601657', '2024-05-15 14:27:15', 'history.php'),
(389, '134.238.236.250', 'f105d7434d8245d16d18febb00601657', '2024-05-15 14:27:42', 'gallery.php'),
(390, '54.159.206.62', '4d12c669bf8395519ed3d33055954796', '2024-05-15 14:29:07', 'index.php'),
(391, '18.218.53.110', '4a0f99ca5747f11271df7d35eea50de7', '2024-05-15 14:29:07', 'index.php'),
(392, '18.222.182.194', 'c630aba9d07556fe55d6bf83dff88d65', '2024-05-15 14:29:07', 'index.php'),
(393, '34.98.143.96', '9049e98f727e367391665434a5bb4274', '2024-05-15 14:29:07', 'index.php'),
(394, '34.98.143.98', '78ad806626519006c8b4c27036a5b3f4', '2024-05-15 14:29:07', 'index.php'),
(395, '35.222.190.7', 'cacc6e941022bc967264f35e515cd958', '2024-05-15 14:29:08', 'index.php'),
(396, '34.98.143.97', '914f38187a7778d4a59f3ffe009b1eff', '2024-05-15 14:29:17', 'index.php'),
(397, '34.98.143.98', 'ed38d26021050bdf5dbc869b84fb20ac', '2024-05-15 14:29:18', 'index.php'),
(398, '18.234.170.14', '9289b35eef0ef9bbb4e35e3a8cd366eb', '2024-05-15 14:29:23', 'index.php'),
(399, '34.98.143.98', '77dba88b22c98b68e7582badcca86634', '2024-05-15 14:29:23', 'index.php'),
(400, '18.224.4.172', 'f89bea192814cfb6aa7bfd87efd24871', '2024-05-15 14:29:23', 'index.php'),
(401, '35.222.190.7', 'b9d008fd64197130885b201f1b258926', '2024-05-15 14:29:23', 'index.php'),
(402, '18.220.28.135', 'd3de15a2c74a5aa23af98359ce7cba12', '2024-05-15 14:29:23', 'index.php'),
(403, '34.98.143.96', '104e2269745537c21b2a6b9b0b774b5c', '2024-05-15 14:29:23', 'index.php'),
(404, '77.91.86.95', '67c4941d27a7ac9ff098c1701124b791', '2024-05-15 14:29:32', 'index.php'),
(405, '34.98.143.96', '424650db46840f3982037a205b562a6c', '2024-05-15 14:29:33', 'index.php'),
(406, '34.98.143.97', 'a91d2845e8f7e77fd7c5097756814e03', '2024-05-15 14:29:33', 'index.php'),
(407, '192.42.116.214', 'aca9587c1e50b24a7c96c046ca2de9b2', '2024-05-15 14:30:08', 'index.php'),
(408, '212.95.50.77', '5674644144e6a61753bde181d0349aee', '2024-05-15 14:30:16', 'index.php'),
(409, '35.93.119.247', '4f4a5bc87d1aa8412a955edf773ad619', '2024-05-15 14:31:59', 'index.php'),
(410, '18.237.247.58', 'd6d7afffe26c2068e4dc67361c498d82', '2024-05-15 14:32:02', 'index.php'),
(411, '65.154.226.169', 'f7572890631936dbeef7211d22509e0e', '2024-05-15 14:32:22', 'history.php'),
(412, '65.154.226.170', '1b7dc3cc8e726e388e2cdf14f615b18b', '2024-05-15 14:36:00', 'gallery.php'),
(413, '93.159.230.90', '41d2a6fbb7f8c4c3878dd097765b7e24', '2024-05-15 14:38:55', 'index.php'),
(414, '93.159.230.89', 'b9e20b575b675ee159d85fbbe0454138', '2024-05-15 14:40:27', 'index.php'),
(415, '65.154.226.170', '1d1659fbe1c5d1d54933e3a39cf207bc', '2024-05-15 15:06:29', 'index.php'),
(416, '2001:738:0:560:bebe:a479:460b:9f9f', 'a37f490eaf2a6a6841269b1f4c9d1889', '2024-05-15 15:21:51', 'index.php'),
(417, '2001:738:0:560:bebe:a479:460b:9f9f', 'a37f490eaf2a6a6841269b1f4c9d1889', '2024-05-15 15:22:47', 'events.php'),
(418, '2001:738:0:560:bebe:a479:460b:9f9f', 'a37f490eaf2a6a6841269b1f4c9d1889', '2024-05-15 15:23:00', 'history.php'),
(419, '2001:738:0:560:bebe:a479:460b:9f9f', 'a37f490eaf2a6a6841269b1f4c9d1889', '2024-05-15 15:23:02', 'gallery.php'),
(420, '103.14.143.67', 'afbb6358809e3192b98b2fea59d3845e', '2024-05-15 15:29:24', 'index.php'),
(421, '103.14.143.67', 'd89010d17e0382dc14660babf179c79f', '2024-05-15 15:29:25', 'index.php'),
(422, '65.154.226.169', 'b07458ac8352d42c87fd2dc0ae19f92a', '2024-05-15 15:29:54', 'events.php'),
(423, '65.154.226.167', '940d7bb86de2ba8ab33637d4aef53652', '2024-05-15 15:31:46', 'index.php'),
(424, '203.109.54.73', 'c4bb47e99e7fbd92d72f4f028b07fee7', '2024-05-15 15:34:29', 'index.php'),
(425, '152.39.242.115', '60edd5ae72764c2829de70daa1c3e84c', '2024-05-15 15:34:47', 'index.php'),
(426, '81.95.5.39', 'fd00f9df0743de1242a313a4b6c2f19f', '2024-05-15 15:39:34', 'index.php'),
(427, '95.181.234.31', '89dca4ab0dc71edc5f931afa64e0b07d', '2024-05-15 15:41:36', 'index.php'),
(428, '65.154.226.168', '337a8f407d479bab0f198779304abd99', '2024-05-15 15:46:31', 'index.php'),
(429, '176.100.243.133', '637f704930bb78c6435886ea7230e96e', '2024-05-15 15:58:22', 'index.php'),
(430, '50.3.183.203', 'c3fb2b3f2c812f0a082aedae8f7476da', '2024-05-15 16:01:27', 'index.php'),
(431, '50.3.183.67', '9b82c7c5da11ee146e7c071899142f8b', '2024-05-15 16:01:53', 'index.php'),
(432, '65.154.226.171', 'e6e0fa1b2f8606c6843f6efe6f160958', '2024-05-15 16:22:59', 'index.php'),
(433, '65.154.226.168', '69f94c0f7bd5f7a2c3f446c8d3904b04', '2024-05-15 16:23:00', 'index.php'),
(434, '65.154.226.169', 'c5de853f0fb309ac2f0ec2887cce96fa', '2024-05-15 16:23:00', 'index.php'),
(435, '65.154.226.169', '37a9a5a44c9fd4e97387598689e438c1', '2024-05-15 16:23:03', 'index.php'),
(436, '205.169.39.179', '9fbff79a9e743e9ab1429acf88d0117b', '2024-05-15 16:31:20', 'index.php'),
(437, '205.169.39.179', 'be5fb6d3ffb07ac7908851ce42449285', '2024-05-15 16:31:25', 'index.php'),
(438, '205.169.39.166', '7e59235aedca439985985b0fcf8cc6b8', '2024-05-15 16:31:28', 'index.php'),
(439, '205.169.39.166', '149375c67abe43ad7869255a8c237a27', '2024-05-15 16:31:32', 'index.php');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- A tábla indexei `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT a táblához `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT a táblához `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
