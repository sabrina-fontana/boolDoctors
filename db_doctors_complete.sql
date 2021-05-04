-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 28, 2021 at 10:21 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_doctors`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `msg_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg_lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg_phone_number` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `msg_name`, `msg_lastname`, `msg_email`, `msg_phone_number`, `msg_content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Michele', 'Cofano', 'mick.cofano@gmail.com', '3333333333', 'Salve, ho bisogno di una consulenza.', '2021-04-26 13:43:45', '2021-04-26 13:43:45'),
(2, 1, 'Michele', 'Cofano', 'mick.cofano@gmail.com', '3333333333', 'Salve, ho bisogno di una consulenza.', '2021-04-26 13:44:27', '2021-04-26 13:44:27'),
(3, 1, 'Michele', 'Cofano', 'brutalmachinelol@gmail.com', '3333333333', 'Salve, ho bisogno di una consulenza', '2021-04-26 13:44:50', '2021-04-26 13:44:50');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(211, '2014_10_12_000000_create_users_table', 1),
(212, '2014_10_12_100000_create_password_resets_table', 1),
(213, '2019_08_19_000000_create_failed_jobs_table', 1),
(214, '2021_04_13_135957_create_reviews_table', 1),
(215, '2021_04_13_141203_create_messages_table', 1),
(216, '2021_04_13_141946_create_services_table', 1),
(217, '2021_04_13_143134_create_specializations_table', 1),
(218, '2021_04_13_143346_create_specialization_user_table', 1),
(219, '2021_04_13_143959_create_sponsorships_table', 1),
(220, '2021_04_13_144350_create_sponsorship_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rv_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `rv_lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rv_vote` tinyint(3) UNSIGNED NOT NULL,
  `rv_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rv_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `rv_name`, `rv_lastname`, `rv_vote`, `rv_title`, `rv_content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Michele', 'Cofano', 5, 'Ottimo', 'Vero professionista, soddisfatto al 100%', '2021-04-26 12:16:59', '2021-04-26 12:16:59'),
(2, 1, 'Michela', 'Monti', 5, 'Perfetto', 'La visita più veloce e conteporaneamente migliore della mia vita, praticamente perfetto.', '2021-04-27 10:42:51', '2021-04-27 10:42:51'),
(3, 1, 'Lara', 'Arlotta', 5, 'Amichevole', 'Mi ha messo a mio agio e ha risolto il mio problema, non potevo chiedere di meglio.', '2021-04-27 10:43:28', '2021-04-27 10:43:28'),
(4, 1, 'Marcello', 'Zona', 4, 'Cordiale', 'Gentilissimo, un occhio di riguardo verso il proprio paziente.', '2021-04-27 10:44:02', '2021-04-27 10:44:02'),
(5, 1, 'Davide', 'Ghedini', 3, 'Competente', 'È stato competente nella diagnosi, un pò impacciato nella procedura.', '2021-04-27 10:44:39', '2021-04-27 10:44:39'),
(6, 13, 'Valerio', 'Braschi', 2, 'Lento', 'Ho dovuto aspettare 3 ore per entrare, è sono rimasto dentro per un\'altra ora per un raffreddore.', '2021-04-27 10:45:22', '2021-04-27 10:45:22'),
(7, 13, 'Franco', 'Lunetto', 4, 'Preciso', 'Ha capito subito la causa del problema, davvero professionale.', '2021-04-27 10:45:59', '2021-04-27 10:45:59'),
(8, 13, 'Matteo', 'Fognini', 3, 'Preparato', 'Sapeva esattamente cosa fare, lo consiglio a tutti.', '2021-04-27 10:46:33', '2021-04-27 10:46:33'),
(9, 23, 'Michela', 'Monti', 5, 'Perfetto', 'La visita più veloce e conteporaneamente migliore della mia vita, praticamente perfetto.', '2021-04-27 10:47:42', '2021-04-27 10:47:42'),
(10, 23, 'Lara', 'Arlotta', 5, 'Amichevole', 'Mi ha messo a mio agio e ha risolto il mio problema, non potevo chiedere di meglio.', '2021-04-27 10:48:05', '2021-04-27 10:48:05'),
(11, 23, 'Federica', 'Ruberti', 4, 'Visita dettagliata', 'Ho eseguito una visita dettagliata e sono rimasta soddisfatta sotto ogni punto di vista!', '2021-04-27 10:49:52', '2021-04-27 10:49:52'),
(12, 39, 'Gabriele', 'Nardecchia', 3, 'Rapida', 'La visita è durata molto poco, ma mi sono sentito meglio.', '2021-04-27 10:56:45', '2021-04-27 10:56:45'),
(13, 39, 'Oronzo', 'Ballarò', 5, 'Impeccabile', 'La dottoressa è stata professionale, i prezzi sono onesti e in 3 giorni ha risolto il mio problema.', '2021-04-27 10:58:23', '2021-04-27 10:58:23'),
(14, 39, 'Maria', 'Verdi', 1, 'Mancato appuntamento', 'Dopo aver preso due ore di permesso da lavoro, la dottoressa non era presente all\'appuntamento. Non consiglio!', '2021-04-27 10:59:48', '2021-04-27 10:59:48'),
(15, 41, 'Enrico', 'Bellinelli', 5, 'Fantastica', 'Dottoressa alla mano e super gentile, mi ha fatto sentire a mio agio. Complimenti!', '2021-04-27 11:01:13', '2021-04-27 11:01:13'),
(16, 41, 'Mario', 'Serlito', 5, 'Cordiale', 'Ho avuto brutte esperienze con altri dottori, ma nel suo studio mi sento a casa! Consiglio a tutti', '2021-04-27 11:04:09', '2021-04-27 11:04:09'),
(17, 41, 'Antimo', 'Rosato', 4, 'Professionale', 'Dottoressa professionale e gentile!', '2021-04-27 11:05:40', '2021-04-27 11:05:40'),
(18, 2, 'Giorgio', 'Baglio', 4, 'Ce l\'abbiamo fatta!', 'Grazie al dottor Foreman abbiamo superato il problema al 100%, finalmente si torna alla normalità!', '2021-04-27 11:19:18', '2021-04-27 11:19:18'),
(19, 2, 'Fabiola', 'Marangio', 3, 'Nella media', 'Sono andata dal Dott.Foreman per un controllo, la visita è andata bene ma il prezzo era esorbitante!', '2021-04-27 11:21:00', '2021-04-27 11:21:00'),
(20, 3, 'Franco', 'Del Vecchio', 5, 'Come un amico', 'Il dottor Chase ti fa sentire a tuo agio fin dal primo momento!', '2021-04-27 11:23:04', '2021-04-27 11:23:04'),
(21, 4, 'Gianluca', 'Prinari', 3, 'CovidTest', 'Ho eseguito un test Covid, fortunatamente negativo. 3 stelle a causa del prezzo anche se la Dottoressa non ha colpe!', '2021-04-27 11:24:29', '2021-04-27 11:24:29'),
(22, 4, 'Dario', 'Bello', 5, 'Test CoronaVirus', 'La dottoressa Allison è stata gentilissima e non ho sentito alcun fastidio al naso. Fortunatamente il test è risultato negativo', '2021-04-27 11:26:10', '2021-04-27 11:26:10'),
(23, 4, 'Marco', 'De Luca', 4, 'Cura AntiCovid', 'Ho eseguito il test con la dottoressa e, dopo essere risultato positivo, mi ha curato perfettamente', '2021-04-27 11:28:05', '2021-04-27 11:28:05'),
(24, 57, 'Alex', 'Asole', 5, 'Ottimo', 'Fantastico, Ottavio è il numero 1 nel suo campo!', '2021-04-27 11:31:55', '2021-04-27 11:31:55'),
(25, 57, 'Michele', 'Cofano', 5, 'Super', 'Fantastico, Ottavio è il numero 1 nel suo campo!', '2021-04-27 11:32:36', '2021-04-27 11:32:36'),
(26, 57, 'Mirco', 'Caltagirone', 5, 'Buon lavoro', 'Do 5 stelle perchè èstato preciso!', '2021-04-27 11:33:58', '2021-04-27 11:33:58'),
(27, 57, 'User', 'User', 5, 'Cool', 'I had an issue when I was on Vacation in Italy but Doctor Ottavio solved almost instantly! Thank you', '2021-04-27 11:37:03', '2021-04-27 11:37:03'),
(28, 57, 'Mario', 'Rossi', 5, 'Ottimo', 'Ottimo, grande Dottore', '2021-04-27 11:38:03', '2021-04-27 11:38:03'),
(29, 57, 'Federica', 'Giannon', 5, 'Ottimo', 'Il dottore è un mito!', '2021-04-27 11:38:49', '2021-04-27 11:38:49'),
(30, 55, 'Anonimo', 'Anonimo', 1, 'Dottore?', 'Lui si reputa un dottore qualificato ma non è competente, sconsiglio vivamente', '2021-04-27 11:41:24', '2021-04-27 11:41:24'),
(31, 36, 'Giordana', 'Portone', 2, 'Dottore o cantante?', 'Gentilissimo e disponibile, unica pecca...canta mentre visita..', '2021-04-27 11:44:25', '2021-04-27 11:44:25'),
(32, 5, 'Fabio', 'Canva', 4, 'Chirurgo competente', 'Ottimo lavoro, sono soffisfatto', '2021-04-27 11:46:50', '2021-04-27 11:46:50'),
(33, 5, 'Martina', 'Genio', 5, 'Eccellente', 'Grazie al dottore sono riuscita a risolvere un problema grazie alla sua chirurgia!', '2021-04-27 11:47:42', '2021-04-27 11:47:42'),
(34, 5, 'Ernesto', 'Spalla', 3, 'Problema', 'L\'operazione è avvenuta con successo ma ho avuto problemi nei giorni successivi', '2021-04-27 11:48:27', '2021-04-27 11:48:27'),
(35, 6, 'Mara', 'Maionchi', 4, 'Preparato', 'Il dottor Kurtner è preparato e disponibile, consiglio', '2021-04-27 11:50:08', '2021-04-27 11:50:08'),
(36, 7, 'Enrica', 'Spartani', 5, 'Numero 1', 'La dottoressa Remy è semplicemente fantastica!', '2021-04-27 11:51:45', '2021-04-27 11:51:45'),
(37, 7, 'Lorenzo', 'Baru', 3, 'Assistente', 'La dottoressa è formidabile, purtroppo la sua assistente non è competente', '2021-04-27 11:53:11', '2021-04-27 11:53:11'),
(38, 8, 'Sonia', 'Marocco', 1, 'Non professionale', 'Il dottore continuava a farmi delle avance durante la visita. Mi muoverò per vie legali', '2021-04-27 11:55:41', '2021-04-27 11:55:41'),
(39, 8, 'Leopoldo', 'Magalli', 1, 'Mancato appuntamento', 'Il dottore non si è presentato all\'appuntamento', '2021-04-27 11:56:39', '2021-04-27 11:56:39'),
(40, 9, 'Ennio', 'Morri', 4, 'Specialista', 'La dottoressa Lisa è una specialista nel suo campo', '2021-04-27 11:58:00', '2021-04-27 11:58:00'),
(41, 9, 'Mario', 'Pestone', 2, 'Approssimativa', 'La dottoressa si è mostrata poco preoccupata della mia patologia. Sconsigliata.', '2021-04-27 12:11:24', '2021-04-27 12:11:24'),
(42, 9, 'Paolo', 'Borghese', 1, 'Pessima', 'Per nulla attenta alle esigenze del paziente', '2021-04-27 12:14:01', '2021-04-27 12:14:01'),
(43, 3, 'Luca', 'Bizzari', 3, 'Simpatico', 'Ha cercato i  tutti i modi di mettermi a mio agio, anche se non ci è riuscito ho apprezzato', '2021-04-27 12:16:57', '2021-04-27 12:16:57'),
(44, 6, 'Michele', 'Salutare', 3, 'Competente', 'Il dottor Kurtner si è dimostrato molto competente e preparato', '2021-04-27 12:20:03', '2021-04-27 12:20:03'),
(45, 6, 'Lara', 'Arlotta', 4, 'Amorevole', 'È stato gentilissimo e super disponibile, uno dei migliori', '2021-04-27 12:21:35', '2021-04-27 12:21:35'),
(46, 6, 'Andrea', 'Ferretti', 2, 'Poco serio', 'Non è stato per nulla serio per tutta la durata della visita, fastidioso', '2021-04-27 12:22:36', '2021-04-27 12:22:36'),
(47, 8, 'Massimo', 'Caputo', 3, 'Puntuale', 'Al mio appuntamento si è presentato in perfetto orario', '2021-04-27 12:23:52', '2021-04-27 12:23:52'),
(48, 16, 'Samantha', 'Michelini', 5, 'Esperto', 'Il dottor Cox è davvero esperto nel suo lavoro, serio e puntuale', '2021-04-27 12:25:05', '2021-04-27 12:25:05'),
(49, 16, 'Angelo', 'Selvi', 3, 'Poco socievole', 'Il dottore non si è preoccupato di farmi sentire tranquillo per tutta la durata della visita, ma è stato comunque molto bravo', '2021-04-27 12:27:11', '2021-04-27 12:27:11'),
(50, 16, 'Manuel', 'Istrioni', 2, 'Antipatico', 'Non è in grado di prendere nulla sul ridere e risponde in malo modo', '2021-04-27 12:28:32', '2021-04-27 12:28:32'),
(51, 25, 'Gino', 'Pistoia', 5, 'Capace', 'La dottoressa è esperta, gentile e non ti giudica per le malattie che hai, consigliatissima', '2021-04-27 12:29:50', '2021-04-27 12:29:50'),
(52, 26, 'Marco', 'Giovanardi', 4, 'Ottimo lavoro', 'Il dottor Alex è stato onesto, competente e non ha perso tempo a guarirmi', '2021-04-28 05:52:33', '2021-04-28 05:52:33'),
(53, 26, 'Teresa', 'Forgia', 5, 'Eccellente', 'Con lui ho risolto immediatamente il problema!', '2021-04-28 05:53:59', '2021-04-28 05:53:59'),
(54, 26, 'Mario', 'Magnotta', 4, 'Buon lavoro', 'Sono andato dal dottor Alex per una visita di controllo ed è andato tutto bene, lui è molto simpatico', '2021-04-28 05:55:00', '2021-04-28 05:55:00'),
(55, 34, 'Lara', 'Esposito', 3, 'Discreto', 'Ero andata giusto per una visita ma ho speso più del dovuto!', '2021-04-28 05:56:07', '2021-04-28 05:56:07'),
(56, 34, 'Armando', 'Diaz', 5, 'Grande!', 'Grandissimo dottor Barozzi, riesce a farmi sentire sempre a casa', '2021-04-28 05:56:45', '2021-04-28 05:56:45'),
(57, 38, 'Gregorio', 'Casa', 2, 'Pessimo', 'Poco professionale.!', '2021-04-28 05:58:30', '2021-04-28 05:58:30'),
(58, 42, 'Nina', 'Oncia', 5, 'Il numero 1', 'Dottor Garcia, come dice il cognome stesso...una garanzia!', '2021-04-28 06:00:57', '2021-04-28 06:00:57'),
(59, 42, 'Adele', 'Potere', 5, 'Simpatico', 'Il dottore oltre che essere professionale è anche simpatico, consiglio!', '2021-04-28 06:01:52', '2021-04-28 06:01:52'),
(60, 49, 'Martina', 'Colombari', 4, 'Competente', 'Dottoressa competente e mi ha aiutato!', '2021-04-28 06:02:52', '2021-04-28 06:02:52'),
(61, 49, 'Francesca', 'Androne', 5, 'Ottimo lavoro', 'La dottoressa Giorgia, oltre che essere molto gentile, è stata fin da subito competente', '2021-04-28 06:04:36', '2021-04-28 06:04:36'),
(62, 49, 'Alex', 'Asole', 3, 'Nella media', 'La dottoressa è molto simpatica, ma ha visitato contemporaneamente me ed un altro paziente', '2021-04-28 06:05:30', '2021-04-28 06:05:30'),
(63, 49, 'Osvaldo', 'Paniccia', 4, 'Competente', 'La dottoressa Gorelli si contraddistingue per la sua simpatia e competenza', '2021-04-28 06:06:14', '2021-04-28 06:06:14'),
(64, 22, 'Andrea', 'De Giorgi', 4, 'Bravissimo', 'Dottore giovane e alla mano, oltre che ovviamente competente', '2021-04-28 06:09:15', '2021-04-28 06:09:15'),
(65, 22, 'Marta', 'Magna', 5, 'Bello e bravo', 'Cole, oltre che essere amico di infanzia, ha sempre seguito il suo sogno di diventare pneumologo e sono felice che ci sia riuscito', '2021-04-28 06:10:44', '2021-04-28 06:10:44'),
(66, 31, 'Kevin', 'De Porta', 1, 'Brutta esperienza', 'Il dottore è stato bravo e gentile, non fosse per il fatto che nel suo studio ho trovato degli insetti. Poco igienico!!', '2021-04-28 06:12:53', '2021-04-28 06:12:53'),
(67, 31, 'Teresa', 'Spigoni', 5, 'Meraviglioso', 'Il dottor Hurt è dolcissimo, fa benissimo il suo lavoro e, al contrario di quello detto dall\'utente che ha votato 1 stella, ho trovato lo studio impeccabile e pulitissimo', '2021-04-28 06:14:34', '2021-04-28 06:14:34'),
(68, 46, 'Vito', 'Morata', 3, 'Alle prime armi', 'Il dottore è gentile ma alle prime armi. Avrà modo di fare esperienza', '2021-04-28 06:16:21', '2021-04-28 06:16:21'),
(69, 52, 'Luca', 'Lucchetto', 5, 'Simpatico', 'Simpatico e alla mano, il dottor Ascani si differenzia proprio per le sue qualità!', '2021-04-28 06:17:18', '2021-04-28 06:17:18'),
(70, 52, 'Ginetta', 'Normandi', 4, 'Prima visita', 'Marcello, anche se giovanissimo, ha saputo gestire una situazione come la mia egregiamente!', '2021-04-28 06:18:32', '2021-04-28 06:18:32'),
(71, 52, 'Rita', 'Foresta', 5, 'Superbo', 'Dottor Ascani semplicemente il migliore!', '2021-04-28 06:19:16', '2021-04-28 06:19:16'),
(72, 56, 'Marina', 'Massironi', 3, 'Discreta', 'Dottoressa Marta simpatica ma pecca nei costi dei suoi servizi..!', '2021-04-28 06:21:15', '2021-04-28 06:21:15'),
(73, 56, 'Aldo', 'Baglio', 5, 'Prima visita', 'Prima visita con la dottoressa Veronesi andata benissimo. Era compresa in un buono su un sito e non ho pagato nulla!', '2021-04-28 06:22:08', '2021-04-28 06:22:08'),
(74, 56, 'Giovanni', 'Storti', 5, 'Ha risolto', 'Ha risolto il mio problema!', '2021-04-28 06:23:04', '2021-04-28 06:23:04'),
(75, 56, 'Giacomo', 'Poretti', 2, 'Non soddisfatto', 'Dottoressa poco attenta alla spiegazione del problema', '2021-04-28 06:23:38', '2021-04-28 06:23:38'),
(76, 56, 'Michele', 'Cofano', 4, 'Molto buono', 'Molto buono il servizio messo a disposizione dalla Dottoressa', '2021-04-28 06:24:32', '2021-04-28 06:24:32'),
(77, 59, 'Antonina', 'Cannavacciuola', 3, 'Dottore competente', 'Dottore competente, do 3 stelle perchè canticchiava insistentemente mentre mi visitava', '2021-04-28 06:26:52', '2021-04-28 06:26:52'),
(78, 29, 'Martino', 'Manco', 5, 'Eccellente', 'Il dottore è stato competente e ha risolto il mio problema', '2021-04-28 06:31:52', '2021-04-28 06:31:52'),
(79, 29, 'Asdrubale', 'Conoci', 5, 'Ottimo lavoro', 'Il dottor Derek è stato fin da subito professionale', '2021-04-28 06:32:34', '2021-04-28 06:32:34'),
(80, 29, 'Federica', 'Astolfi', 5, 'Numero 1', 'Nel suo campo non ha rivali', '2021-04-28 06:33:09', '2021-04-28 06:33:09'),
(81, 29, 'Matteo', 'Morandi', 5, 'Professionale', 'Professionalità e simpatia lo contraddistinguono', '2021-04-28 06:33:53', '2021-04-28 06:33:53'),
(82, 29, 'Davide', 'De Mario', 5, 'Ottimo', 'Ottimo lavoro svolto dal Dottore e dai suoi assistenti', '2021-04-28 06:34:31', '2021-04-28 06:34:31'),
(83, 29, 'Gabriele', 'Marazia', 5, 'Grande', 'Grande Dottor Derek, mi segue da tanti anni e mi sono sempre trovato benissimo! Consiglio', '2021-04-28 06:35:13', '2021-04-28 06:35:13'),
(84, 29, 'Piergiorgio', 'Odifreddi', 5, 'Professionale', 'Essendo un matematico so benissimo distinguere un professionista, lui lo è e mi son trovato da dio!', '2021-04-28 06:36:20', '2021-04-28 06:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_price` double(6,2) UNSIGNED NOT NULL,
  `service_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `service_type`, `service_price`, `service_address`, `created_at`, `updated_at`) VALUES
(1, 1, 'Visita di controllo', 20.00, 'Via D\'Allara 32, Verona (VR) 31700', '2021-04-27 08:13:17', '2021-04-27 08:13:17'),
(2, 1, 'Visita specialistica', 25.00, 'Via D\'Allara 32, Verona (VR) 31700', '2021-04-27 08:14:36', '2021-04-27 08:14:36'),
(3, 1, 'Analisi allergeni', 18.00, 'Largo Amendola 2, Verona (VR) 31700', '2021-04-27 08:15:07', '2021-04-27 08:15:07'),
(8, 2, 'Terapia del dolore', 99.99, 'Via Peccato 7, Verona (VR) 31700', '2021-04-27 08:29:54', '2021-04-27 08:29:54'),
(9, 2, 'Visita di controllo', 20.00, 'Via D\'Allara 32, Verona (VR) 31700', '2021-04-27 08:30:21', '2021-04-27 08:30:21'),
(10, 3, 'T.A.C Total Body', 80.00, 'Via Matteoti 52, Verona (VR) 31700', '2021-04-27 08:31:52', '2021-04-27 08:31:52'),
(12, 3, 'E.C.G.', 50.00, 'Largo Amendola 2, Verona (VR) 31700', '2021-04-27 08:34:34', '2021-04-27 08:34:34'),
(13, 13, 'Rinosettoplastica', 5000.00, 'Via Michelangelo 1, Verona (VR) 31700', '2021-04-27 08:41:23', '2021-04-27 08:41:23'),
(14, 13, 'Lifting delle braccia', 3500.00, 'Via Michelangelo 1, Verona (VR) 31700', '2021-04-27 08:42:31', '2021-04-27 08:42:31'),
(16, 23, 'Visita senologica', 399.00, 'Via Anatomia 39, Verona (VR) 31700', '2021-04-27 08:45:50', '2021-04-27 08:45:50'),
(17, 23, 'Visita generale', 80.00, 'Via Anatomia 39, Verona (VR) 31700', '2021-04-27 08:48:20', '2021-04-27 08:48:20'),
(18, 23, 'Analisi del sangue', 50.00, 'Via Anatomia 39, Verona (VR) 31700', '2021-04-27 08:49:08', '2021-04-27 08:49:08'),
(19, 39, 'Consulenza online', 60.00, 'Via Arcore 23, Verona (VR) 31700', '2021-04-27 08:53:18', '2021-04-27 08:53:18'),
(20, 39, 'Visita geriatrica', 100.00, 'Via Arcore 23, Verona (VR) 31700', '2021-04-27 08:53:43', '2021-04-27 08:53:43'),
(21, 39, 'Prima Visita', 40.00, 'Via Arcore 23, Verona (VR) 31700', '2021-04-27 08:54:51', '2021-04-27 08:54:51'),
(23, 41, 'Crioterapia\r\n\r\n', 120.00, 'Via Bari 23, Verona (VR) 31700', '2021-04-27 08:57:17', '2021-04-27 08:57:17'),
(24, 41, 'Epiluminescenza', 150.00, 'Via Bari 23, Verona (VR) 31700', '2021-04-27 08:58:59', '2021-04-27 08:58:59'),
(25, 41, 'Laserterapia', 200.00, 'Via Bari 23, Verona (VR) 31700', '2021-04-27 08:59:18', '2021-04-27 08:59:18'),
(26, 56, 'Prima visita', 50.00, 'Largo Maggiore 24, Verona (VR) 31700', '2021-04-28 07:54:33', '2021-04-28 07:54:33'),
(27, 56, 'Visita pneumologica', 150.00, 'Largo Maggiore 24, Verona (VR) 31700', '2021-04-28 07:55:30', '2021-04-28 07:55:30'),
(28, 56, 'Visita specialistica', 180.00, 'Largo Maggiore 24, Verona (VR) 31700', '2021-04-28 07:56:05', '2021-04-28 07:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `spec_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`id`, `spec_name`, `created_at`, `updated_at`) VALUES
(1, 'Agopuntore', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(2, 'Allergologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(3, 'Anatomopatologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(4, 'Andrologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(5, 'Anestesista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(6, 'Angiologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(7, 'Audioprotesista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(8, 'Cardiochirurgo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(9, 'Cardiologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(10, 'Chiropratico', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(11, 'Chirurgo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(12, 'Chirurgo Estetico', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(13, 'Chirurgo Generale', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(14, 'Chirurgo Maxillo Facciale', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(15, 'Chirurgo Pediatrico', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(16, 'Chirurgo Plastico', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(17, 'Chirurgo Toracico', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(18, 'Chirurgo Vascolare', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(19, 'Chirurgo Vertebrale', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(20, 'Covidtest', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(21, 'Dentista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(22, 'Dermatologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(23, 'Diabetologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(24, 'Dietista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(25, 'Dietologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(26, 'Ematologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(27, 'Endocrinologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(28, 'Epatologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(29, 'Epidemiologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(30, 'Fisiatra', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(31, 'Fisioterapista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(32, 'Gastroenterologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(33, 'Geriatra', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(34, 'Ginecologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(35, 'Immunologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(36, 'Infettivologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(37, 'Internista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(38, 'Logopedista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(39, 'Massofisioterapista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(40, 'Medico Certificatore', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(41, 'Medico Competente', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(42, 'Medico Dello Sport', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(43, 'Medico Di Base', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(44, 'Medico Estetico', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(45, 'Medico Genetista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(46, 'Medico Legale', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(47, 'Medico Nucleare', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(48, 'Nefrologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(49, 'Neurochirurgo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(50, 'Neurologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(51, 'Neuropsichiatra Infantile', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(52, 'Nutrizionista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(53, 'Oculista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(54, 'Omeopata', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(55, 'Oncologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(56, 'Ortodontista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(57, 'Ortopedico', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(58, 'Osteopata', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(59, 'Ostetrica', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(60, 'Otorino', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(61, 'Pediatra', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(62, 'Pneumologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(63, 'Podologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(64, 'Posturologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(65, 'Proctologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(66, 'Professional Counselor', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(67, 'Psichiatra', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(68, 'Psicologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(69, 'Psicologo Clinico', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(70, 'Psicoterapeuta', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(71, 'Radiologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(72, 'Radiologo Diagnostico', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(73, 'Radioterapista', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(74, 'Reumatologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(75, 'Senologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(76, 'Sessuologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(77, 'Stomatologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(78, 'Tecnico Sanitario', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(79, 'Terapeuta', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(80, 'Terapista Del Dolore', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(81, 'Urologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(82, 'Venereologo', '2021-04-26 12:14:14', '2021-04-26 12:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `specialization_user`
--

CREATE TABLE `specialization_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `specialization_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specialization_user`
--

INSERT INTO `specialization_user` (`id`, `user_id`, `specialization_id`, `created_at`, `updated_at`) VALUES
(1, 1, 36, '2021-04-26 12:15:29', '2021-04-26 12:15:29'),
(2, 1, 48, '2021-04-26 12:15:29', '2021-04-26 12:15:29'),
(3, 2, 49, '2021-04-26 12:19:15', '2021-04-26 12:19:15'),
(4, 2, 50, '2021-04-26 12:19:15', '2021-04-26 12:19:15'),
(5, 3, 8, '2021-04-26 12:20:31', '2021-04-26 12:20:31'),
(6, 3, 11, '2021-04-26 12:20:31', '2021-04-26 12:20:31'),
(7, 4, 20, '2021-04-26 12:21:58', '2021-04-26 12:21:58'),
(8, 4, 35, '2021-04-26 12:21:58', '2021-04-26 12:21:58'),
(9, 5, 13, '2021-04-26 12:23:05', '2021-04-26 12:23:05'),
(10, 5, 16, '2021-04-26 12:23:05', '2021-04-26 12:23:05'),
(11, 6, 9, '2021-04-26 12:24:08', '2021-04-26 12:24:08'),
(12, 6, 42, '2021-04-26 12:24:08', '2021-04-26 12:24:08'),
(13, 7, 65, '2021-04-26 12:25:35', '2021-04-26 12:25:35'),
(14, 7, 66, '2021-04-26 12:25:35', '2021-04-26 12:25:35'),
(15, 8, 6, '2021-04-26 12:26:38', '2021-04-26 12:26:38'),
(16, 8, 8, '2021-04-26 12:26:38', '2021-04-26 12:26:38'),
(17, 9, 22, '2021-04-26 12:27:40', '2021-04-26 12:27:40'),
(18, 9, 25, '2021-04-26 12:27:40', '2021-04-26 12:27:40'),
(19, 10, 2, '2021-04-26 12:28:38', '2021-04-26 12:28:38'),
(20, 10, 23, '2021-04-26 12:28:38', '2021-04-26 12:28:38'),
(21, 11, 16, '2021-04-26 12:29:27', '2021-04-26 12:29:27'),
(22, 11, 17, '2021-04-26 12:29:27', '2021-04-26 12:29:27'),
(23, 12, 67, '2021-04-26 12:31:48', '2021-04-26 12:31:48'),
(24, 12, 68, '2021-04-26 12:31:48', '2021-04-26 12:31:48'),
(25, 13, 27, '2021-04-26 12:33:35', '2021-04-26 12:33:35'),
(26, 13, 37, '2021-04-26 12:33:35', '2021-04-26 12:33:35'),
(27, 14, 17, '2021-04-26 12:34:17', '2021-04-26 12:34:17'),
(28, 14, 27, '2021-04-26 12:34:17', '2021-04-26 12:34:17'),
(29, 15, 28, '2021-04-26 12:35:06', '2021-04-26 12:35:06'),
(30, 15, 30, '2021-04-26 12:35:06', '2021-04-26 12:35:06'),
(31, 16, 38, '2021-04-26 12:35:53', '2021-04-26 12:35:53'),
(32, 16, 39, '2021-04-26 12:35:53', '2021-04-26 12:35:53'),
(33, 17, 67, '2021-04-26 12:36:39', '2021-04-26 12:36:39'),
(34, 17, 72, '2021-04-26 12:36:39', '2021-04-26 12:36:39'),
(35, 18, 2, '2021-04-26 12:37:37', '2021-04-26 12:37:37'),
(36, 18, 3, '2021-04-26 12:37:37', '2021-04-26 12:37:37'),
(37, 19, 40, '2021-04-26 12:38:21', '2021-04-26 12:38:21'),
(38, 19, 41, '2021-04-26 12:38:21', '2021-04-26 12:38:21'),
(39, 20, 81, '2021-04-26 12:39:42', '2021-04-26 12:39:42'),
(40, 20, 82, '2021-04-26 12:39:42', '2021-04-26 12:39:42'),
(41, 21, 79, '2021-04-26 12:41:01', '2021-04-26 12:41:01'),
(42, 21, 80, '2021-04-26 12:41:01', '2021-04-26 12:41:01'),
(43, 22, 61, '2021-04-26 12:42:32', '2021-04-26 12:42:32'),
(44, 22, 62, '2021-04-26 12:42:32', '2021-04-26 12:42:32'),
(45, 23, 75, '2021-04-26 12:44:40', '2021-04-26 12:44:40'),
(46, 23, 76, '2021-04-26 12:44:40', '2021-04-26 12:44:40'),
(47, 24, 77, '2021-04-26 12:45:49', '2021-04-26 12:45:49'),
(48, 24, 82, '2021-04-26 12:45:49', '2021-04-26 12:45:49'),
(49, 25, 36, '2021-04-26 12:46:55', '2021-04-26 12:46:55'),
(50, 25, 38, '2021-04-26 12:46:55', '2021-04-26 12:46:55'),
(51, 26, 31, '2021-04-26 12:47:53', '2021-04-26 12:47:53'),
(52, 26, 32, '2021-04-26 12:47:53', '2021-04-26 12:47:53'),
(53, 27, 1, '2021-04-26 12:48:54', '2021-04-26 12:48:54'),
(54, 27, 2, '2021-04-26 12:48:54', '2021-04-26 12:48:54'),
(55, 28, 25, '2021-04-26 12:49:53', '2021-04-26 12:49:53'),
(56, 28, 47, '2021-04-26 12:49:53', '2021-04-26 12:49:53'),
(57, 29, 51, '2021-04-26 12:52:00', '2021-04-26 12:52:00'),
(58, 29, 52, '2021-04-26 12:52:00', '2021-04-26 12:52:00'),
(59, 30, 60, '2021-04-26 12:52:47', '2021-04-26 12:52:47'),
(60, 30, 61, '2021-04-26 12:52:47', '2021-04-26 12:52:47'),
(61, 31, 37, '2021-04-26 12:53:46', '2021-04-26 12:53:46'),
(62, 31, 62, '2021-04-26 12:53:46', '2021-04-26 12:53:46'),
(63, 32, 15, '2021-04-26 12:55:21', '2021-04-26 12:55:21'),
(64, 32, 17, '2021-04-26 12:55:21', '2021-04-26 12:55:21'),
(65, 33, 31, '2021-04-26 12:56:00', '2021-04-26 12:56:00'),
(66, 33, 33, '2021-04-26 12:56:00', '2021-04-26 12:56:00'),
(67, 34, 32, '2021-04-26 13:04:11', '2021-04-26 13:04:11'),
(68, 34, 47, '2021-04-26 13:04:11', '2021-04-26 13:04:11'),
(69, 35, 48, '2021-04-26 13:04:57', '2021-04-26 13:04:57'),
(70, 35, 57, '2021-04-26 13:04:57', '2021-04-26 13:04:57'),
(71, 36, 41, '2021-04-26 13:06:43', '2021-04-26 13:06:43'),
(72, 36, 60, '2021-04-26 13:06:43', '2021-04-26 13:06:43'),
(73, 37, 22, '2021-04-26 13:07:43', '2021-04-26 13:07:43'),
(74, 37, 38, '2021-04-26 13:07:43', '2021-04-26 13:07:43'),
(75, 38, 32, '2021-04-26 13:08:48', '2021-04-26 13:08:48'),
(76, 38, 57, '2021-04-26 13:08:48', '2021-04-26 13:08:48'),
(77, 39, 33, '2021-04-26 13:09:35', '2021-04-26 13:09:35'),
(78, 39, 63, '2021-04-26 13:09:35', '2021-04-26 13:09:35'),
(79, 40, 38, '2021-04-26 13:10:22', '2021-04-26 13:10:22'),
(80, 40, 68, '2021-04-26 13:10:22', '2021-04-26 13:10:22'),
(81, 41, 63, '2021-04-26 13:11:18', '2021-04-26 13:11:18'),
(82, 41, 82, '2021-04-26 13:11:18', '2021-04-26 13:11:18'),
(83, 42, 32, '2021-04-26 13:12:37', '2021-04-26 13:12:37'),
(84, 42, 62, '2021-04-26 13:12:37', '2021-04-26 13:12:37'),
(85, 43, 52, '2021-04-26 13:13:31', '2021-04-26 13:13:31'),
(86, 43, 71, '2021-04-26 13:13:31', '2021-04-26 13:13:31'),
(87, 44, 61, '2021-04-26 13:14:43', '2021-04-26 13:14:43'),
(88, 44, 63, '2021-04-26 13:14:43', '2021-04-26 13:14:43'),
(89, 45, 66, '2021-04-26 13:15:47', '2021-04-26 13:15:47'),
(90, 45, 80, '2021-04-26 13:15:47', '2021-04-26 13:15:47'),
(91, 46, 47, '2021-04-26 13:17:15', '2021-04-26 13:17:15'),
(92, 46, 62, '2021-04-26 13:17:15', '2021-04-26 13:17:15'),
(93, 47, 2, '2021-04-26 13:20:00', '2021-04-26 13:20:00'),
(94, 47, 28, '2021-04-26 13:20:00', '2021-04-26 13:20:00'),
(95, 48, 1, '2021-04-26 13:20:59', '2021-04-26 13:20:59'),
(96, 48, 38, '2021-04-26 13:20:59', '2021-04-26 13:20:59'),
(97, 49, 3, '2021-04-26 13:21:51', '2021-04-26 13:21:51'),
(98, 49, 32, '2021-04-26 13:21:51', '2021-04-26 13:21:51'),
(99, 50, 51, '2021-04-26 13:22:53', '2021-04-26 13:22:53'),
(100, 50, 57, '2021-04-26 13:22:53', '2021-04-26 13:22:53'),
(101, 51, 57, '2021-04-26 13:23:33', '2021-04-26 13:23:33'),
(102, 51, 81, '2021-04-26 13:23:33', '2021-04-26 13:23:33'),
(103, 52, 62, '2021-04-26 13:24:08', '2021-04-26 13:24:08'),
(104, 52, 79, '2021-04-26 13:24:08', '2021-04-26 13:24:08'),
(105, 53, 27, '2021-04-26 13:24:52', '2021-04-26 13:24:52'),
(106, 54, 52, '2021-04-26 13:25:32', '2021-04-26 13:25:32'),
(107, 55, 28, '2021-04-26 13:26:17', '2021-04-26 13:26:17'),
(108, 55, 76, '2021-04-26 13:26:17', '2021-04-26 13:26:17'),
(111, 57, 12, '2021-04-26 13:28:20', '2021-04-26 13:28:20'),
(112, 57, 21, '2021-04-26 13:28:20', '2021-04-26 13:28:20'),
(113, 58, 31, '2021-04-26 13:28:56', '2021-04-26 13:28:56'),
(114, 58, 40, '2021-04-26 13:28:56', '2021-04-26 13:28:56'),
(115, 59, 62, '2021-04-26 13:29:40', '2021-04-26 13:29:40'),
(116, 59, 77, '2021-04-26 13:29:40', '2021-04-26 13:29:40'),
(117, 60, 10, '2021-04-26 13:30:53', '2021-04-26 13:30:53'),
(118, 56, 36, '2021-04-28 07:57:41', '2021-04-28 07:57:41'),
(119, 56, 62, '2021-04-28 07:57:41', '2021-04-28 07:57:41');

-- --------------------------------------------------------

--
-- Table structure for table `sponsorships`
--

CREATE TABLE `sponsorships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sponsor_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sponsor_duration` tinyint(3) UNSIGNED NOT NULL,
  `sponsor_price` double(4,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sponsorships`
--

INSERT INTO `sponsorships` (`id`, `sponsor_name`, `sponsor_duration`, `sponsor_price`, `created_at`, `updated_at`) VALUES
(1, 'Base', 24, 2.99, '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(2, 'Intermedio', 72, 5.99, '2021-04-26 12:14:14', '2021-04-26 12:14:14'),
(3, 'Premium', 144, 9.99, '2021-04-26 12:14:14', '2021-04-26 12:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `sponsorship_user`
--

CREATE TABLE `sponsorship_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sponsorship_id` bigint(20) UNSIGNED NOT NULL,
  `expiration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sponsorship_user`
--

INSERT INTO `sponsorship_user` (`id`, `user_id`, `sponsorship_id`, `expiration_time`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-04-29 14:17:57', '2021-04-26 14:17:57', '2021-04-26 14:17:57'),
(2, 60, 1, '2021-04-27 15:59:36', '2021-04-26 15:59:36', '2021-04-26 15:59:36'),
(3, 60, 3, '2021-05-02 16:01:49', '2021-04-26 16:01:49', '2021-04-26 16:01:49'),
(4, 13, 3, '2021-05-03 10:43:06', '2021-04-27 10:43:06', '2021-04-27 10:43:06'),
(5, 23, 3, '2021-05-03 10:49:27', '2021-04-27 10:49:27', '2021-04-27 10:49:27'),
(6, 39, 3, '2021-05-03 10:55:06', '2021-04-27 10:55:06', '2021-04-27 10:55:06'),
(7, 41, 3, '2021-05-03 10:59:30', '2021-04-27 10:59:30', '2021-04-27 10:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `curriculum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public/813844_people_512x512.png',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `address`, `phone_number`, `curriculum`, `profile_image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Gregory', 'House', 'Via del Carrista 22, Verona (VR) 37100', NULL, NULL, 'public/house.jpg', 'gregory.house@gmail.com', NULL, '$2y$10$rsBJTeD0Zxum53eFC9iFfO/o9YUdwkKZxCRlu8hYhqfL8hx5F.1rG', NULL, '2021-04-26 12:15:29', '2021-04-26 12:15:29'),
(2, 'Eric', 'Foreman', 'Via del Lanciere 23, Verona (VR) 31700', NULL, NULL, 'public/ericforeman.jpg', 'eric.foreman@gmail.com', NULL, '$2y$10$kJuy9GL770YGmsdlJLICCulerDM.PSNEveKB1XYkVmZi14Rqeu81G', NULL, '2021-04-26 12:19:15', '2021-04-26 12:19:15'),
(3, 'Robert', 'Chase', 'Via del Fante 11, Verona (VR) 31700', NULL, NULL, 'public/Robertchase.png', 'roby.chase@gmail.com', NULL, '$2y$10$JbwaPsZTbZv1GYWVGH5PJuiRpxOzbZWF6Er3j68qX3qaH64TjNGIy', NULL, '2021-04-26 12:20:31', '2021-04-26 12:20:31'),
(4, 'Allison', 'Cameron', 'Via Carlo Poma 33, Verona (VR) 31700', NULL, NULL, 'public/Allisoncameron.jpg', 'ally.cameron@gmail.com', NULL, '$2y$10$bERc2bUZ61oMuUMJpnzYHOtw2231l3d7AnXF0OdrBbik5NsaDanTa', NULL, '2021-04-26 12:21:58', '2021-04-26 12:21:58'),
(5, 'Chris', 'Taub', 'Via Basso Acquar 2, Verona (VR) 31700', NULL, NULL, 'public/Christaub.jpg', 'chris.taub@gmail.com', NULL, '$2y$10$IxAy7pEa0Kn1FX5gBfLD4OvnXc0BLyGpxaqHJAFNfxWozXhg/3XuC', NULL, '2021-04-26 12:23:05', '2021-04-26 12:23:05'),
(6, 'Lawrence', 'Kurtner', 'Via Alberto Dominutti 99, Verona (VR) 31700', NULL, NULL, 'public/Lawrencekutner.jpg', 'law.kurt@gmail.com', NULL, '$2y$10$5NFpMDaveRrLgtd2jmk/0e5nhSqsrQjwvgqBBJPL6i9b84nMwlW0C', NULL, '2021-04-26 12:24:08', '2021-04-26 12:24:08'),
(7, 'Remy', 'Hadley', 'Via del Piave 99, Verona (VR) 31700', NULL, NULL, 'public/Remyhadley.jpg', 'remy.hadley@gmail.com', NULL, '$2y$10$aYMrC0t1CqYeVd/01lMZLen78Jd48qY4CGYaEAWETQ4HDBbPWSpom', NULL, '2021-04-26 12:25:35', '2021-04-26 12:25:35'),
(8, 'James', 'Wilson', 'Via Pietro Cossali 1, Verona (VR) 31700', NULL, NULL, 'public/Jameswilson.jpg', 'james.wils@gmail.com', NULL, '$2y$10$GeBjioJAaW9Jjp78Xsw9XeNcAeTehrY3Eu5yLh1dg/vI06ZHTcG7a', NULL, '2021-04-26 12:26:38', '2021-04-26 12:26:38'),
(9, 'Lisa', 'Cuddy', 'Via Golosine 55, Verona (VR) 31700', NULL, NULL, 'public/Lisacuddy.jpg', 'lisa.cuddy@gmail.com', NULL, '$2y$10$b3AZAt6/whOeSpjycoC2LOkK6cWY5L4NixM9Vd9bnmM7OnXcFQAWi', NULL, '2021-04-26 12:27:40', '2021-04-26 12:27:40'),
(10, 'Jessica', 'Adams', 'Via Elena da Persico 23, Verona (VR) 31700', NULL, NULL, 'public/Jessicaadams.jpg', 'jessica.adams@gmail.com', NULL, '$2y$10$mr3pk3kvp3Y0bxcxvCcoVegUbZqtubCVMUIjNJIReMwbUYRb132vu', NULL, '2021-04-26 12:28:38', '2021-04-26 12:28:38'),
(11, 'Chi', 'Park', 'Via Giuseppe Ruffoni, Verona (VR) 31700', NULL, NULL, 'public/chipark.jpg', 'chi.park@gmail.com', NULL, '$2y$10$vkeqfR14MW4XmSQ5/ELQMeas0gp2ph4DAiLdiJh9VqIO8xn1eFiRu', NULL, '2021-04-26 12:29:27', '2021-04-26 12:29:27'),
(12, 'Hannibal', 'Lecter', 'Via Giuseppe Ruffoni, Verona (VR) 31700', NULL, NULL, 'public/hannibal.jpg', 'hannibal.lecter@gmail.com', NULL, '$2y$10$cqYNV0w9IkaU49cF8uSriOQ8uP9/CJTCrGotF3c9eCXFZCzrVZDvu', NULL, '2021-04-26 12:31:48', '2021-04-26 12:31:48'),
(13, 'John', 'Dorian', 'Via Michelangelo 1, Verona (VR) 31700', NULL, NULL, 'public/johndorian.jpeg', 'john.dorian@gmail.com', NULL, '$2y$10$0i5dTdHu7OJi51phyEn29OrYUXGQ6yr6S5FUpBLhJPHItsHNnLQWO', NULL, '2021-04-26 12:33:35', '2021-04-26 12:33:35'),
(14, 'Elliot', 'Reid', 'Via Raffaello 2, Verona (VR) 31700', NULL, NULL, 'public/elliotreid.jpg', 'elliot.reid@gmail.com', NULL, '$2y$10$O5YJPwJLuUdlGzQuHanK6ubOBggGlfA8TxH5xIJrJ1JYPC2cPg8hO', NULL, '2021-04-26 12:34:17', '2021-04-26 12:34:17'),
(15, 'Christopher', 'Turk', 'Via Albere 4, Verona (VR) 31700', NULL, NULL, 'public/christopherturk.jpg', 'chris.turk@gmail.com', NULL, '$2y$10$V7fWSqDPCVLHmn711xWHz.wanX8bbVr1lZHLFDjginA.Kbmz1YHay', NULL, '2021-04-26 12:35:06', '2021-04-26 12:35:06'),
(16, 'Perry', 'Cox', 'Via Donatello 6, Verona (VR) 31700', NULL, NULL, 'public/perrycox.jpeg', 'perry.cox@gmail.com', NULL, '$2y$10$X1xpeMlyP33ROwuK9gSnoekoYzja4DZDRWD1fCmnZGcUfqKfSUc4.', NULL, '2021-04-26 12:35:53', '2021-04-26 12:35:53'),
(17, 'Bob', 'Kelso', 'Via Richards 8, Verona (VR) 31700', NULL, NULL, 'public/bobkelso.jpg', 'bob.kelso@gmail.com', NULL, '$2y$10$N8fhmKC2XxgPFVZVAwbAJOeHBAGQBwEXUqgzoqrkbjegcsxfOUPjO', NULL, '2021-04-26 12:36:39', '2021-04-26 12:36:39'),
(18, 'Neil', 'Flynn', 'Via Gionata Rinaldi 10, Verona (VR) 31700', NULL, NULL, 'public/neil flynn.jpg', 'neil.flynn@gmail.com', NULL, '$2y$10$0ygqb/q8SFqYITyVBMNxI.Mssr.Kon8aim/.IG4Jer8hdVwD/tJya', NULL, '2021-04-26 12:37:37', '2021-04-26 12:37:37'),
(19, 'Carla', 'Espinosa', 'Via del Lanciere 23, Verona (VR) 31700', NULL, NULL, 'public/carlaespinosa.jpg', 'carla.espi@gmail.com', NULL, '$2y$10$k1gfEr.RH1Rh42bDSemMm.7I/f708UV4cQuZWczd.sv1PZPSXqQwe', NULL, '2021-04-26 12:38:21', '2021-04-26 12:38:21'),
(20, 'Lucy', 'Bennet', 'Via Rubert Pattinson 80, Verona (VR) 31700', NULL, NULL, 'public/lucybennett.jpg', 'lucy.bennet@gmail.com', NULL, '$2y$10$vUxCuSFCq7pTIykbs5oE0uDAdZap7x6nP6KCocJO/FrmWVQK/uG0q', NULL, '2021-04-26 12:39:42', '2021-04-26 12:39:42'),
(21, 'Denise', 'Mahoney', 'Via degli Olmi 33, Verona (VR) 31700', NULL, NULL, 'public/denisemahoney.png', 'deni.mahoney@gmail.com', NULL, '$2y$10$xWYP.lYAIfRFX0wE/V9GMOQ8vXRVX5G64Ppt6UncJs2O1SaXEWSfC', NULL, '2021-04-26 12:41:01', '2021-04-26 12:41:01'),
(22, 'Cole', 'Aaronson', 'Via Ugo Baldi, Verona (VR) 31700', NULL, NULL, 'public/coleaaronson.jpeg', 'cole.arons@gmail.com', NULL, '$2y$10$syp38AdOrcytn0rZ5Pvup.pdke0XHdzJ1jTBuW2B1Uaz1QuznF87.', NULL, '2021-04-26 12:42:32', '2021-04-26 12:42:32'),
(23, 'Meredith', 'Grey', 'Via Anatomia 39, Verona (VR) 31700', NULL, NULL, 'public/meredithgrey.jpg', 'mere.grey@gmail.com', NULL, '$2y$10$xlT1UsqjEU9V.OVKr9pT5OZP2hh68/mF9tk5ekth44hZ/h0o6fmsu', NULL, '2021-04-26 12:44:40', '2021-04-26 12:44:40'),
(24, 'Christina', 'Yang', 'Via Via Giovanni Stolti 22, Verona (VR) 31700', NULL, NULL, 'public/christinayang.jpg', 'chris.yang@gmail.com', NULL, '$2y$10$Iki.wQX5uxAVVK9liM7f3.d4Fr7U2MlJL1OavEPtjHMgaLSHCEAhi', NULL, '2021-04-26 12:45:49', '2021-04-26 12:45:49'),
(25, 'Izzie', 'Stevens', 'Via Domenico Modugno 109, Verona (VR) 31700', NULL, NULL, 'public/izziestevens.png', 'izzie.steve@gmail.com', NULL, '$2y$10$7DJUsR2nyEDThAo/FmDuXuQSmupgHW1YWm7Ek.gptCVjJzOrWq20W', NULL, '2021-04-26 12:46:55', '2021-04-26 12:46:55'),
(26, 'Alex', 'Karev', 'Via Adolfo Gervasoni 222, Verona (VR) 31700', NULL, NULL, 'public/alexkarev.jpg', 'alex.karev@gmail.com', NULL, '$2y$10$2aHu0T0ASyz5dhX8c2CBH.4PIbMXqhHs8EFe11SSkND16iA3ZGpqy', NULL, '2021-04-26 12:47:53', '2021-04-26 12:47:53'),
(27, 'Miranda', 'Balley', 'Via della Spina 395, Verona (VR) 31700', NULL, NULL, 'public/mirandabailey.jpg', 'miranda.balley@gmail.com', NULL, '$2y$10$R3OvcFp09r3GQejWpGmRvOcYWKAKS2lBFOSGeVbz5mDgh5xPFuxky', NULL, '2021-04-26 12:48:54', '2021-04-26 12:48:54'),
(28, 'Richard', 'Webber', 'Via Basoni 345, Verona (VR) 31700', NULL, NULL, 'public/richardwebber.jpg', 'richard.webber@gmail.com', NULL, '$2y$10$TZVEB6Cqk1DTGyi9MFSGpeqQDd46RiZLiuwoIISDibT8DxI1CpPxO', NULL, '2021-04-26 12:49:53', '2021-04-26 12:49:53'),
(29, 'Dereck', 'Shepherd', 'Via Bretella 256, Verona (VR) 31700', NULL, NULL, 'public/derekshepherd.jpg', 'dereck.shep@gmail.com', NULL, '$2y$10$/W7NWeXNLokR.bK6T3o95e5D6JIXoxrJOLPZv4rnLL7z9eUT73VxW', NULL, '2021-04-26 12:52:00', '2021-04-26 12:52:00'),
(30, 'Preston', 'Burke', 'Via Albania 55, Verona (VR) 31700', NULL, NULL, 'public/prestonburke.jpg', 'preston.burke@gmail.com', NULL, '$2y$10$rWKAuKvbHCcDU3fn2r9DgeRsLDcgxrsOtn39zf.Q3qR15PUD8o/DG', NULL, '2021-04-26 12:52:47', '2021-04-26 12:52:47'),
(31, 'Owen', 'Hunt', 'Via del Cacciatore 234, Verona (VR) 31700', NULL, NULL, 'public/Owen_Hunt.jpg', 'owen.hunt@gmail.com', NULL, '$2y$10$z8KHiidotYSwEsM19tVzcOIWI2Ea9RclA/RMRbOahlElnFQ5u11Du', NULL, '2021-04-26 12:53:46', '2021-04-26 12:53:46'),
(32, 'Joe', 'Wilson', 'Via Fazzoletto blu 39, Verona (VR) 31700', NULL, NULL, 'public/joewilson.jpg', 'jo.wilson@gmail.com', NULL, '$2y$10$d8ZuUPcJcI1YE4JXwWEMRe7dlu5ZPEUoGwmy8NLHD3PI6oCNB3El.', NULL, '2021-04-26 12:55:21', '2021-04-26 12:55:21'),
(33, 'Andrew', 'De Luca', 'Via Brunelleschi 45, Verona (VR) 31700', NULL, NULL, 'public/andrewdeluca.jpg', 'andre.delux@gmail.com', NULL, '$2y$10$PedwFMfd3CNIMSklPgH2jek7hm3H6aGv19DzxGLgK3hsUCRMYctHG', NULL, '2021-04-26 12:56:00', '2021-04-26 12:56:00'),
(34, 'Luca', 'Barossi', 'Via del Caucaso 98, Verona (VR) 31700', NULL, NULL, 'public/Lucabarossi.jpeg', 'luca.barossi@gmail.com', NULL, '$2y$10$05E8NyIbEOEFsbzNxqHvdO39uSIV3pVXhTqxaJtllVvXb4bVseOX2', NULL, '2021-04-26 13:04:11', '2021-04-26 13:04:11'),
(35, 'Michael', 'Corsi', 'Via Ventrella 87, Verona (VR) 31700', NULL, NULL, 'public/michaelcorsi.jpeg', 'michael.corsi@gmail.com', NULL, '$2y$10$d49tai7DVDTfOlkrGA24fe7ER78La6QYfucJKSh5jt.vg6Gou5LBW', NULL, '2021-04-26 13:04:57', '2021-04-26 13:04:57'),
(36, 'Giorgio', 'Vanni', 'Via Ottomani 400, Verona (VR) 31700', NULL, NULL, 'public/giorgiovanni.jpg', 'giorgio.vanni@gmail.com', NULL, '$2y$10$ft37zG9PlRuHyfh2I13DzuThovBz0nuegbnpWLwWF4hRbKZQ5uize', NULL, '2021-04-26 13:06:43', '2021-04-26 13:06:43'),
(37, 'Cristina', 'D\'avena', 'Via Lago di Garda 56, Verona (VR) 31700', NULL, NULL, 'public/cristinadavena.jpeg', 'cristina.davena@gmail.com', NULL, '$2y$10$h.e94ZyDMeeABGNyMsjQQ.Q7rW7nn/p.Q03e1uGYo8H7P.kQhzoJu', NULL, '2021-04-26 13:07:43', '2021-04-26 13:07:43'),
(38, 'Antonio', 'Gorgoni', 'Via Baronessa 399, Verona (VR) 31700', NULL, NULL, 'public/Antoniogiorgoni.jpeg', 'antonio.gorgo@gmail.com', NULL, '$2y$10$HNGyXXsLCBgyo0u9BljWSuz8CQIdlcy0a2EJRdkSRK6x4oU7tRwsa', NULL, '2021-04-26 13:08:48', '2021-04-26 13:08:48'),
(39, 'Francesca', 'Cipressi', 'Via Arcore 23, Verona (VR) 31700', NULL, NULL, 'public/Francescacipressi.jpeg', 'franci.cipre@gmail.com', NULL, '$2y$10$o7pmWn87t/Hky1fSYbdOteBzgmRFqEaAdT.Rhgy6yb/MRphYWsm.a', NULL, '2021-04-26 13:09:35', '2021-04-26 13:09:35'),
(40, 'Marco', 'De Rossi', 'Via Maremmano 47, Verona (VR) 31700', NULL, NULL, 'public/marcoderossi.jpg', 'marco.derossi@gmail.com', NULL, '$2y$10$/jMwRDhf.bmRtrYpShvaJ..64pOiOTVlk8U0zmUH0w9qQQbInDaym', NULL, '2021-04-26 13:10:22', '2021-04-26 13:10:22'),
(41, 'Laura', 'Fiondani', 'Via Bari 23, Verona (VR) 31700', NULL, NULL, 'public/laurafiondani.jpeg', 'laura.fiondani@gmail.com', NULL, '$2y$10$1ZR6PaYA8KJoBmmMzspee.4eB8ILSt7VsEyqXDeMQuiQ.Jyaba5O.', NULL, '2021-04-26 13:11:18', '2021-04-26 13:11:18'),
(42, 'Domenico', 'Garcia', 'Via Leopoldo Gennari 70, Verona (VR) 31700', NULL, NULL, 'public/Domenicogarcia.jpg', 'dome.garcia@gmail.com', NULL, '$2y$10$6h8OjLND4qE6nGFDOHm2sOTLxKLQSIgdRAJuI8Q.YxrysurBpix2m', NULL, '2021-04-26 13:12:37', '2021-04-26 13:12:37'),
(43, 'Angela', 'Darmian', 'Via degli Oratori 555, Verona (VR) 31700', NULL, NULL, 'public/Angeladarmian.jpeg', 'angela.darmian@gmail.com', NULL, '$2y$10$/p61mD1gnd9/yOjSFOCfzetBGa5tsFI.YS/cwhQEuuGsEfNJagPMK', NULL, '2021-04-26 13:13:31', '2021-04-26 13:13:31'),
(44, 'Alberto', 'Angela', 'Via dei Vincenti 99, Verona (VR) 31700', NULL, NULL, 'public/albertoangela.jpg', 'xxalby.angyxx@gmail.com', NULL, '$2y$10$E0BDB5T8p/8orWy28Tx0luB4w/TYGTPfp0QuJz4cdNgTDt0BJlMsu', NULL, '2021-04-26 13:14:43', '2021-04-26 13:14:43'),
(45, 'Marianna', 'Colapietro', 'Via Mannarini 89, Verona (VR) 31700', NULL, NULL, 'public/mariannacolapietro.jpeg', 'mari.cola@gmail.com', NULL, '$2y$10$4kYciCqXvCxdOd1.b.42huPVjOYghtFl405zRV/KMSMxbuRZuXBCi', NULL, '2021-04-26 13:15:47', '2021-04-26 13:15:47'),
(46, 'Vittorio', 'Gassman', 'Via Osteria Panetti 55, Verona (VR) 31700', NULL, NULL, 'public/Vittoriogassman.jpeg', 'vitto.gas@gmail.com', NULL, '$2y$10$f2fLyd1o2AVRwMGlB56/ce8eJ556HCsjvo3VForTFWhyRRQ9ojvN2', NULL, '2021-04-26 13:17:15', '2021-04-26 13:17:15'),
(47, 'Martina', 'Mannaia', 'Via del Barone Greco 450, Verona (VR) 31700', NULL, NULL, 'public/martinamannaia.jpeg', 'marti.manna@gmail.com', NULL, '$2y$10$RmkNdVqh7m11/qYFdr20JeprbspzKFkQEijIy9FAgCLMFIcVTtfJe', NULL, '2021-04-26 13:20:00', '2021-04-26 13:20:00'),
(48, 'Alfonso', 'Signori', 'Via Gastone 1, Verona (VR) 31700', NULL, NULL, 'public/alfonsosignorini.jpg', 'alfo.signori@gmail.com', NULL, '$2y$10$wgpISVPuS5OiosFBTA/iZObOBf3w9F8JCmdJaZXZsC3A5sc9NMMlq', NULL, '2021-04-26 13:20:59', '2021-04-26 13:20:59'),
(49, 'Giorgia', 'Gorelli', 'Via degli Elfi 88, Verona (VR) 31700', NULL, NULL, 'public/giorgiagorelli.jpg', 'gio.gore@gmail.com', NULL, '$2y$10$TC67R.nv5DQ2wcnmUL2ikuysl/tyqMsaeuM/P0UpW/sYnWRx0xbwu', NULL, '2021-04-26 13:21:51', '2021-04-26 13:21:51'),
(50, 'Edoardo', 'Pizzi', 'Via delle Manifatture 23, Verona (VR) 31700', NULL, NULL, 'public/Edoardopizzi.jpg', 'edo.piz@gmail.com', NULL, '$2y$10$hU56PUZjHcyVto1uvS2TB.MuxS5v64ABpYUH5rC6LpMP53ki4J74i', NULL, '2021-04-26 13:22:53', '2021-04-26 13:22:53'),
(51, 'Stefania', 'Salvini', 'Via parco dei Principi, Verona (VR) 31700', NULL, NULL, 'public/Stefaniasalvini.jpeg', 'stefi.salvini@gmail.com', NULL, '$2y$10$LXfxwBFfydBLG.z3OGcuDeGFYVSAXal/tvKqCzoxBelt9JPvVB6ke', NULL, '2021-04-26 13:23:33', '2021-04-26 13:23:33'),
(52, 'Marcello', 'Ascani', 'Via Silvester Stallone 11, Verona (VR) 31700', NULL, NULL, 'public/marcelloascani.jpg', 'marci.ascani@gmail.com', NULL, '$2y$10$K8bwg4VkRvJQ30Nx7BKL/eKXRTnZFECKpv5x0tU5qLJwKtav/drXG', NULL, '2021-04-26 13:24:08', '2021-04-26 13:24:08'),
(53, 'Elena', 'Inguscio', 'Corso Vittorio Emanuele 2, Verona (VR) 31700', NULL, NULL, 'public/elenainguscio.jpeg', 'elena.ingu@gmail.com', NULL, '$2y$10$ChdEWITS67In.wXC.uEafOcdmnSVSUQFq7D.FBE./ZSw6VXek3OY2', NULL, '2021-04-26 13:24:52', '2021-04-26 13:24:52'),
(54, 'Roberta', 'Alfieri', 'Via Norreni 6, Verona (VR) 31700', NULL, NULL, 'public/Robertaalfieri.jpeg', 'roby.alfieri@gmail.com', NULL, '$2y$10$63x4FweFslQNpNp7W9M6b.hK8j9neEnc98JVoBAyE46AGGNCCLmSu', NULL, '2021-04-26 13:25:32', '2021-04-26 13:25:32'),
(55, 'Dario', 'Foresi', 'Via dei Ragazzi 9, Verona (VR) 31700', NULL, NULL, 'public/Darioforesi.jpeg', 'dario.fo@gmail.com', NULL, '$2y$10$MW3FrCnbwh/4r5z/joPgmuyrgG24oL52CLvdyR3qgSrf1WUBHM7Wu', NULL, '2021-04-26 13:26:17', '2021-04-26 13:26:17'),
(56, 'Marta', 'Veronesi', 'Largo Maggiore 24, Verona (VR) 31700', '3456789012', NULL, 'public/Martaveronesi.jpeg', 'marta.vero@gmail.com', NULL, '$2y$10$R./NGjM8gvMggEz2KQUkNulVO3ZfcyIYWDUDq8axFKQLwNnMGHXuO', NULL, '2021-04-26 13:27:23', '2021-04-28 07:57:41'),
(57, 'Ottavio', 'Fogliata', 'Via del Sapere 1, Verona (VR) 31700', NULL, NULL, 'public/ottaviofogliata.jpg', 'ottavio.fogli@gmail.com', NULL, '$2y$10$4F5e0KoVb6/qPZXBMmXocewK3RlqXwGf7jji4qzeEv.bKNESq4fEO', NULL, '2021-04-26 13:28:20', '2021-04-26 13:28:20'),
(58, 'Sabrina', 'Marcuzzi', 'Via dei Parolieri 76, Verona (VR) 31700', NULL, NULL, 'public/Sabrinamarcuzzi.jpg', 'sabri.marcuzzi@gmail.com', NULL, '$2y$10$2zfnALIP4773xD7lBKTgUObqIbjQSQObiyrESL97P8hpNK2F4smtO', NULL, '2021-04-26 13:28:56', '2021-04-26 13:28:56'),
(59, 'Achille', 'Lauro', 'Via Dante 5, Verona (VR) 31700', NULL, NULL, 'public/achillelauro.jpeg', 'achille.lauro@gmail.com', NULL, '$2y$10$q6njXj1EcjAeJNC56egJNeS.6d90DYUHdPAmjZ2S3rX0y3bWTVEE.', NULL, '2021-04-26 13:29:40', '2021-04-26 13:29:40'),
(60, 'Cristina', 'Forte', 'Via Gioia del Cielo 22, Verona (VR) 31700', NULL, NULL, 'public/cristinaforte.jpeg', 'cri.forte@gmail.com', NULL, '$2y$10$hmXSoKtL87VnP2ZnlwDZNeTfmohpPRDbAPxtjRFul1wZaTQN5Tara', NULL, '2021-04-26 13:30:53', '2021-04-26 13:30:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_user_id_foreign` (`user_id`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialization_user`
--
ALTER TABLE `specialization_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialization_user_user_id_foreign` (`user_id`),
  ADD KEY `specialization_user_specialization_id_foreign` (`specialization_id`);

--
-- Indexes for table `sponsorships`
--
ALTER TABLE `sponsorships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsorship_user`
--
ALTER TABLE `sponsorship_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sponsorship_user_user_id_foreign` (`user_id`),
  ADD KEY `sponsorship_user_sponsorship_id_foreign` (`sponsorship_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `specialization_user`
--
ALTER TABLE `specialization_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `sponsorships`
--
ALTER TABLE `sponsorships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sponsorship_user`
--
ALTER TABLE `sponsorship_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `specialization_user`
--
ALTER TABLE `specialization_user`
  ADD CONSTRAINT `specialization_user_specialization_id_foreign` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`id`),
  ADD CONSTRAINT `specialization_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sponsorship_user`
--
ALTER TABLE `sponsorship_user`
  ADD CONSTRAINT `sponsorship_user_sponsorship_id_foreign` FOREIGN KEY (`sponsorship_id`) REFERENCES `sponsorships` (`id`),
  ADD CONSTRAINT `sponsorship_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
