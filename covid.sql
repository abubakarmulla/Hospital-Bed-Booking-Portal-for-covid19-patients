SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coviddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookingpatient`
--

CREATE TABLE `bookingpatient` (
  `id` int(11) NOT NULL,
  `srfid` varchar(50) NOT NULL,
  `bedtype` varchar(50) NOT NULL,
  `hcode` varchar(50) NOT NULL,
  `spo2` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `pphone` varchar(12) NOT NULL,
  `paddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingpatient`
--

INSERT INTO `bookingpatient` (`id`, `srfid`, `bedtype`, `hcode`, `spo2`, `pname`, `pphone`, `paddress`) VALUES
(3, 'KA20210011', 'ICUBed', 'MAT123', 85, 'Ramesh', '9986786453', 'BANGALORE'),
(4, 'KA20210022', 'ICUBed', 'BBH01', 92, 'Rahul', '8088131784', 'banaglore ');

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldata`
--

CREATE TABLE `hospitaldata` (
  `id` int(11) NOT NULL,
  `hcode` varchar(200) NOT NULL,
  `hname` varchar(200) NOT NULL,
  `normalbed` int(11) NOT NULL,
  `hicubed` int(11) NOT NULL,
  `icubed` int(11) NOT NULL,
  `vbed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitaldata`
--

INSERT INTO `hospitaldata` (`id`, `hcode`, `hname`, `normalbed`, `hicubed`, `icubed`, `vbed`) VALUES
(3, 'MAT123', 'Matha Hospital', 40, 4, 4, 1);

--
-- Triggers `hospitaldata`
--
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `hospitaldata` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.hcode,NEW.normalbed,NEW.hicubed,NEW.icubed,NEW.vbed,' INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update` AFTER UPDATE ON `hospitaldata` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.hcode,NEW.normalbed,NEW.hicubed,NEW.icubed,NEW.vbed,' UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delet` BEFORE DELETE ON `hospitaldata` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.hcode,OLD.normalbed,OLD.hicubed,OLD.icubed,OLD.vbed,' DELETED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hospitaluser`
--

CREATE TABLE `hospitaluser` (
  `id` int(11) NOT NULL,
  `hcode` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitaluser`
--

INSERT INTO `hospitaluser` (`id`, `hcode`, `email`, `password`) VALUES
(7, 'BBH01', 'technicalme386@gmail.com', 'pbkdf2:sha256:260000$TC2Ps9TvfXonxkrF$1a22ed199145c82e79f7e412f4efdf23878f444cd3a56d6b31c456e6e6838094'); -- password = tech123

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 'Rahul'),
(2, 'Ramesh');

-- --------------------------------------------------------

--
-- Table structure for table `trig`
--

CREATE TABLE `trig` (
  `id` int(11) NOT NULL,
  `hcode` varchar(50) NOT NULL,
  `normalbed` int(11) NOT NULL,
  `hicubed` int(11) NOT NULL,
  `icubed` int(11) NOT NULL,
  `vbed` int(11) NOT NULL,
  `querys` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trig`
--

INSERT INTO `trig` (`id`, `hcode`, `normalbed`, `hicubed`, `icubed`, `vbed`, `querys`, `date`) VALUES
(1, 'BBH01', 50, 9, 2, 1, ' UPDATED', '2021-11-26'),
(2, 'BBH01', 50, 9, 2, 1, ' DELETED', '2021-11-26');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `srfid` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dob` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `srfid`, `email`, `dob`) VALUES
(9, 'KA20210011', 'abubakarmulla.web@gmail.com', 'pbkdf2:sha256:260000$X2eX8Bqgn8TenfnA$332ce6c1db6db76fc75d7405a53737e600c883fff3b5a956f5227ccb220b1d83'); -- 23-09-1990

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookingpatient`
--
ALTER TABLE `bookingpatient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `srfid` (`srfid`(20));

--
-- Indexes for table `hospitaldata`
--
ALTER TABLE `hospitaldata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hcode` (`hcode`);

--
-- Indexes for table `hospitaluser`
--
ALTER TABLE `hospitaluser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trig`
--
ALTER TABLE `trig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `srfid` (`srfid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookingpatient`
--
ALTER TABLE `bookingpatient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hospitaldata`
--
ALTER TABLE `hospitaldata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hospitaluser`
--
ALTER TABLE `hospitaluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trig`
--
ALTER TABLE `trig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
