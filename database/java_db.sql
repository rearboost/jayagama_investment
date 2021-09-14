-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 14, 2021 at 03:20 AM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `jayamag1_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `center`
--

CREATE TABLE `center` (
  `id` int(11) NOT NULL,
  `center_code` varchar(50) NOT NULL,
  `center_name` varchar(150) NOT NULL,
  `leader` varchar(250) NOT NULL,
  `contact` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `center`
--

INSERT INTO `center` (`id`, `center_code`, `center_name`, `leader`, `contact`) VALUES
(1, 'ANG001', 'THELAWALA ', 'ROSHINI KUMARI', 783877085),
(2, 'ANG002', 'KOSWATTA', 'WEERAKOONGE CHAMIKA JANANI', 761804430),
(3, 'ANG003', 'THELAWALA 02', 'KUMARI', 755539509),
(4, 'ANG004', 'MATTAKKULIYA', 'DINUSHA HARSHANI', 766889516),
(5, 'ANG005', 'SWARNA ROAD', 'MANIKAM ROSMARI', 768855138),
(6, 'ANG006', 'SWARNA ROAD 02', 'SHYAMALI UDAYANGANI', 740662229);

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `centerID` int(11) NOT NULL,
  `li_date` varchar(50) NOT NULL,
  `year` varchar(10) NOT NULL,
  `month` varchar(10) NOT NULL,
  `tot_collection` decimal(10,2) NOT NULL,
  `tot_arrears` decimal(10,2) NOT NULL,
  `tot_outstanding` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`id`, `centerID`, `li_date`, `year`, `month`, `tot_collection`, `tot_arrears`, `tot_outstanding`) VALUES
(1, 1, '2021-06-16', '2021', '06', '26450.00', '2958.00', '0.00'),
(2, 2, '2021-06-25', '2021', '06', '2752.00', '3160.00', '20744.00'),
(3, 1, '2021-06-29', '2021', '06', '5760.00', '3000.00', '152790.00'),
(4, 6, '2021-08-27', '2021', '08', '26400.00', '18860.00', '1117100.00'),
(5, 2, '2021-08-27', '2021', '08', '116059.00', '235526.00', '305643.00'),
(6, 6, '2021-08-27', '2021', '08', '313950.00', '-295090.00', '533150.00'),
(7, 5, '2021-08-27', '2021', '08', '327600.00', '232456.00', '582400.00'),
(8, 6, '2021-08-27', '2021', '08', '0.00', '0.00', '0.00'),
(9, 4, '2021-08-27', '2021', '08', '185300.00', '287093.00', '107620.00'),
(10, 4, '2021-08-27', '2021', '08', '200.00', '286893.00', '107420.00'),
(11, 3, '2021-08-27', '2021', '08', '14250.00', '294674.00', '53000.00'),
(12, 5, '2021-09-01', '2021', '09', '2200.00', '232444.00', '580200.00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `center_id` int(11) NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `addLine1` varchar(150) NOT NULL,
  `addLine2` varchar(150) NOT NULL,
  `addLine3` varchar(150) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `contact2` varchar(15) NOT NULL,
  `image` varchar(100) NOT NULL DEFAULT '100.jpg',
  `image2` varchar(100) NOT NULL DEFAULT '100.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `center_id`, `memberID`, `name`, `NIC`, `addLine1`, `addLine2`, `addLine3`, `contact`, `contact2`, `image`, `image2`) VALUES
(1, 6, 'JI-00001', 'IHALAGADURAGE JAYANTHI', '667682053v', 'NO:70/4/1/1,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0777449296', '', '100.jpg', '100.jpg'),
(2, 6, 'JI-00002', 'THELIKADA PALLIYA GURUGE SUMEDHA PRIYADARSHANI', '196684800691', 'NO:70/4,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 06', '0771267314', '', '100.jpg', '100.jpg'),
(3, 5, 'JI-00003', 'SOORIYA ARACHCHIGE CHANDIMA MADANAYAKA', '197756901280', 'NO:08/1,SRI SIDDHARHA PARC', 'KIRULAPONA', 'COLOMBO 05', '0760128646', '', '100.jpg', '100.jpg'),
(4, 6, 'JI-00004', 'BENTHARAGE DULANJILA MADUWANTHI', '926481223v', 'NO:154/1/1,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0754904424', '', '100.jpg', '100.jpg'),
(5, 6, 'JI-00005', 'WADENA KONDA ARACHCHILAGE DEEPANI FERNANDO', '197178901619', 'NO:44/2,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0762927103', '', '100.jpg', '100.jpg'),
(6, 6, 'JI-00006', 'SUPPAIYA PICHCHA MUTHTHU JAYANTHI MALA', '857440498V', 'NO:149/4,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0741574952', '', '100.jpg', '100.jpg'),
(7, 6, 'JI-00007', 'WEERASAMI SAMISEL RENUKA', '726050899V', 'NO:128/22,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 06', '0761266516', '', '100.jpg', '100.jpg'),
(8, 6, 'JI-00008', 'BALACHANDRAM PUSHPARANI', '957814123V', 'NO:104/2,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0750395917', '', '100.jpg', '100.jpg'),
(9, 6, 'JI-00009', 'ADEYIKALAM KANTHIMATHI', '805494808V', 'NO:70/6,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0755916642', '', '100.jpg', '100.jpg'),
(10, 6, 'JI-00010', 'HETTIARACHCHIGE KANSALA NUWANTHIKA PRABASHINI', '887560390V', 'NO:19/1A,HIGHLEVEL RD', 'KIRULAPONA', 'COLOMBO 05', '0772369414', '', '100.jpg', '100.jpg'),
(11, 6, 'JI-00011', 'MANDAWALA KANKANAMGE SACHI SULOCHANA', '895391425V', 'D/D/1,SRI SIDDHARTHA RD', 'KIRULAPONA', 'C', '0776786745', '', '100.jpg', '100.jpg'),
(12, 6, 'JI-00012', 'KURUSAMI MANJULA DEWI ', '197177200423', 'NO:68/33,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0764980998', '', '100.jpg', '100.jpg'),
(13, 6, 'JI-00013', 'HETTIARACHCHIGE SHYAMALI UDAYANGANI', '198480600283', 'NO:70/27SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0740662229', '', '100.jpg', '100.jpg'),
(14, 6, 'JI-00014', 'PARAKRAMA MUDIYANSELAGE NIRMALI ', '665170411V', 'NO:70/31,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0757271627', '', '100.jpg', '100.jpg'),
(15, 6, 'JI-00015', 'VILPATHAGE DON SUNETHRA', '627071370V', 'NO:46/7,SOMADEVI PLACE', 'KIRULAPONA', 'COLOMBO 05', '0750843821', '', '100.jpg', '100.jpg'),
(16, 6, 'JI-00016', 'RANAWEERAGE CHAMILA', '738102681V', 'NO:128/61/A3,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0763106118', '', '100.jpg', '100.jpg'),
(17, 6, 'JI-00017', 'BENTHARAGE  SUWISANI MADUWANTHI', '966332700V', 'NO:128/61/A3,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0767287547', '', '100.jpg', '100.jpg'),
(18, 6, 'JI-00018', 'RATHNAYAKA MUDIYANSELAGE  SUMANAWATHI', '198574404183', 'NO:128/61/A3,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0711948403', '', '100.jpg', '100.jpg'),
(19, 6, 'JI-00019', 'ANANDA RUKSHALA', '825393951V', 'NO:40,SWARNA RD', 'KIRULAPONA', 'COLOMBO 05', '0776377629', '', '100.jpg', '100.jpg'),
(20, 6, 'JI-00020', 'HETTIARACHCHIGE  MADUSHA MADUMALI', '199377701592', 'NO:141/A,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0766602133', '', '100.jpg', '100.jpg'),
(21, 6, 'JI-00021', 'BALACHANDRAM ARUNI SHSHIKALA', '907252264V', 'NO:70/42,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0757522491', '', '100.jpg', '100.jpg'),
(22, 5, 'JI-00022', 'SENADEERAGE MADUKA DARSHINI PERIS', '198679003496', 'NO:44/2,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0775690878', '', '100.jpg', '100.jpg'),
(23, 5, 'JI-00023', 'MANIKKAN ROSMERI', '808530031V', 'NO:46/14,SOMADEVI PLACE', 'KIRULAPONA', 'COLOMBO 05', '0768855138', '', '100.jpg', '100.jpg'),
(24, 5, 'JI-00024', 'DOREYISAMI SULOCHANA', '655301780V', 'NO:43/12/B,SRI SIDDHARTHA PASAGE', 'KIRULAPONA', 'COLOMBO 05', '0723263451', '', '100.jpg', '100.jpg'),
(25, 5, 'JI-00025', 'DEHIWALA LIYANAGE SAMANTHI DILRUKSHI SILVA', '786150191V', 'NO:100/21,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0775981822', '', '100.jpg', '100.jpg'),
(26, 5, 'JI-00026', 'YOGANANDAN SARDADEWI', '705854491V', 'NO:104/2/I,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0769165049', '', '100.jpg', '100.jpg'),
(27, 5, 'JI-00027', 'MUTHUGALAGE SADATHARAKA SITHUMINI RATHNAYAKA', '867303219V', 'NO:40/7,SOMADEWI PLACE', 'KIRULAPONA', 'COLOMBO 05', '0701697414', '', '100.jpg', '100.jpg'),
(28, 5, 'JI-00028', 'RAMACHANDRAN JEEWA INDRANI', '855201900V', 'NO:128/123,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0766705641', '', '100.jpg', '100.jpg'),
(29, 5, 'JI-00029', 'WEERAN RUBINI', '876835177V', 'NO:128/61/A8,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0778122995', '', '100.jpg', '100.jpg'),
(30, 5, 'JI-00030', 'SIWANANDAN SIWAKUMAR', '857252845V', 'NO:46/14,SOMADEVI PLACE', 'KIRULAPONA', 'COLOMBO 05', '0778164327', '', '100.jpg', '100.jpg'),
(31, 5, 'JI-00031', 'DEHIWALA LIYANAGE PREETHI NALIKA SILVA', '916373627V', 'NO:68/46,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0752836848', '', '100.jpg', '100.jpg'),
(32, 5, 'JI-00032', 'HOLLU PATHIRAGE NIROSHANI PRIYANTHI KALDERA', '786054117V', 'NO:46/12,SOMADEWI PLACE', 'KIRULAPONA', 'COLOMBO 05', '0740899789', '', '100.jpg', '100.jpg'),
(33, 5, 'JI-00033', 'WITHANAGE PRIYANGA UDESHIKA', '838440576V', 'NO:104/2/J,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0758362585', '', '100.jpg', '100.jpg'),
(34, 5, 'JI-00034', 'MUNIYANDI NIROSHINI', '198882500964', 'NO:46/22/A,SOMADEWI PLACE', 'KIRULAPONA', 'COLOMBO 05', '0757726658', '', '100.jpg', '100.jpg'),
(35, 5, 'JI-00035', 'WEERAN SHANTHI', '857895231V', 'NO:104/2/M,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0754519293', '', '100.jpg', '100.jpg'),
(36, 5, 'JI-00036', 'SINGAKKARAGE KAMALAWATHI  FERNANDO', '635093889V', 'NO:105,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0763239520', '', '100.jpg', '100.jpg'),
(37, 5, 'JI-00037', 'FILISHIYA FERNANDO', '766503551V', 'NO:68/34,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0774184508', '', '100.jpg', '100.jpg'),
(38, 5, 'JI-00038', 'MAWUNT BATON DILRUKSHIKA UDAYAKUMARI', '865204272V', 'NO:128/59,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0769648043', '', '100.jpg', '100.jpg'),
(39, 5, 'JI-00039', 'WEERAN VIJAYA LECHCHAMI', '818185286V', 'NO:128/61/A8,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0712779398', '', '100.jpg', '100.jpg'),
(40, 5, 'JI-00040', 'RAJAN ANUSHIYA', '708211958V', 'NO:128/23,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0779602789', '', '100.jpg', '100.jpg'),
(41, 5, 'JI-00041', 'SHANTHINI CRISTOPER', '828241028V', 'NO:128/24,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0764477334', '', '100.jpg', '100.jpg'),
(42, 5, 'JI-00042', 'ARUMUGAM KALYANI', '198462900419', 'NO:36/11,SRI SIDDHARTHA RD ', 'KIRULAPONA', 'COLOMBO 05', '0758588229', '', '100.jpg', '100.jpg'),
(43, 5, 'JI-00043', 'RAMAIYA KALI AMMA', '746612109V', 'NO:36/11/A,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0769431818', '', '100.jpg', '100.jpg'),
(44, 5, 'JI-00044', 'KISNAN SUBASINI', '876114976V', 'NO:128/6/A/3,SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0741903114', '', '100.jpg', '100.jpg'),
(45, 5, 'JI-00045', 'RATHNAM SEENI AMMA', '665443620V', 'NO:46/14/C,SOMADEWI PLACE', 'KIRULAPONA', 'COLOMBO 05', '0752131689', '', '100.jpg', '100.jpg'),
(46, 5, 'JI-00046', 'WAHALA THANTHRILAGE HASITHA DUSHANTHI PERERA', '936483011V', 'NO:157/1,SRI SIDDHARTHA RD', 'KIRULAPONA', 'COLOMBO 05', '0786288983', '', '100.jpg', '100.jpg'),
(47, 5, 'JI-00047', 'YODA PEDIGE NIROSHIKA', '839304056V', 'NO:46/18,SOMADEWI PLACE', 'KIRULAPONA', 'COLOMBO 05', '0768827484', '', '100.jpg', '100.jpg'),
(48, 4, 'JI-00048', 'RAMANADAN MERI SWARNALATHA', '766731678V', 'NO:10/63,SRI KALYANI GANGARAMA RD', 'MATTAKKULIYA', 'COLOMBO 15', '0771877594', '', '100.jpg', '100.jpg'),
(49, 1, 'JI-00049', 'DINUSHA HARSHANI', '885173888V', 'a', '', '', '0766889516', '', '100.jpg', '100.jpg'),
(50, 4, 'JI-00050', 'SEYINUL ABIDEEN SITHTHI NASEEMA', '656882611V', 'NO:10/64/A,SRI KALYANI GANGARAMA MW', 'MATTAKKULIYA', 'COLOMBO 15', '0764146093', '', '100.jpg', '100.jpg'),
(51, 4, 'JI-00051', 'ANWAR FATHIMA NIROSHA', '806962481V', 'NO:45/6F6,SRI KALYANI GANGARAMA MW', 'MATTAKKULIYA', 'COLOMBO 15', '0764202519', '', '100.jpg', '100.jpg'),
(52, 4, 'JI-00052', 'WADISINHAGE NISHANTHI SAYONARA DE SILVA', '197661710016', 'NO:37/10,SRI KALYANI GANGARAMA MW', 'MATTAKKULIYA', 'COLOMBO 15', '0769867077', '', '100.jpg', '100.jpg'),
(53, 1, 'JI-00053', 'YASHODA DANDAMALI', '', '', '', '', '077-54434', '', '100.jpg', '100.jpg'),
(54, 1, 'JI-00054', 'G.PRIYANTHI DIAS', '655883746V', 'NO:62/18,YOGASHRAMA MW', 'THELAWALA', 'MOUNT LV', '07754434', '', '100.jpg', '100.jpg'),
(55, 2, 'JI-00055', 'GANGODAWILAGE  CHANDRA PRIYANGANI DABARE ', '196773601190', 'NO:191/C2,GODALLAWATHTHA,DEWALA ROAD', 'THALANGAMA SOUTH', 'KOSWATTA', '0701379345', '', '100.jpg', '100.jpg'),
(56, 2, 'JI-00056', 'SHIYANI HEWAWITHARANA', '816440971V', 'NO:190,GODALLAWAWATHTHA', 'THALANGAMA SOUTH', 'KOSWATTA', '0789445632', '', '100.jpg', '100.jpg'),
(57, 2, 'JI-00057', 'WEERAKOONGE CHAMIKA JANANI', '866612099V', 'NO:190/A4,GODALLAWATHTHA', 'THALANGAMA SOUTH', '', '0761804430', '', '100.jpg', '100.jpg'),
(58, 3, 'JI-00058', 'YASHODA SANDAMALI', '655883747V', 'NO:62/18,YOGASHRAMA MW', 'THELAWALA', 'MOUNT LV', '0763887663', '0766104989', '100.jpg', '100.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_no` int(7) NOT NULL,
  `loanID` varchar(100) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `centerID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `loanType` varchar(10) NOT NULL DEFAULT 'weekly',
  `contractNo` varchar(50) NOT NULL,
  `loanAmt` double(10,2) NOT NULL,
  `terms` int(11) NOT NULL,
  `interestRate` double(10,2) NOT NULL,
  `rental` double(10,2) NOT NULL,
  `daily_rental` decimal(10,2) NOT NULL,
  `totalAmt` decimal(10,2) NOT NULL,
  `inspectionDate` varchar(20) NOT NULL,
  `disburseDate` varchar(20) NOT NULL,
  `gurantee1Name` varchar(250) NOT NULL,
  `gurantee1NIC` varchar(100) NOT NULL,
  `gurantee1ContactNo` varchar(100) NOT NULL,
  `gurantee1ad1` varchar(200) NOT NULL,
  `gurantee1ad2` varchar(200) NOT NULL,
  `gurantee2Name` varchar(250) NOT NULL,
  `gurantee2NIC` varchar(100) NOT NULL,
  `gurantee2ContactNo` varchar(100) NOT NULL,
  `gurantee2ad1` varchar(200) NOT NULL,
  `gurantee2ad2` varchar(200) NOT NULL,
  `loanStep` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `reason` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_no`, `loanID`, `branch`, `centerID`, `customerID`, `loanType`, `contractNo`, `loanAmt`, `terms`, `interestRate`, `rental`, `daily_rental`, `totalAmt`, `inspectionDate`, `disburseDate`, `gurantee1Name`, `gurantee1NIC`, `gurantee1ContactNo`, `gurantee1ad1`, `gurantee1ad2`, `gurantee2Name`, `gurantee2NIC`, `gurantee2ContactNo`, `gurantee2ad1`, `gurantee2ad2`, `loanStep`, `status`, `reason`) VALUES
