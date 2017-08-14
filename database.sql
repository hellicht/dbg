-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2017 at 11:21 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `cityid` int(11) NOT NULL,
  `cityname` varchar(145) NOT NULL,
  `countries_countryid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`cityid`, `cityname`, `countries_countryid`) VALUES
(1, 'Narva', 1),
(2, 'Tallinn', 1),
(3, 'Riga', 2),
(4, 'Paris', 3),
(5, 'London', 4);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `countryid` int(11) NOT NULL,
  `countryname` varchar(145) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countryid`, `countryname`) VALUES
(1, 'Estonia'),
(2, 'Latvia'),
(3, 'France'),
(4, 'UK');

-- --------------------------------------------------------

--
-- Table structure for table `funding`
--

CREATE TABLE `funding` (
  `fundingid` int(11) NOT NULL,
  `funding` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `funding`
--

INSERT INTO `funding` (`fundingid`, `funding`) VALUES
(1, 'Erasmus+'),
(103, 'KUSK'),
(102, 'Norden'),
(104, 'Noorte kohtumine'),
(105, 'American Embassy ');

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

CREATE TABLE `organisations` (
  `organisationid` int(11) NOT NULL,
  `organisationname` varchar(225) NOT NULL,
  `organisationtype` enum('NGO','Other') DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `contactperson` varchar(45) DEFAULT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `comments` text,
  `cities_cityid` int(11) DEFAULT NULL,
  `cities_countries_countryid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organisations`
--

INSERT INTO `organisations` (`organisationid`, `organisationname`, `organisationtype`, `email`, `contactperson`, `contact`, `comments`, `cities_cityid`, `cities_countries_countryid`) VALUES
(1, 'main', 'NGO', NULL, NULL, NULL, NULL, 1, 1),
(2, 'partners', 'Other', 'info@yo.org', 'Ivan', '550090778', 'Youth exchange', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `organisations_has_projects`
--

CREATE TABLE `organisations_has_projects` (
  `organisations_organisationid` int(11) DEFAULT NULL,
  `projects_projectid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organisations_has_projects`
--

INSERT INTO `organisations_has_projects` (`organisations_organisationid`, `projects_projectid`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `projectid` int(11) NOT NULL,
  `projectnumber` varchar(200) DEFAULT NULL,
  `namepro` varchar(225) NOT NULL,
  `projectfrom` date DEFAULT NULL,
  `projectto` date DEFAULT NULL,
  `description` text,
  `projecttype_projecttypeid` int(11) DEFAULT NULL,
  `funding_fundingid` int(11) DEFAULT NULL,
  `cities_cityid` int(11) NOT NULL,
  `countryid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`projectid`, `projectnumber`, `namepro`, `projectfrom`, `projectto`, `description`, `projecttype_projecttypeid`, `funding_fundingid`, `cities_cityid`, `countryid`) VALUES
(1, '001', 'Summer Project', '2016-06-20', '2016-08-30', 'ongoing', 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projecttype`
--

CREATE TABLE `projecttype` (
  `projecttypeid` int(11) NOT NULL,
  `projecttype` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projecttype`
--

INSERT INTO `projecttype` (`projecttypeid`, `projecttype`) VALUES
(1, 'KA1 mobility project for higher education '),
(2, 'KA1 mobility project for VET learners and stuff'),
(102, 'KA1 mobility project for school staff'),
(103, 'KA1 mobility project for adult education staff'),
(104, 'KA1 Youth - Training course'),
(105, 'KA1 Youth - Seminar'),
(106, 'KA1 Youth - Partnership building activity'),
(107, 'KA1 Youth - Youth Exchange'),
(108, 'KA1 Youth - European Voluntary Service'),
(109, 'KA2 Strategic Partnership in the field of higher education'),
(110, 'KA2 Strategic Partnership in the youth field'),
(111, 'KA2 Transnational youth initiative'),
(112, 'KA3 Structure Dialogue Project'),
(113, 'local'),
(114, 'international');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`cityid`),
  ADD KEY `fk_cities_countries1_idx` (`countries_countryid`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countryid`);

--
-- Indexes for table `funding`
--
ALTER TABLE `funding`
  ADD PRIMARY KEY (`fundingid`);

--
-- Indexes for table `organisations`
--
ALTER TABLE `organisations`
  ADD PRIMARY KEY (`organisationid`),
  ADD KEY `fk_organisations_cities1_idx` (`cities_cityid`,`cities_countries_countryid`);

--
-- Indexes for table `organisations_has_projects`
--
ALTER TABLE `organisations_has_projects`
  ADD KEY `fk_organisations_has_projects_projects1_idx` (`projects_projectid`),
  ADD KEY `fk_organisations_has_projects_organisations1_idx` (`organisations_organisationid`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`projectid`),
  ADD KEY `fk_projects_projecttype1_idx` (`projecttype_projecttypeid`),
  ADD KEY `fk_projects_funding1_idx` (`funding_fundingid`),
  ADD KEY `fk_projects_cities1_idx` (`cities_cityid`);

--
-- Indexes for table `projecttype`
--
ALTER TABLE `projecttype`
  ADD PRIMARY KEY (`projecttypeid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `cityid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `countryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=905;
--
-- AUTO_INCREMENT for table `funding`
--
ALTER TABLE `funding`
  MODIFY `fundingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `organisations`
--
ALTER TABLE `organisations`
  MODIFY `organisationid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `projecttype`
--
ALTER TABLE `projecttype`
  MODIFY `projecttypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
