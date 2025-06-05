-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2024 at 05:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `availability_status`
--

CREATE TABLE `availability_status` (
  `availability_status_id` int(11) UNSIGNED NOT NULL,
  `availability_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `availability_status`
--

INSERT INTO `availability_status` (`availability_status_id`, `availability_status`) VALUES
(1, 'Full availability'),
(2, 'Limited Availability'),
(3, 'Low Availability'),
(4, 'No Availability'),
(5, 'Presale');

-- --------------------------------------------------------

--
-- Table structure for table `billing_address`
--

CREATE TABLE `billing_address` (
  `billing_address_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `building_identifier` varchar(255) NOT NULL,
  `address_line_one` varchar(255) NOT NULL,
  `address_line_two` varchar(255) DEFAULT NULL,
  `city_town` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing_address`
--

INSERT INTO `billing_address` (`billing_address_id`, `first_name`, `last_name`, `building_identifier`, `address_line_one`, `address_line_two`, `city_town`, `postal_code`, `country_name`) VALUES
(1, 'Niamh', 'Kane', '', '59 Riverdale Gardens', NULL, 'Belfast', 'BT11 9DG', 'Northern Ireland'),
(2, 'Caoimhe ', 'Fraser', '', '7 Denewood Park', NULL, 'Belfast', 'BT11 9DP', 'Northern Ireland'),
(3, 'Janet', 'McKeown', '', '6 Chopin Street', NULL, 'Belfast', 'BT11 9CS', 'Northern Ireland'),
(4, 'David', 'Kane', 'Building 1', '16 St James Drive', 'Apt 4B', 'Lisburn', 'BT14 8GH', 'Ireland'),
(5, 'Julia', 'Smith', '', '9 Fountain Lane', NULL, 'Lisburn', 'BT16 4JP', 'Northern Ireland'),
(6, 'Izabela', 'Lysakowska', '', '288 Evergreen Crescent', NULL, 'Antrim', 'BT76 8DF', 'Ireland');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `card_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name_on_card` varchar(255) NOT NULL,
  `card_number` varchar(19) NOT NULL,
  `limited_card_number` varchar(255) NOT NULL,
  `expiry_month` tinyint(3) UNSIGNED NOT NULL,
  `expiry_year` year(2) NOT NULL,
  `billing_address_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`card_id`, `user_id`, `name_on_card`, `card_number`, `limited_card_number`, `expiry_month`, `expiry_year`, `billing_address_id`) VALUES
(1, 1, 'Niamh C Kane', 'r?;$??7?h???^6?}', '9123', 12, '27', 1),
(2, 2, 'C Fraser', '?}\"?Qυ?6?:??_??T?', '4321', 10, '26', 2),
(3, 3, 'J B McKeown', '5Po?S?_싒IƎ??????\n)?', '5437', 12, '28', 3),
(4, 4, 'David Kane', ')D?#\Z˗??M??`q???\"', '8765', 9, '25', 4),
(5, 5, 'Julia E Smith', '??_?:4!F7?B??j???', '2467', 3, '27', 5),
(6, 6, 'I Lysakowska', 'Թ>?D?????3Cs\n??]9L', '8675', 2, '26', 6);

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(10) UNSIGNED NOT NULL,
  `terms_and_conditions` tinyint(1) NOT NULL,
  `protect_purchase` tinyint(1) NOT NULL,
  `get_notifications` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`checkout_id`, `terms_and_conditions`, `protect_purchase`, `get_notifications`) VALUES
(1, 1, 1, 1),
(2, 1, 0, 0),
(3, 1, 0, 1),
(4, 1, 1, 1),
(5, 1, 1, 0),
(6, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(10) UNSIGNED NOT NULL,
  `region_id` int(10) UNSIGNED NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `region_id`, `city_name`) VALUES
(1, 1, 'Belfast'),
(2, 2, 'Derry'),
(3, 3, 'London'),
(4, 2, 'Dublin');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(10) UNSIGNED NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `country_code`, `currency_id`) VALUES
(1, 'United Kingdom', 'UK', 1),
(2, 'Ireland', 'IRL', 2);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(10) UNSIGNED NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_name` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `exchange_rate_gbp` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `currency_code`, `currency_name`, `currency_symbol`, `exchange_rate_gbp`) VALUES
(1, 'GBP', 'Pounds', '£', 1),
(2, 'EUR', 'Euro', '€', 1.15);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_costs`
--