(1, 'LON-00059', 'Nugegoda', 6, 1, 'weekly', 'SA00001', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-03-03', '2021-03-25', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(2, 'LON-00002', 'Nugegoda', 2, 57, 'monthly', 'KS00002', 101150.00, 96, 6.50, 10789.00, '360.00', '258944.00', '2021-05-01', '2021-05-01', '', '', '', '', '', '', '', '', '', '', 4, 1, ''),
(3, 'LON-00003', 'Nugegoda', 2, 56, 'weekly', 'KS00003', 98200.00, 36, 3.50, 3587.00, '479.00', '129133.00', '2021-01-20', '2021-01-20', '', '', '', '', '', '', '', '', '', '', 4, 1, ''),
(4, 'LON-00004', 'Nugegoda', 2, 55, 'weekly', 'KS00004', 25000.00, 12, 11.50, 2802.00, '374.00', '33625.00', '2020-02-28', '2020-02-28', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(5, 'LON-00005', 'Nugegoda', 4, 52, 'weekly', 'MT00005', 30000.00, 16, 10.00, 2625.00, '350.00', '42000.00', '2021-02-01', '2021-02-01', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(6, 'LON-00006', 'Nugegoda', 4, 51, 'weekly', 'MT00006', 30000.00, 16, 10.00, 2625.00, '350.00', '42000.00', '2021-02-01', '2021-02-01', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(7, 'LON-00007', 'Nugegoda', 4, 49, 'weekly', 'MT00007', 100000.00, 48, 3.34, 2917.00, '389.00', '140020.00', '2020-09-05', '2020-09-05', '', '', '', '', '', '', '', '', '', '', 4, 1, ''),
(8, 'LON-00008', 'Nugegoda', 4, 48, 'weekly', 'MT00008', 20000.00, 12, 11.50, 2242.00, '299.00', '26900.00', '2020-08-01', '2020-08-01', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(9, 'LON-00009', 'Nugegoda', 4, 50, 'weekly', 'MT00009', 30000.00, 16, 10.00, 2625.00, '350.00', '42000.00', '2021-02-02', '2021-02-02', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(10, 'LON-00010', 'Nugegoda', 5, 22, 'weekly', 'SA00010', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(11, 'LON-00011', 'Nugegoda', 5, 23, 'weekly', 'SA00011', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(12, 'LON-00012', 'Nugegoda', 5, 24, 'weekly', 'SA00012', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(13, 'LON-00013', 'Nugegoda', 5, 25, 'weekly', 'SA00013', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(14, 'LON-00014', 'Nugegoda', 5, 26, 'weekly', 'SA00014', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(15, 'LON-00015', 'Nugegoda', 5, 27, 'weekly', 'SA00015', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(16, 'LON-00016', 'Nugegoda', 5, 28, 'weekly', 'SA00016', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(17, 'LON-00017', 'Nugegoda', 5, 29, 'weekly', 'SA00017', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(18, 'LON-00018', 'Nugegoda', 5, 30, 'weekly', 'SA00018', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(19, 'LON-00019', 'Nugegoda', 5, 31, 'weekly', 'SA00019', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(20, 'LON-00020', 'Nugegoda', 5, 32, 'weekly', 'MT00020', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(21, 'LON-00021', 'Nugegoda', 5, 33, 'weekly', 'SA00021', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(23, 'LON-00023', 'Nugegoda', 5, 34, 'weekly', 'SA00023', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(24, 'LON-00024', 'Nugegoda', 5, 35, 'weekly', 'SA00024', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-30', '2021-04-30', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(25, 'LON-00025', 'Nugegoda', 5, 36, 'weekly', 'SA00025', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(26, 'LON-00026', 'Nugegoda', 5, 37, 'weekly', 'SA00026', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(27, 'LON-00027', 'Nugegoda', 5, 38, 'weekly', 'SA00027', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(28, 'LON-00028', 'Nugegoda', 5, 39, 'weekly', 'SA00028', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(29, 'LON-00029', 'Nugegoda', 5, 40, 'weekly', 'SA00029', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(30, 'LON-00030', 'Nugegoda', 5, 41, 'weekly', 'SA00030', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(31, 'LON-00031', 'Nugegoda', 5, 42, 'weekly', 'SA00031', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(32, 'LON-00032', 'Nugegoda', 5, 43, 'weekly', 'SA00032', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(33, 'LON-00033', 'Nugegoda', 5, 44, 'weekly', 'SA00033', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(34, 'LON-00034', 'Nugegoda', 5, 45, 'weekly', 'SA00034', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(35, 'LON-00035', 'Nugegoda', 5, 46, 'weekly', 'SA00035', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(36, 'LON-00036', 'Nugegoda', 5, 47, 'weekly', 'SA00036', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-06', '2021-08-06', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(37, 'LON-00037', 'Nugegoda', 6, 2, 'weekly', 'SA00037', 50000.00, 16, 10.00, 4375.00, '584.00', '70000.00', '2021-03-23', '2021-03-23', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(38, 'LON-00038', 'Nugegoda', 6, 3, 'weekly', 'SA00038', 15000.00, 12, 10.00, 1625.00, '217.00', '19500.00', '2021-04-08', '2021-04-08', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(39, 'LON-00039', 'Nugegoda', 6, 4, 'weekly', 'SA00039', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-08', '2021-04-08', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(40, 'LON-00040', 'Nugegoda', 6, 5, 'weekly', 'SA00040', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2121-04-08', '2021-04-08', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(41, 'LON-00041', 'Nugegoda', 6, 6, 'weekly', 'SA00041', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-08', '2021-04-08', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(42, 'LON-00042', 'Nugegoda', 6, 7, 'weekly', 'SA00042', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-08', '2021-04-08', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(43, 'LON-00043', 'Nugegoda', 6, 8, 'weekly', 'SA00043', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-04-09', '2021-04-09', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(44, 'LON-00044', 'Nugegoda', 6, 9, 'weekly', 'SA00044', 50000.00, 16, 10.00, 4375.00, '584.00', '70000.00', '2021-04-23', '2021-04-23', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(45, 'LON-00045', 'Nugegoda', 6, 10, 'weekly', 'SA00045', 50000.00, 16, 10.00, 4375.00, '584.00', '70000.00', '2021-04-23', '2021-04-23', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(46, 'LON-00046', 'Nugegoda', 6, 11, 'weekly', 'SA00046', 20000.00, 16, 10.00, 1750.00, '234.00', '28000.00', '2021-08-05', '2021-08-05', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(47, 'LON-00047', 'Nugegoda', 6, 12, 'weekly', 'SA00047', 20000.00, 16, 10.00, 1750.00, '234.00', '28000.00', '2021-08-05', '2021-08-05', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(48, 'LON-00048', 'Nugegoda', 6, 13, 'weekly', 'SA00048', 30000.00, 20, 10.00, 2250.00, '300.00', '45000.00', '2021-08-12', '2021-08-12', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(49, 'LON-00049', 'Nugegoda', 6, 14, 'weekly', 'SA00049', 30000.00, 20, 10.00, 2250.00, '300.00', '45000.00', '2021-08-12', '2021-08-12', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(50, 'LON-00050', 'Nugegoda', 6, 15, 'weekly', 'SA00050', 30000.00, 20, 10.00, 2250.00, '300.00', '45000.00', '2021-08-12', '2021-08-12', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(51, 'LON-00051', 'Nugegoda', 6, 16, 'weekly', 'SA00051', 30000.00, 20, 10.00, 2250.00, '300.00', '45000.00', '2021-08-12', '2021-08-12', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(53, 'LON-00052', 'Nugegoda', 6, 17, 'weekly', 'SA00052', 30000.00, 20, 10.00, 2250.00, '300.00', '45000.00', '2021-08-12', '2021-08-12', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(54, 'LON-00054', 'Nugegoda', 6, 18, 'weekly', 'SA00054', 30000.00, 20, 10.00, 2250.00, '300.00', '45000.00', '2021-08-12', '2021-08-12', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(60, 'LON-00060', 'Nugegoda', 6, 19, 'weekly', 'SA00060', 30000.00, 20, 10.00, 2250.00, '300.00', '45000.00', '2021-08-12', '2021-08-12', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(61, 'LON-00061', 'Nugegoda', 6, 20, 'weekly', 'SA00061', 25000.00, 16, 10.00, 2188.00, '292.00', '35000.00', '2021-08-12', '2021-08-12', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(62, 'LON-00062', 'Nugegoda', 6, 21, 'weekly', 'SA00062', 20000.00, 16, 10.00, 1750.00, '234.00', '28000.00', '2021-08-12', '2021-08-12', '', '', '', '', '', '', '', '', '', '', 3, 1, ''),
(63, 'LON-00063', 'Nugegoda', 3, 54, 'weekly', 'TE00063', 25000.00, 12, 11.50, 2802.00, '374.00', '33625.00', '2020-01-04', '2020-01-04', '', '', '', '', '', '', '', '', '', '', 2, 1, ''),
(64, 'LON-00064', 'Nugegoda', 3, 58, 'weekly', 'TE00064', 25000.00, 12, 11.50, 2802.00, '374.00', '0.00', '2021-01-14', '2021-01-14', 'AA', 'AA', '324', '231', '3213', '231', '2313', '2131', '321', '3213', 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `loan_installement`
--

CREATE TABLE `loan_installement` (
  `id` int(7) NOT NULL,
  `collectionID` int(11) NOT NULL,
  `li_date` varchar(25) NOT NULL,
  `paid` double(10,2) NOT NULL DEFAULT '0.00',
  `arrears` double(10,2) NOT NULL,
  `outstanding` decimal(10,2) NOT NULL DEFAULT '0.00',
  `loanNo` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_installement`
--

INSERT INTO `loan_installement` (`id`, `collectionID`, `li_date`, `paid`, `arrears`, `outstanding`, `loanNo`) VALUES
(1, 4, '2021-08-27', 26400.00, 18860.00, '8600.00', 1),
(2, 4, '2021-08-27', 0.00, 0.00, '70000.00', 37),
(3, 4, '2021-08-27', 0.00, 0.00, '19500.00', 38),
(4, 4, '2021-08-27', 0.00, 0.00, '35000.00', 39),
(5, 4, '2021-08-27', 0.00, 0.00, '35000.00', 40),
(6, 4, '2021-08-27', 0.00, 0.00, '35000.00', 41),
(7, 4, '2021-08-27', 0.00, 0.00, '35000.00', 42),
(8, 4, '2021-08-27', 0.00, 0.00, '35000.00', 43),
(9, 4, '2021-08-27', 0.00, 0.00, '70000.00', 44),
(10, 4, '2021-08-27', 0.00, 0.00, '70000.00', 45),
(11, 4, '2021-08-27', 0.00, 0.00, '28000.00', 46),
(12, 4, '2021-08-27', 0.00, 0.00, '28000.00', 47),
(13, 4, '2021-08-27', 0.00, 0.00, '45000.00', 48),
(14, 4, '2021-08-27', 0.00, 0.00, '45000.00', 49),
(15, 4, '2021-08-27', 0.00, 0.00, '45000.00', 50),
(16, 4, '2021-08-27', 0.00, 0.00, '45000.00', 51),
(17, 4, '2021-08-27', 0.00, 0.00, '45000.00', 52),
(18, 4, '2021-08-27', 0.00, 0.00, '45000.00', 53),
(19, 4, '2021-08-27', 0.00, 0.00, '45000.00', 54),
(20, 4, '2021-08-27', 0.00, 0.00, '45000.00', 55),
(21, 4, '2021-08-27', 0.00, 0.00, '45000.00', 56),
(22, 4, '2021-08-27', 0.00, 0.00, '45000.00', 57),
(23, 4, '2021-08-27', 0.00, 0.00, '45000.00', 58),
(24, 4, '2021-08-27', 0.00, 0.00, '45000.00', 59),
(25, 4, '2021-08-27', 0.00, 0.00, '45000.00', 60),
(26, 4, '2021-08-27', 0.00, 0.00, '35000.00', 61),
(27, 4, '2021-08-27', 0.00, 0.00, '28000.00', 62),
(28, 5, '2021-08-27', 42700.00, -220.00, '216244.00', 2),
(29, 5, '2021-08-27', 50559.00, 54342.00, '78574.00', 3),
(30, 5, '2021-08-27', 22800.00, 181404.00, '10825.00', 4),
(31, 6, '2021-08-27', 0.00, 18860.00, '8600.00', 1),
(32, 6, '2021-08-27', 55200.00, -55200.00, '14800.00', 37),
(33, 6, '2021-08-27', 16500.00, -16500.00, '3000.00', 38),
(34, 6, '2021-08-27', 26400.00, -26400.00, '8600.00', 39),
(35, 6, '2021-08-27', 26400.00, -26400.00, '8600.00', 40),
(36, 6, '2021-08-27', 24200.00, -24200.00, '10800.00', 41),
(37, 6, '2021-08-27', 26400.00, -26400.00, '8600.00', 42),
(38, 6, '2021-08-27', 26400.00, -26400.00, '8600.00', 43),
(39, 6, '2021-08-27', 48400.00, -48400.00, '21600.00', 44),
(40, 6, '2021-08-27', 39600.00, -39600.00, '30400.00', 45),
(41, 6, '2021-08-27', 3500.00, -3500.00, '24500.00', 46),
(42, 6, '2021-08-27', 3500.00, -3500.00, '24500.00', 47),
(43, 6, '2021-08-27', 2250.00, -2250.00, '42750.00', 48),
(44, 6, '2021-08-27', 2250.00, -2250.00, '42750.00', 49),
(45, 6, '2021-08-27', 2250.00, -2250.00, '42750.00', 50),
(46, 6, '2021-08-27', 2250.00, -2250.00, '42750.00', 51),
(47, 6, '2021-08-27', 2250.00, -2250.00, '42750.00', 53),
(48, 6, '2021-08-27', 2250.00, -2250.00, '42750.00', 54),
(49, 6, '2021-08-27', 0.00, 0.00, '45000.00', 60),
(50, 6, '2021-08-27', 2200.00, -2200.00, '32800.00', 61),
(51, 6, '2021-08-27', 1750.00, -1750.00, '26250.00', 62),
(52, 7, '2021-08-27', 15400.00, 19348.00, '19600.00', 10),
(53, 7, '2021-08-27', 22000.00, 12748.00, '13000.00', 11),
(54, 7, '2021-08-27', 19800.00, 14948.00, '15200.00', 12),
(55, 7, '2021-08-27', 17600.00, 17148.00, '17400.00', 13),
(56, 7, '2021-08-27', 22000.00, 12748.00, '13000.00', 14),
(57, 7, '2021-08-27', 22000.00, 12748.00, '13000.00', 15),
(58, 7, '2021-08-27', 20800.00, 13948.00, '14200.00', 16),
(59, 7, '2021-08-27', 22000.00, 12748.00, '13000.00', 17),
(60, 7, '2021-08-27', 19800.00, 14948.00, '15200.00', 18),
(61, 7, '2021-08-27', 19800.00, 14948.00, '15200.00', 19),
(62, 7, '2021-08-27', 18600.00, 16148.00, '16400.00', 20),
(63, 7, '2021-08-27', 19800.00, 14948.00, '15200.00', 21),
(64, 7, '2021-08-27', 19800.00, 14948.00, '15200.00', 23),
(65, 7, '2021-08-27', 19800.00, 14948.00, '15200.00', 24),
(66, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 25),
(67, 7, '2021-08-27', 2200.00, 3932.00, '32800.00', 26),
(68, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 27),
(69, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 28),
(70, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 29),
(71, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 30),
(72, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 31),
(73, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 32),
(74, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 33),
(75, 7, '2021-08-27', 2200.00, 3932.00, '32800.00', 34),
(76, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 35),
(77, 7, '2021-08-27', 4400.00, 1732.00, '30600.00', 36),
(99, 9, '2021-08-27', 39750.00, 32700.00, '2250.00', 5),
(100, 9, '2021-08-27', 37100.00, 35350.00, '4900.00', 6),
(101, 9, '2021-08-27', 54000.00, 84484.00, '86020.00', 7),
(102, 9, '2021-08-27', 20000.00, 96909.00, '6900.00', 8),
(103, 9, '2021-08-27', 34450.00, 37650.00, '7550.00', 9),
(104, 10, '2021-08-27', 0.00, 32700.00, '2250.00', 5),
(105, 10, '2021-08-27', 0.00, 35350.00, '4900.00', 6),
(106, 10, '2021-08-27', 200.00, 84284.00, '85820.00', 7),
(107, 10, '2021-08-27', 0.00, 96909.00, '6900.00', 8),
(108, 10, '2021-08-27', 0.00, 37650.00, '7550.00', 9),
(109, 11, '2021-08-27', 5700.00, 219074.00, '27925.00', 63),
(110, 11, '2021-08-27', 8550.00, 75600.00, '25075.00', 64);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `bank` double(10,2) NOT NULL,
  `textOther1` varchar(250) NOT NULL,
  `other1` double(10,2) NOT NULL,
  `textOther2` varchar(250) NOT NULL,
  `other2` double(10,2) NOT NULL,
  `textOther3` varchar(250) NOT NULL,
  `other3` decimal(10,2) NOT NULL,
  `textOther4` varchar(250) NOT NULL,
  `other4` decimal(10,2) NOT NULL,
  `textOther5` varchar(250) NOT NULL,
  `other5` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `bank`, `textOther1`, `other1`, `textOther2`, `other2`, `textOther3`, `other3`, `textOther4`, `other4`, `textOther5`, `other5`) VALUES
(1, 100.00, 'A', 110.00, 'B', 10.00, 'C', '10.00', 'D', '10.00', 'FA', '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `summary`
--

CREATE TABLE `summary` (
  `id` int(11) NOT NULL,
  `year` varchar(500) NOT NULL,
  `month` varchar(500) NOT NULL,
  `loanAMT` decimal(18,2) NOT NULL DEFAULT '0.00',
  `debtAMT` decimal(18,2) NOT NULL DEFAULT '0.00',
  `createDate` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `summary`
--

INSERT INTO `summary` (`id`, `year`, `month`, `loanAMT`, `debtAMT`, `createDate`) VALUES
(1, '2021', '06', '155000.00', '34962.00', '2021-06-16'),
(2, '2021', '01', '0.00', '0.00', '2021-06-16'),
(3, '2021', '02', '0.00', '0.00', '2021-06-16'),
(4, '2021', '03', '0.00', '0.00', '2021-06-16'),
(5, '2021', '04', '0.00', '0.00', '2021-06-16'),
(6, '2021', '05', '0.00', '0.00', '2021-06-16'),
(7, '2021', '07', '0.00', '0.00', '2021-06-16'),
(8, '2021', '08', '2173700.00', '983759.00', '2021-06-16'),
(9, '2021', '09', '0.00', '2200.00', '2021-06-16'),
(10, '2021', '10', '0.00', '0.00', '2021-06-16'),
(11, '2021', '11', '0.00', '0.00', '2021-06-16'),
(12, '2021', '12', '0.00', '0.00', '2021-06-16');

-- --------------------------------------------------------

--
-- Table structure for table `temp_collection`
--

CREATE TABLE `temp_collection` (
  `id` int(11) NOT NULL,
  `loan_no` int(11) NOT NULL,
  `contractNo` varchar(100) NOT NULL,
  `customerID` int(11) NOT NULL,
  `loanAmt` decimal(10,2) NOT NULL,
  `Arrears` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `payable` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_collection`
--

INSERT INTO `temp_collection` (`id`, `loan_no`, `contractNo`, `customerID`, `loanAmt`, `Arrears`, `balance`, `payable`, `paid`) VALUES
(1, 5, 'MT00005', 52, '30000.00', '32700.00', '2250.00', '2625.00', '0.00'),
(2, 6, 'MT00006', 51, '30000.00', '35350.00', '4900.00', '2625.00', '0.00'),
(3, 7, 'MT00007', 49, '100000.00', '84284.00', '85820.00', '2917.00', '0.00'),
(4, 8, 'MT00008', 48, '20000.00', '96909.00', '6900.00', '2242.00', '0.00'),
(5, 9, 'MT00009', 50, '30000.00', '37650.00', '7550.00', '2625.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `temp_data`
--

CREATE TABLE `temp_data` (
  `id` int(7) NOT NULL,
  `li_date` varchar(25) NOT NULL,
  `paid` double(10,2) NOT NULL DEFAULT '0.00',
  `arrears` double(10,2) NOT NULL DEFAULT '0.00',
  `total_paid` double(10,2) NOT NULL DEFAULT '0.00',
  `outstanding` decimal(10,2) NOT NULL DEFAULT '0.00',
  `loanNo` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10000) NOT NULL,
  `user_role` int(5) NOT NULL,
  `center_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `user_role`, `center_id`) VALUES
(1, 'Nmc', '21232f297a57a5a743894a0e4a801fc3', 0, 0),
(2, 'sa', '698d51a19d8a121ce581499d7b701668', 1, 1),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `center`
--
ALTER TABLE `center`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_no`);

--
-- Indexes for table `loan_installement`
--
ALTER TABLE `loan_installement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `summary`
--
ALTER TABLE `summary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_collection`
--
ALTER TABLE `temp_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_data`
--
ALTER TABLE `temp_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `center`
--
ALTER TABLE `center`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `loan_no` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `loan_installement`
--
ALTER TABLE `loan_installement`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `summary`
--
ALTER TABLE `summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `temp_collection`
--
ALTER TABLE `temp_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `temp_data`
--
ALTER TABLE `temp_data`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