CREATE TABLE `delivery_costs` (
  `delivery_costs_id` int(10) UNSIGNED NOT NULL,
  `delivery_costs_name` varchar(255) NOT NULL,
  `delivery_costs` decimal(10,0) NOT NULL,
  `e_ticket` tinyint(1) DEFAULT NULL,
  `shipping_address_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_costs`
--

INSERT INTO `delivery_costs` (`delivery_costs_id`, `delivery_costs_name`, `delivery_costs`, `e_ticket`, `shipping_address_id`) VALUES
(2, 'E-Ticket', 0, 0, 1),
(3, 'Speedy Delivery', 5, 1, 2),
(4, 'E-Ticket', 0, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(10) UNSIGNED NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `gallery` varchar(255) DEFAULT NULL,
  `event_description` varchar(5000) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_name`, `gallery`, `event_description`, `is_featured`) VALUES
(1, 'Belfast Giants', 'Image 1', 'The only professional ice hockey team on the island of Ireland, the Giants compete in the Elite Ice Hockey League. ', 1),
(2, 'Disney on Ice', 'Image 2', 'Grab your mouse ears and get ready as Disney On Ice presents Road Trip Adventures skates back into Belfast, whisking families away on an immersive getaway full of magical participatory moments. Featuring new and classic tales, get ready to enter the enchanting Disney Kingdomas this multi-generational experience skates into an arena near you, with world-class skating, high-flying acrobatics and up-close character interactions.', 1),
(3, 'Bill Ryder-Jones + Gruff Rhys', 'Image 3', 'Bill Ryder-Jones is a songwriter, producer and multi-instrumentalist from West Kirby on the Wirral. Bill first found success as a founding member of the band The Coral, achieving several UK number one albums, a mercury prize nomination and tours with Blur and Oasis. He left the band in 2008, signing to the great British independent label Domino Records, with whom he has released five LPs, from his first - a classical score to Italo Calvino’s ‘If on a Winter Night a Traveller’, to this year’s critically acclaimed album ‘Iechyd Da.', 0),
(4, 'Peter Pan', 'Image 4', 'The Gaiety Theatre will set sail on a spectacular journey to Neverland, announcing Peter Pan as the 2024 Gaiety Pantomime.\r\n\r\nThe Gaiety Panto, directed by Daryn Crosbie, brings to life and “Panto-ifies” this classic adventure about the free-spirited and mischievous young boy, who never grows up.\r\n\r\nJoin Peter and the Lost Boys as they swashbuckle their way through Neverland and strive to outwit the dastardly Captain Hook and his brutal band of pirates, with a sprinkling of fairy dust help from Tinkerbell of course.\r\n\r\nDon’t miss this truly magnificent panto adventure with breathtaking special effects, foot-stomping song and dance routines, dazzling costumes, and mesmerising magic…!\r\n\r\nSo, let your imagination take flight to the “Second star to the right and straight on till morning…!” as we bring you, Peter Pan, at the Gaiety Theatre.\r\n\r\nAnd don’t forget, this is no ordinary Panto… It’s the Gaiety Panto…!\r\n\r\nThe Gaiety Theatre has hosted the annual Christmas Panto each year since “Turko The Terrible” in 1873. Today, families come from far and wide to experience the Gaiety Christmas Panto and for many, it has become as much a family Christmas tradition as Santa himself.', 1),
(5, 'Mrs. Brown\'s Boys', 'Image 5', 'Mrs. Brown’s Boys success has been nothing short of incredible. Voted the No. 1 Sitcom of the 21st Century, awards include 5 BAFTAs, 4 National Television Awards, 3 TV Choice Awards, 4 IFTA awards, 3 TV Times Awards as well as RTS, TRIC and National Comedy Awards. BBC ONE series All Round to Mrs. Brown’s continues to achieve record breaking viewing figures and Mrs Brown’s Boys Christmas Day and New Year’s Day TV specials also returned for the festive period dominating ratings once again. Most recently D’Mini Series aired on both BBC One and RTE One with viewing figures again breaking records and has been shortlisted for the upcoming TV Choice Awards', 0),
(6, 'Sugar Babes', 'Image 6', 'Sugababes have cemented their place as one of the most successful and critically-acclaimed British girl bands of the 21st century.  Since their formation in 1998 they have scored six Number One singles, had millions of global sales and multiple multi-platinum albums. Their recent comeback -  as the original line-up of Keisha Buchanan, Mutya Buena and Siobhan Donaghy - was solidified with their now legendary 2022 Glastonbury performance. This set the scene for their first new music in a decade as well as a sold out date at Iveagh Gardens, Dublin.', 1),
(7, 'Olly Murs', 'Image 7', 'The singer, songwriter, and solid-gold pop star has been front and centre as host of ITV’s Starstruck, then, he returned to the big swivelly chair on The Voice. But in the artist world – the world that forged him, Olly had been off the radar for over four years before returning with 2022\'s \'Marry Me\'. Now, the musician who had four Number One singles and four Number One albums in a near-back-to-back run after bursting onto the scene with his double-platinum self-titled debut in 2010, is well and truly back.\r\nOlly’s previous albums and subsequent sold-out tours have all been enormously successful. The stats speak for themselves: 6 multi-platinum albums, 4 #1 UK albums, 4 #1 UK singles, 6 million spotify monthly listeners, 800 million Youtube views & 1.8 million tour tickets sold.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE `event_category` (
  `event_category_id` int(10) UNSIGNED NOT NULL,
  `event_category_name` varchar(255) NOT NULL,
  `event_genre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_category`
--

INSERT INTO `event_category` (`event_category_id`, `event_category_name`, `event_genre`) VALUES
(1, 'Ice Hockey', 'Sport'),
(2, 'Ice Shows', 'Family & Attractions'),
(3, 'All Concerts', 'Music'),
(4, 'Musicals', 'Arts, Theatre & Comedy'),
(5, 'Comedy', 'Arts, Theatre & Comedy');

-- --------------------------------------------------------

--
-- Table structure for table `order_confirmation`
--

CREATE TABLE `order_confirmation` (
  `order_confirmation_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `section_name` varchar(255) NOT NULL,
  `row_name` varchar(255) NOT NULL,
  `seat_auto_id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `eticket` tinyint(1) DEFAULT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `total_cost_id` int(10) UNSIGNED NOT NULL,
  `event_date_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_confirmation`
--

INSERT INTO `order_confirmation` (`order_confirmation_id`, `event_id`, `section_name`, `row_name`, `seat_auto_id`, `order_number`, `eticket`, `currency_symbol`, `total_cost_id`, `event_date_time`, `status`) VALUES
(7, 1, 'STHU5', 'U', 1, '765/986/987GT3', 0, '£', 1, '2024-12-30 19:00:00', 'purchased'),
(8, 3, 'Table', 'Row 95', 2, '654/876/543SE1', 0, '€', 2, '2024-11-25 19:00:00', 'pending'),
(9, 2, 'NTHU1', 'Row Y', 3, '6543/8763/5436FR2', 1, '£', 3, '2024-12-30 17:30:00', 'purchased'),
(10, 4, 'Grand', 'Row O', 4, '7654/9876/5434FH1', 1, '€', 4, '2024-11-28 18:30:00', 'purchased'),
(11, 5, 'WestM5', 'Row N', 5, '6756/9876/6564FG3', 1, '£', 5, '2024-12-12 20:00:00', 'pending'),
(13, 6, 'Standing', 'Standing', 6, '6754/8712/0923AW1', 1, '£', 6, '2025-04-19 18:30:00', 'pending'),
(14, 7, 'Standing', 'Standing', 8, '6474/9821/9756GH1', 1, '£', 7, '2025-04-30 18:30:00', 'purchased');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `total_cost_id` int(10) UNSIGNED NOT NULL,
  `ticket_price_id` int(10) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `billing_address_id` int(10) UNSIGNED NOT NULL,
  `terms_and_conditions` tinyint(1) NOT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `currency_id`, `total_cost_id`, `ticket_price_id`, `payment_method_id`, `billing_address_id`, `terms_and_conditions`, `status`) VALUES
(1, 1, 1, 0, 1, 1, 1, 'purchased'),
(2, 2, 2, 2, 2, 2, 1, 'pending'),
(3, 1, 3, 2, 3, 3, 1, 'purchased'),
(4, 2, 3, 3, 1, 4, 1, 'purchased'),
(5, 1, 5, 3, 2, 5, 1, 'purchased'),
(6, 1, 6, 4, 2, 6, 1, 'purchased'),
(9, 1, 7, 6, 1, 1, 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `payment_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `payment_type_name`) VALUES
(1, 'debit card'),
(2, 'pay-pal'),
(3, 'klarna');

-- --------------------------------------------------------

--
-- Table structure for table `performer`
--

CREATE TABLE `performer` (
  `performer_id` int(10) UNSIGNED NOT NULL,
  `performer_name` varchar(255) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `event_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `performer`
--

INSERT INTO `performer` (`performer_id`, `performer_name`, `description`, `event_id`, `event_category_id`) VALUES
(1, 'The Belfast Giants', 'Whether you’re a diehard hockey fan or a total newbie, a Belfast Giants home game is not to be missed.  \r\n\r\nThe only professional ice hockey team on the island of Ireland, the Giants compete in the Elite Ice Hockey League. \r\n\r\nOver the last two decades the team has captured the hearts of millions of fans at home and abroad, with their high-octane on-ice action and entertaining game night experience. \r\n\r\n', 1, 1),
(2, 'Bill Ryder-Jones + Gruff Rhys', 'Bill Ryder-Jones is a songwriter, producer and multi-instrumentalist from West Kirby on the Wirral. Bill first found success as a founding member of the band The Coral, achieving several UK number one albums, a mercury prize nomination and tours with Blur and Oasis. He left the band in 2008, signing to the great British independent label Domino Records, with whom he has released five LPs, from his first - a classical score to Italo Calvino’s ‘If on a Winter Night a Traveller’, to this year’s critically acclaimed album ‘Iechyd Da.', 3, 3),
(3, 'Disney on Ice', 'Hit the road with Mickey Mouse and his pals for a high-octane ride in Disney On Ice presents Road Trip Adventures, experiencing the fantastic Disney and Pixar adventures of Mary Poppins Returns, Toy Story 4, Incredibles 2, The Lion King, Aladdin, Moana, and Frozen all in one ice show. Behind the scenes, supporting the cast of Disney On Ice presents Road Trip Adventures is a team of choreographers and set and costume designers who create 103 props and 275 different costumes, which is all transported in 17 trucks from city to city, taking approximately 14 hours to set up.', 2, 2),
(4, 'Peter Pan', 'The Gaiety Theatre will set sail on a spectacular journey to Neverland, announcing Peter Pan as the 2024 Gaiety Pantomime.\r\n\r\nThe Gaiety Panto, directed by Daryn Crosbie, brings to life and “Panto-ifies” this classic adventure about the free-spirited and mischievous young boy, who never grows up.\r\n\r\nJoin Peter and the Lost Boys as they swashbuckle their way through Neverland and strive to outwit the dastardly Captain Hook and his brutal band of pirates, with a sprinkling of fairy dust help from Tinkerbell of course.\r\n\r\nDon’t miss this truly magnificent panto adventure with breathtaking special effects, foot-stomping song and dance routines, dazzling costumes, and mesmerising magic…!\r\n\r\nSo, let your imagination take flight to the “Second star to the right and straight on till morning…!” as we bring you, Peter Pan, at the Gaiety Theatre.\r\n\r\nAnd don’t forget, this is no ordinary Panto… It’s the Gaiety Panto…!\r\n\r\nThe Gaiety Theatre has hosted the annual Christmas Panto each year since “Turko The Terrible” in 1873. Today, families come from far and wide to experience the Gaiety Christmas Panto and for many, it has become as much a family Christmas tradition as Santa himself.\r\n', 4, 4),
(5, 'Mrs. Brown’s Boys', 'Mrs. Brown’s Boys success has been nothing short of incredible. Voted the No. 1 Sitcom of the 21st Century, awards include 5 BAFTAs, 4 National Television Awards, 3 TV Choice Awards, 4 IFTA awards, 3 TV Times Awards as well as RTS, TRIC and National Comedy Awards. BBC ONE series All Round to Mrs. Brown’s continues to achieve record breaking viewing figures and Mrs Brown’s Boys Christmas Day and New Year’s Day TV specials also returned for the festive period dominating ratings once again. Most recently D’Mini Series aired on both BBC One and RTE One with viewing figures again breaking records and has been shortlisted for the upcoming TV Choice Awards', 5, 5),
(6, 'Sugar Babes', 'Sugababes have cemented their place as one of the most successful and critically-acclaimed British girl bands of the 21st century.  Since their formation in 1998 they have scored six Number One singles, had millions of global sales and multiple multi-platinum albums. Their recent comeback -  as the original line-up of Keisha Buchanan, Mutya Buena and Siobhan Donaghy - was solidified with their now legendary 2022 Glastonbury performance. This set the scene for their first new music in a decade as well as a sold out date at Iveagh Gardens, Dublin.', 6, 3),
(7, 'Olly Murs', 'The singer, songwriter, and solid-gold pop star has been front and centre as host of ITV’s Starstruck, then, he returned to the big swivelly chair on The Voice. But in the artist world – the world that forged him, Olly had been off the radar for over four years before returning with 2022\'s \'Marry Me\'. Now, the musician who had four Number One singles and four Number One albums in a near-back-to-back run after bursting onto the scene with his double-platinum self-titled debut in 2010, is well and truly back.\r\n\r\nOlly’s previous albums and subsequent sold-out tours have all been enormously successful. The stats speak for themselves: 6 multi-platinum albums, 4 #1 UK albums, 4 #1 UK singles, 6 million spotify monthly listeners, 800 million Youtube views & 1.8 million tour tickets sold.', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int(10) UNSIGNED NOT NULL,
  `region_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `region_name`) VALUES
(1, 'Northern Ireland'),
(2, 'Ireland'),
(3, 'All of United Kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `seating_plan`
--

CREATE TABLE `seating_plan` (
  `seat_auto_id` int(10) UNSIGNED NOT NULL,
  `venue_id` int(10) UNSIGNED NOT NULL,
  `row_name` varchar(255) NOT NULL,
  `restricted_view` tinyint(1) NOT NULL,
  `is_accessible` tinyint(1) NOT NULL,
  `seat_identifier` varchar(255) DEFAULT NULL,
  `section_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seating_plan`
--

INSERT INTO `seating_plan` (`seat_auto_id`, `venue_id`, `row_name`, `restricted_view`, `is_accessible`, `seat_identifier`, `section_id`) VALUES
(1, 1, 'Row U', 0, 1, 'Seat 78', 1),
(2, 2, 'Row 95', 0, 1, 'Seat 1', 2),
(3, 1, 'Row Y', 0, 1, 'Seat 54', 3),
(4, 3, 'Row O', 1, 0, '3', 4),
(5, 1, 'Row N', 0, 0, 'Seat 63', 5),
(6, 1, '', 1, 0, NULL, 6),
(8, 1, 'Standing', 0, 0, 'Standing', 7);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(10) UNSIGNED NOT NULL,
  `section_name` varchar(255) NOT NULL,
  `standing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section_name`, `standing`) VALUES
(1, 'STHU5', 0),
(2, 'Table', 0),
(3, 'NTHU2', 0),
(4, 'Grand', 0),
(5, 'WestM5', 0),
(6, 'Standing', 1),
(7, 'Standing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_address`
--

CREATE TABLE `shipping_address` (
  `shipping_address_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `building_identifier` varchar(255) NOT NULL,
  `address_line_one` varchar(255) NOT NULL,
  `address_line_two` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `city_town` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_address`
--

INSERT INTO `shipping_address` (`shipping_address_id`, `first_name`, `last_name`, `building_identifier`, `address_line_one`, `address_line_two`, `postal_code`, `country_name`, `city_town`) VALUES
(1, 'Niamh', 'Kane', '', '59 Riverdale Gardens', NULL, 'BT11 9DG', 'Northern Ireland', 'Belfast'),
(2, 'Caoimhe', 'Fraser', '', '7 Denewood Park ', NULL, 'BT119DP', 'Northern Ireland', 'Belfast'),
(3, 'Janet', 'McKeown', '', '6 Chopin Street', NULL, 'BT119CS', 'Northern Ireland', 'Belfast'),
(4, 'David', 'Kane', 'Building 1', '16 St James Drive', 'Apt 4B', 'BT14 8GH', 'Ireland', 'Lisburn'),
(5, 'Julia', 'Smith', '', '9 Fountain Lane', NULL, 'BT16 4JP', 'Northern Ireland', 'Lisburn'),
(6, 'Izabela', 'Lysakowska', '', '288 Evergreen Crescent', NULL, 'BT76 8DF', 'Ireland', 'Antrim');

-- --------------------------------------------------------

--
-- Table structure for table `specific_event`
--

CREATE TABLE `specific_event` (
  `specific_event_id` int(10) UNSIGNED NOT NULL,
  `specific_event_name` varchar(255) NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `event_category_id` int(10) UNSIGNED NOT NULL,
  `venue_id` int(10) UNSIGNED NOT NULL,
  `date_time` datetime NOT NULL,
  `is_presale` tinyint(1) DEFAULT NULL,
  `presale_start_time` datetime DEFAULT NULL,
  `presale_end_time` datetime DEFAULT NULL,
  `general_onsale_time` datetime DEFAULT NULL,
  `availability_status_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specific_event`
--

INSERT INTO `specific_event` (`specific_event_id`, `specific_event_name`, `event_id`, `description`, `event_category_id`, `venue_id`, `date_time`, `is_presale`, `presale_start_time`, `presale_end_time`, `general_onsale_time`, `availability_status_id`) VALUES
(2, 'Belfast Giants v Dundee Stars', 1, 'Belfast Giants v Dundee Stars in a battle of ice hockey', 1, 1, '2024-12-30 19:00:00', 1, NULL, NULL, '2024-11-03 12:00:00', 1),
(5, 'Bill Ryder-Jones + Gruff Rhys', 3, 'Gruff Rhys is a songwriter, producer and BAFTA-winning storyteller from Bethesda in Wales who has consistently sought a variety of outlets for the spectrum of muses behind his creative fights. Formerly most well known as the frontman of Super Furry Animals – a band that has been able to achieve that rarest of mixes, artistic adventure with popular devotion – he blended fuzz-fled rock, pure harmonies and cutting edge electronics, while with his other band, Neon Neon, Rhys has documented the lives of maverick car maker John DeLorean and Italian activist and publisher Giangiacomo Feltrinelli in widescreen style.', 3, 2, '2024-11-27 19:30:00', 1, NULL, NULL, '2024-08-01 17:00:00', 2),
(6, 'Disney on Ice - Road Show Adventures', 2, 'Exciting twists and turns await as Mickey, Minnie, Goofy and guests of all ages embark on an interactive and memory-rich adventure to iconic Disney destinations. See the world from the rooftops of London with Mary Poppins and Jack and his band of dancing lamplighters. Travel to the sun-soaked Motunui and help Moana restore the heart of Te Fiti. Set off on a safari and snap unforgettable photos of wild cheetahs and monkeys when guests traverse through the Pride Lands with Simba, Timon and Pumbaa. Discover a whole new world and be swept up in Aladdin’s princely parade filled with spectacular stunts, magical moments with Genie, and a brand-new song from Jasmine that will render the audience “Speechless.” Mosey on over to a larger-than-life comedic carnival and team up with Woody and Bo Peep as they search for their new friend Forky. Fans will hit a high note with Mickey and pals while singing along to beloved Disney tunes as they welcome Merida, Belle, Ariel, Mulan and Tiana to the ice.', 2, 1, '2024-12-07 17:30:00', 1, NULL, NULL, '2024-11-10 19:00:00', 3),
(7, 'Peter Pan', 4, 'The Gaiety Theatre will set sail on a spectacular journey to Neverland, announcing Peter Pan as the 2024 Gaiety Pantomime.\r\n\r\nThe Gaiety Panto, directed by Daryn Crosbie, brings to life and “Panto-ifies” this classic adventure about the free-spirited and mischievous young boy, who never grows up.\r\n\r\nJoin Peter and the Lost Boys as they swashbuckle their way through Neverland and strive to outwit the dastardly Captain Hook and his brutal band of pirates, with a sprinkling of fairy dust help from Tinkerbell of course.\r\n\r\nDon’t miss this truly magnificent panto adventure with breathtaking special effects, foot-stomping song and dance routines, dazzling costumes, and mesmerising magic…!\r\n\r\nSo, let your imagination take flight to the “Second star to the right and straight on till morning…!” as we bring you, Peter Pan, at the Gaiety Theatre.\r\n\r\nAnd don’t forget, this is no ordinary Panto… It’s the Gaiety Panto…!\r\n\r\nThe Gaiety Theatre has hosted the annual Christmas Panto each year since “Turko The Terrible” in 1873. Today, families come from far and wide to experience the Gaiety Christmas Panto and for many, it has become as much a family Christmas tradition as Santa himself.\r\n', 4, 3, '2024-11-28 18:30:00', 1, NULL, NULL, '2024-11-03 18:30:00', 1),
(8, 'Sugar Babes', 6, 'Sugababes have cemented their place as one of the most successful and critically-acclaimed British girl bands of the 21st century.  Since their formation in 1998 they have scored six Number One singles, had millions of global sales and multiple multi-platinum albums. Their recent comeback -  as the original line-up of Keisha Buchanan, Mutya Buena and Siobhan Donaghy - was solidified with their now legendary 2022 Glastonbury performance. This set the scene for their first new music in a decade as well as a sold out date at Iveagh Gardens, Dublin.', 3, 1, '2025-04-19 18:30:00', 1, NULL, NULL, '2024-07-07 19:00:00', 2),
(9, 'Olly Murs', 7, 'The singer, songwriter, and solid-gold pop star has been front and centre as host of ITV’s Starstruck, then, he returned to the big swivelly chair on The Voice. But in the artist world – the world that forged him, Olly had been off the radar for over four years before returning with 2022\'s \'Marry Me\'. Now, the musician who had four Number One singles and four Number One albums in a near-back-to-back run after bursting onto the scene with his double-platinum self-titled debut in 2010, is well and truly back.\r\n\r\nOlly’s previous albums and subsequent sold-out tours have all been enormously successful. The stats speak for themselves: 6 multi-platinum albums, 4 #1 UK albums, 4 #1 UK singles, 6 million spotify monthly listeners, 800 million Youtube views & 1.8 million tour tickets sold.', 3, 1, '2025-04-30 18:30:00', 0, NULL, NULL, '2024-09-01 10:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_price`
--

CREATE TABLE `ticket_price` (
  `ticket_price_id` int(10) UNSIGNED NOT NULL,
  `seat_auto_id` int(10) UNSIGNED NOT NULL,
  `specific_event_id` int(10) UNSIGNED NOT NULL,
  `ticket_type_id` int(10) UNSIGNED NOT NULL,
  `total_ticket_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_price`
--

INSERT INTO `ticket_price` (`ticket_price_id`, `seat_auto_id`, `specific_event_id`, `ticket_type_id`, `total_ticket_price`) VALUES
(0, 1, 2, 1, 21.50),
(1, 2, 5, 1, 39.20),
(2, 3, 6, 2, 39.50),
(3, 4, 7, 4, 30.00),
(4, 6, 8, 5, 53.35),
(6, 8, 9, 7, 45.00);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_total`
--

CREATE TABLE `ticket_total` (
  `ticket_total_id` int(10) UNSIGNED NOT NULL,
  `ticket_type_price` decimal(10,2) NOT NULL,
  `ticket_type_quantity` tinyint(3) UNSIGNED NOT NULL,
  `total_ticket_quantity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_total`
--

INSERT INTO `ticket_total` (`ticket_total_id`, `ticket_type_price`, `ticket_type_quantity`, `total_ticket_quantity`) VALUES
(1, 20.50, 1, 1),
(2, 30.45, 1, 1),
(3, 39.20, 1, 1),
(4, 30.00, 3, 3),
(5, 50.50, 1, 1),
(6, 35.53, 2, 2),
(7, 45.00, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_type`
--

CREATE TABLE `ticket_type` (
  `ticket_type_id` int(10) UNSIGNED NOT NULL,
  `ticket_type_name` varchar(255) NOT NULL,
  `ticket_type_price` decimal(10,2) NOT NULL,
  `seat_id` varchar(255) NOT NULL,
  `ticket_type_quantity` tinyint(3) UNSIGNED NOT NULL,
  `availability_status_id` int(11) UNSIGNED NOT NULL,
  `availability_status` varchar(255) NOT NULL,
  `specific_event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_type`
--

INSERT INTO `ticket_type` (`ticket_type_id`, `ticket_type_name`, `ticket_type_price`, `seat_id`, `ticket_type_quantity`, `availability_status_id`, `availability_status`, `specific_event_id`) VALUES
(1, 'Full Price Ticket', 20.50, 'Seat 77', 1, 1, 'Available', 1),
(2, 'Possible Restricted View', 38.95, 'Seat 15', 1, 2, 'Low Availability', 2),
(3, 'Full Price Ticket', 39.20, 'Seat 1', 1, 1, 'Available', 3),
(4, 'Verified Resale Tickets', 30.00, 'Seat 3', 1, 4, 'No Availability', 4),
(5, 'Full Price Ticket', 50.50, 'Seat 63', 1, 5, 'Presale', 5),
(6, 'Full Price Ticket', 53.35, 'Standing', 1, 6, 'Available', 6),
(7, 'Student', 45.00, 'Standing', 2, 1, 'Available', 7);

-- --------------------------------------------------------

--
-- Table structure for table `total_cost`
--

CREATE TABLE `total_cost` (
  `total_cost_id` int(10) UNSIGNED NOT NULL,
  `ticket_total_id` int(10) UNSIGNED DEFAULT NULL,
  `delivery_cost_id` int(10) UNSIGNED NOT NULL,
  `service_charge` decimal(10,2) DEFAULT NULL,
  `handling_fee` decimal(10,2) DEFAULT NULL,
  `facility_fee` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `total_cost`
--

INSERT INTO `total_cost` (`total_cost_id`, `ticket_total_id`, `delivery_cost_id`, `service_charge`, `handling_fee`, `facility_fee`) VALUES
(1, 1, 2, 2.50, 2.00, 3.50),
(2, 2, 2, 2.95, 3.50, 2.00),
(3, 3, 3, 5.00, 3.75, 1.50),
(4, 4, 4, 9.00, 3.75, 4.00),
(5, 5, 3, 1.50, 5.05, 2.00),
(6, 6, 4, 9.05, 3.60, 1.75),
(7, 7, 2, 2.50, 5.05, 4.00);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `salt` varbinary(255) NOT NULL,
  `password` varbinary(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `checkout_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `phone_number`, `country_id`, `salt`, `password`, `billing_address`, `shipping_address`, `checkout_id`) VALUES
(1, 'Niamh', 'Kane', 'niamhkane@gmail.com', '077650483425', 1, 0x66383937613131372d613733302d313165662d393339302d633833343865373538363334, 0x39643331323861303764343832343662363339626463323639396564366566653132306237343231653934326363366630623334333530393364363362376530, '59 Riverdale Gardens', '59 Riverdale Gardens', 1),
(2, 'Caoimhe', 'Fraser', 'cfraser@hotmail.com', '07740623171', 1, 0x66383937623565312d613733302d313165662d393339302d633833343865373538363334, 0x37326561323265386532353339653364623663393734346537393137353239373637666566633737313737303664636239393937633963333034346237393733, '7 Denewood Park', '7 Denewood Park', 2),
(3, 'Janet', 'McKeown', 'jmck@outlook.com', '07626272781', 1, 0x66383937623663312d613733302d313165662d393339302d633833343865373538363334, 0x65353464396566353066393837376563303764376631306536353332373736643936633161383332396134613863316536346563373634656530666134623835, '6 Chopin Street', '6 Chopin Street', 3),
(4, 'David ', 'Kane', 'daviddavid@hotmail.com', '07750438171', 2, 0x66383937623733302d613733302d313165662d393339302d633833343865373538363334, 0x66666531616465333563303464333061343539643266383065343161316234656133626131636138333862343236656266663065396139626333333031663635, '16 St James Drive', '16 St James Drive', 4),
(5, 'Julia', 'Smith', 'jsmith1995@hotmail.com', '07654328765', 1, 0x66383937623738642d613733302d313165662d393339302d633833343865373538363334, 0x61303432386239366236313436363564666335643538613437306139663763643430666432636230373130363062613238383461643232363532336234636461, '9 Fountain Lane', '9 Fountain Lane', 5),
(6, 'Izabela', 'Lysakowska', 'ilys@hotmail.com', '077609876512', 2, 0x66383937623765392d613733302d313165662d393339302d633833343865373538363334, 0x65323132623961663865636535643539626166346365323437623131653563333736376366363765346666336539626234366439656238366535313162353336, '288 Evergreen Crescent', '288 Evergreen Crescent', 6);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venue_id` int(10) UNSIGNED NOT NULL,
  `venue_name` varchar(255) NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL,
  `region_id` int(10) UNSIGNED DEFAULT NULL,
  `accessible` tinyint(1) DEFAULT NULL,
  `venue_details` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venue_id`, `venue_name`, `capacity`, `region_id`, `accessible`, `venue_details`) VALUES
(1, 'SSE Arena', 10800, 1, 0, 'The SSE Arena, Belfast is located on the east side of the river Lagan in Belfast, in the Laganside development.'),
(2, 'Vicar Street', 1050, 2, 0, 'From Trinity College go straight up Dame St towards Christ Church. Keep going straight and you will be on Thomas Street. Vicar Street is on the left hand side of the road.'),
(3, 'Gaiety Theatre', 2000, 2, 1, 'The Theatre is located in the heart of Dublin City Centre on South King Street, Dublin 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `availability_status`
--
ALTER TABLE `availability_status`
  ADD PRIMARY KEY (`availability_status_id`),
  ADD UNIQUE KEY `availability_status_id` (`availability_status_id`);

--
-- Indexes for table `billing_address`
--
ALTER TABLE `billing_address`
  ADD PRIMARY KEY (`billing_address_id`),
  ADD UNIQUE KEY `billing_address_id` (`billing_address_id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_id`),
  ADD UNIQUE KEY `card_id` (`card_id`),
  ADD KEY `card_index_0` (`user_id`),
  ADD KEY `billing_address_id` (`billing_address_id`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`checkout_id`),
  ADD UNIQUE KEY `checkout_id` (`checkout_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD UNIQUE KEY `city_id` (`city_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `country_id` (`country_id`),
  ADD UNIQUE KEY `country_code` (`country_code`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`),
  ADD UNIQUE KEY `currency_id` (`currency_id`);

--
-- Indexes for table `delivery_costs`
--
ALTER TABLE `delivery_costs`
  ADD PRIMARY KEY (`delivery_costs_id`),
  ADD UNIQUE KEY `delivery_costs_id` (`delivery_costs_id`),
  ADD KEY `shipping_address_id` (`shipping_address_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD UNIQUE KEY `event_id` (`event_id`);

--
-- Indexes for table `event_category`
--
ALTER TABLE `event_category`
  ADD PRIMARY KEY (`event_category_id`),
  ADD UNIQUE KEY `event_category_id` (`event_category_id`),
  ADD UNIQUE KEY `event_category_name` (`event_category_name`);

--
-- Indexes for table `order_confirmation`
--
ALTER TABLE `order_confirmation`
  ADD PRIMARY KEY (`order_confirmation_id`),
  ADD UNIQUE KEY `order_confirmation_id` (`order_confirmation_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `seat_auto_id` (`seat_auto_id`),
  ADD KEY `total_cost_id` (`total_cost_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`),
  ADD KEY `ticket_price_id` (`ticket_price_id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `payment_method_id` (`payment_method_id`) USING BTREE,
  ADD KEY `billing_address_id` (`billing_address_id`) USING BTREE;

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`payment_method_id`),
  ADD UNIQUE KEY `payment_method_id` (`payment_method_id`);

--
-- Indexes for table `performer`
--
ALTER TABLE `performer`
  ADD PRIMARY KEY (`performer_id`),
  ADD UNIQUE KEY `performer_id` (`performer_id`),
  ADD UNIQUE KEY `event_id` (`event_id`),
  ADD KEY `event_category_id` (`event_category_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD UNIQUE KEY `region_id` (`region_id`);

--
-- Indexes for table `seating_plan`
--
ALTER TABLE `seating_plan`
  ADD PRIMARY KEY (`seat_auto_id`),
  ADD UNIQUE KEY `seat_auto_id` (`seat_auto_id`),
  ADD UNIQUE KEY `section_id` (`section_id`),
  ADD KEY `venue_id` (`venue_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`),
  ADD UNIQUE KEY `section_id` (`section_id`);

--
-- Indexes for table `shipping_address`
--
ALTER TABLE `shipping_address`
  ADD PRIMARY KEY (`shipping_address_id`),
  ADD UNIQUE KEY `shipping_address_id` (`shipping_address_id`);

--
-- Indexes for table `specific_event`
--
ALTER TABLE `specific_event`
  ADD PRIMARY KEY (`specific_event_id`),
  ADD UNIQUE KEY `specific_event_id` (`specific_event_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `event_category_id` (`event_category_id`),
  ADD KEY `availability_status_id` (`availability_status_id`) USING BTREE;

--
-- Indexes for table `ticket_price`
--
ALTER TABLE `ticket_price`
  ADD PRIMARY KEY (`ticket_price_id`),
  ADD UNIQUE KEY `ticket_price_id` (`ticket_price_id`),
  ADD UNIQUE KEY `seat_auto_id` (`seat_auto_id`),
  ADD UNIQUE KEY `total_ticket_price` (`total_ticket_price`),
  ADD KEY `specific_event_id` (`specific_event_id`),
  ADD KEY `ticket_type_id` (`ticket_type_id`);

--
-- Indexes for table `ticket_total`
--
ALTER TABLE `ticket_total`
  ADD PRIMARY KEY (`ticket_total_id`),
  ADD UNIQUE KEY `ticket_total_id` (`ticket_total_id`);

--
-- Indexes for table `ticket_type`
--
ALTER TABLE `ticket_type`
  ADD PRIMARY KEY (`ticket_type_id`),
  ADD UNIQUE KEY `ticket_type_id` (`ticket_type_id`),
  ADD KEY `availability_status_id` (`ticket_type_id`);

--
-- Indexes for table `total_cost`
--
ALTER TABLE `total_cost`
  ADD PRIMARY KEY (`total_cost_id`),
  ADD UNIQUE KEY `total_cost_id` (`total_cost_id`),
  ADD UNIQUE KEY `ticket_total_id` (`ticket_total_id`),
  ADD KEY `delivery_cost_id` (`delivery_cost_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `checkout_id` (`checkout_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venue_id`),
  ADD UNIQUE KEY `venue_id` (`venue_id`),
  ADD KEY `region_id` (`region_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_address`
--
ALTER TABLE `billing_address`
  MODIFY `billing_address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `card_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `checkout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_costs`
--
ALTER TABLE `delivery_costs`
  MODIFY `delivery_costs_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `event_category`
--
ALTER TABLE `event_category`
  MODIFY `event_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_confirmation`
--
ALTER TABLE `order_confirmation`
  MODIFY `order_confirmation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `payment_method_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `performer`
--
ALTER TABLE `performer`
  MODIFY `performer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seating_plan`
--
ALTER TABLE `seating_plan`
  MODIFY `seat_auto_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shipping_address`
--
ALTER TABLE `shipping_address`
  MODIFY `shipping_address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `specific_event`
--
ALTER TABLE `specific_event`
  MODIFY `specific_event_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ticket_total`
--
ALTER TABLE `ticket_total`
  MODIFY `ticket_total_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ticket_type`
--
ALTER TABLE `ticket_type`
  MODIFY `ticket_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `total_cost`
--
ALTER TABLE `total_cost`
  MODIFY `total_cost_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `venue_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `card_ibfk_2` FOREIGN KEY (`billing_address_id`) REFERENCES `billing_address` (`billing_address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`checkout_id`) REFERENCES `user` (`checkout_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `country_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `delivery_costs`
--
ALTER TABLE `delivery_costs`
  ADD CONSTRAINT `delivery_costs_ibfk_1` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address` (`shipping_address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_confirmation`
--
ALTER TABLE `order_confirmation`
  ADD CONSTRAINT `order_confirmation_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_confirmation_ibfk_2` FOREIGN KEY (`seat_auto_id`) REFERENCES `seating_plan` (`seat_auto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_confirmation_ibfk_3` FOREIGN KEY (`total_cost_id`) REFERENCES `total_cost` (`total_cost_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ticket_price_id`) REFERENCES `ticket_price` (`ticket_price_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`billing_address_id`) REFERENCES `billing_address` (`billing_address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `payment_ibfk_4` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `performer`
--
ALTER TABLE `performer`
  ADD CONSTRAINT `performer_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `performer_ibfk_2` FOREIGN KEY (`event_category_id`) REFERENCES `event_category` (`event_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `seating_plan`
--
ALTER TABLE `seating_plan`
  ADD CONSTRAINT `seating_plan_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `seating_plan_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `specific_event`
--
ALTER TABLE `specific_event`
  ADD CONSTRAINT `specific_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `specific_event_ibfk_2` FOREIGN KEY (`event_category_id`) REFERENCES `event_category` (`event_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `specific_event_ibfk_3` FOREIGN KEY (`availability_status_id`) REFERENCES `availability_status` (`availability_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket_price`
--
ALTER TABLE `ticket_price`
  ADD CONSTRAINT `ticket_price_ibfk_1` FOREIGN KEY (`seat_auto_id`) REFERENCES `seating_plan` (`seat_auto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ticket_price_ibfk_2` FOREIGN KEY (`specific_event_id`) REFERENCES `specific_event` (`specific_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ticket_price_ibfk_3` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_type` (`ticket_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket_total`
--
ALTER TABLE `ticket_total`
  ADD CONSTRAINT `ticket_total_ibfk_1` FOREIGN KEY (`ticket_total_id`) REFERENCES `total_cost` (`ticket_total_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `total_cost`
--
ALTER TABLE `total_cost`
  ADD CONSTRAINT `total_cost_ibfk_1` FOREIGN KEY (`delivery_cost_id`) REFERENCES `delivery_costs` (`delivery_costs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `venue`
--
ALTER TABLE `venue`
  ADD CONSTRAINT `venue_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
