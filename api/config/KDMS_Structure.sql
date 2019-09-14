-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 25, 2019 at 08:34 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `KDMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `Accommodation_Availability`
--

DROP TABLE IF EXISTS `Accommodation_Availability`;
CREATE TABLE `Accommodation_Availability` (
  `Accomodation_Key` varchar(5) NOT NULL,
  `Allocated_Count` int(11) NOT NULL DEFAULT '0' COMMENT 'How many people already accommodate at the location',
  `Reserved_Count` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of spaces reserved/blocked',
  `Out_of_Availability_Count` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of spaces that cannot be allocated for any reason',
  `Available_Count` int(11) NOT NULL DEFAULT '0' COMMENT 'Accomodation_Master.Accomodation_Capacity - (reserved_count + Out_of_Availability_Count)',
  `Availability_Update_Date_Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time of Creation/modification of availability record',
  `Availability_Updated_By` varchar(10) DEFAULT NULL COMMENT 'UserID of the logged in user at the time of availability record creation/modification'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Accommodation_Master`
--

DROP TABLE IF EXISTS `Accommodation_Master`;
CREATE TABLE `Accommodation_Master` (
  `Accomodation_Key` varchar(5) NOT NULL,
  `Accomodation_Name` varchar(100) NOT NULL,
  `Accomodation_Capacity` int(11) NOT NULL DEFAULT '0' COMMENT 'Maximum number of people that can be accomodated ',
  `Accomodation_Update_Date_Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time of Creation/modification of Accomodation record',
  `Accomodation_Updated_By` varchar(10) NOT NULL COMMENT 'UserID of the logged in user at the time of Accomodation record creation/modification'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Amenities_Allocation_Log`
--

DROP TABLE IF EXISTS `Amenities_Allocation_Log`;
CREATE TABLE `Amenities_Allocation_Log` (
  `Amenity_Key` varchar(5) NOT NULL,
  `Devotee_Key` varchar(10) NOT NULL,
  `Amenity_Quantity` int(11) NOT NULL,
  `Amenity_Action` varchar(20) NOT NULL,
  `Amenity_Action_Year` varchar(4) DEFAULT NULL,
  `Amenity_Action_By` varchar(10) NOT NULL,
  `Amenity_Action_Date_Time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Amenities_Availability`
--

DROP TABLE IF EXISTS `Amenities_Availability`;
CREATE TABLE `Amenities_Availability` (
  `Amenity_Key` varchar(5) NOT NULL,
  `Allocated_Count` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of pieces are allocated',
  `Reserved_Count` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of pieces reserved/blocked',
  `Out_of_Availability_Count` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of pieces that cannot be allocated for any reason (lost/damaged)',
  `Available_Count` int(11) NOT NULL DEFAULT '0' COMMENT 'Pieces available to allocate',
  `Availability_Update_Date_Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time of Creation/modification of availability record',
  `Availability_Updated_By` varchar(10) DEFAULT NULL COMMENT 'UserID of the logged in user at the time of availability record creation/modification'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Amenity_Master`
--

DROP TABLE IF EXISTS `Amenity_Master`;
CREATE TABLE `Amenity_Master` (
  `Amenity_Key` varchar(5) NOT NULL,
  `Amenity_Name` varchar(30) NOT NULL COMMENT 'Bedsheet, Mattress, Blanket, Bucket, Mug, Permanent Card, other etc',
  `Amenity_Status` varchar(20) DEFAULT NULL COMMENT 'Available/unavailable for allocation',
  `Amenity_Quantity` int(11) NOT NULL,
  `Amenity_Record_Update_Date_Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time of Creation/modification of amenity',
  `Amenity_Record_Upated_by` int(11) DEFAULT NULL COMMENT 'UserID of the logged in user at the time of amenity creation/modification'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Card_Print_Log`
--

DROP TABLE IF EXISTS `Card_Print_Log`;
CREATE TABLE `Card_Print_Log` (
  `Devotee_Key` varchar(10) NOT NULL,
  `Print_Status` varchar(1) NOT NULL DEFAULT 'A',
  `Print_Requested_Date_Time` datetime DEFAULT NULL,
  `Print_Completion_Date_Time` datetime DEFAULT NULL,
  `Print_Requested_By_User` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Devotee`
--

DROP TABLE IF EXISTS `Devotee`;
CREATE TABLE `Devotee` (
  `Devotee_Key` varchar(10) NOT NULL,
  `Devotee_Type` varchar(30) DEFAULT NULL,
  `Devotee_First_Name` varchar(50) DEFAULT NULL,
  `Devotee_Last_Name` varchar(50) DEFAULT NULL,
  `Devotee_Gender` varchar(6) DEFAULT NULL,
  `Devotee_ID_Type` varchar(10) DEFAULT NULL COMMENT 'Permanent, Officer, Temporary, Day Visitor etc',
  `Devotee_ID_Number` varchar(50) DEFAULT NULL COMMENT 'Aadhar card, PAN card, Voter ID Card etc',
  `Devotee_Station` varchar(50) DEFAULT NULL COMMENT 'City of devotee',
  `Devotee_Cell_Phone_Number` varchar(20) DEFAULT NULL,
  `Devotee_Status` varchar(20) DEFAULT NULL COMMENT 'Active (currently in Kainchi), Inactive (not is Kainchi), Black_listed, Day Visit (visited for a day)',
  `Devotee_Remarks` varchar(250) DEFAULT NULL COMMENT 'Comments/notes (mandatory for blacklisted devotee)',
  `Devotee_Record_Update_Date_Time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time of Creation/modification of devotee record',
  `Devotee_Record_Updated_By` varchar(10) DEFAULT NULL COMMENT 'UserID of the logged in user at the time of devotee record creation/modification'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Devotee_Accomodation`
--

DROP TABLE IF EXISTS `Devotee_Accomodation`;
CREATE TABLE `Devotee_Accomodation` (
  `Accomodation_Key` varchar(5) NOT NULL,
  `Devotee_Key` varchar(10) NOT NULL,
  `Accomodation_Year` varchar(50) DEFAULT NULL COMMENT 'Year/festival for which accomodation was allocated ',
  `Arrival_Date_Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time accomodation was allocated/reserved for. It can be in future for reservations.',
  `Departure_Date_Time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time till when accomodation was allocated. It can be in future. A utility program/DB script should be created to close all the accomodation allocations.',
  `Accomodation_Status` varchar(10) NOT NULL COMMENT 'Allocated/departed',
  `Devotee_Accomodation_Update_Date_Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time of Creation/modification of devotee accomodation',
  `Devotee_Accomodation_Updated_By` varchar(10) DEFAULT NULL COMMENT 'UserID of the logged in user at the time of devotee accomodation creation/modification'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Devotee_Advanced`
--

DROP TABLE IF EXISTS `Devotee_Advanced`;
CREATE TABLE `Devotee_Advanced` (
  `Devotee_Key` varchar(10) NOT NULL,
  `Advanced_Field_Name` varchar(30) NOT NULL,
  `Advanced_Field_Value` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Devotee_Amenities_Allocation`
--

DROP TABLE IF EXISTS `Devotee_Amenities_Allocation`;
CREATE TABLE `Devotee_Amenities_Allocation` (
  `Amenity_Key` varchar(5) NOT NULL,
  `Devotee_Key` varchar(10) NOT NULL,
  `Amenity_Quantity` int(11) NOT NULL DEFAULT '0',
  `Amenity_Allocation_Year` varchar(5) DEFAULT NULL COMMENT 'Year/festival for which Amenity was allocated',
  `Amenity_Allocation_Status` varchar(10) NOT NULL COMMENT 'Issued/returned/Lost/damaged',
  `Amenity_Allocation_Date_Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time on which amenity was allocated',
  `Amenity_Allocated_By` int(11) DEFAULT NULL COMMENT 'UserID of the logged in user at the time of amenity allocation'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Devotee_ID`
--

DROP TABLE IF EXISTS `Devotee_ID`;
CREATE TABLE `Devotee_ID` (
  `Devotee_Key` varchar(10) NOT NULL,
  `Devotee_ID_Type` varchar(20) NOT NULL,
  `Devotee_ID_Image` longblob COMMENT 'Scanned image of Devotee_ID',
  `Devotee_ID_XML` text COMMENT 'XML generated from reading the QR',
  `Devotee_ID_Image_Update_Date_Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time of creation/modification of devotee ID Image'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Devotee_Photo`
--

DROP TABLE IF EXISTS `Devotee_Photo`;
CREATE TABLE `Devotee_Photo` (
  `Devotee_Key` varchar(10) NOT NULL,
  `Photo_type` varchar(10) DEFAULT NULL,
  `Devotee_Photo` longblob,
  `status` int(11) DEFAULT '1' COMMENT '0=inactive;1=active;',
  `Devotee_Photo_Update_Date_Time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time of creation/modification of devotee photo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Devotee_Photo_Old`
--

DROP TABLE IF EXISTS `Devotee_Photo_Old`;
CREATE TABLE `Devotee_Photo_Old` (
  `Devotee_Photo_ID` int(11) NOT NULL,
  `Devotee_Key` varchar(10) NOT NULL,
  `Photo_type` varchar(10) DEFAULT NULL,
  `Devotee_Photo` longblob,
  `status` int(11) DEFAULT '1' COMMENT '0=inactive;1=active;',
  `Devotee_Photo_Update_Date_Time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/Time of creation/modification of devotee photo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Duty_Location_Master`
--

DROP TABLE IF EXISTS `Duty_Location_Master`;
CREATE TABLE `Duty_Location_Master` (
  `Duty_Location_Key` varchar(10) NOT NULL,
  `Duty_Location_Name` varchar(30) NOT NULL,
  `Duty_Location_Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Duty_Position_Master`
--

DROP TABLE IF EXISTS `Duty_Position_Master`;
CREATE TABLE `Duty_Position_Master` (
  `Duty_Position_Key` varchar(10) NOT NULL,
  `Duty_Position_Name` varchar(30) NOT NULL,
  `Duty_Position_Description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Login_history`
--

DROP TABLE IF EXISTS `Login_history`;
CREATE TABLE `Login_history` (
  `User_key` varchar(10) NOT NULL,
  `Login_date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Logout_Date_Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Office_Duty`
--

DROP TABLE IF EXISTS `Office_Duty`;
CREATE TABLE `Office_Duty` (
  `Officer_Key` varchar(10) DEFAULT NULL,
  `Devotee_Key` varchar(10) NOT NULL,
  `Duty_Type` varchar(50) NOT NULL,
  `Duty_Position_Key` varchar(10) NOT NULL,
  `Duty_Location_Key` varchar(10) NOT NULL,
  `Duty_Year` varchar(50) NOT NULL,
  `Duty_Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User_access_log`
--

DROP TABLE IF EXISTS `User_access_log`;
CREATE TABLE `User_access_log` (
  `User_key` varchar(10) NOT NULL,
  `Devotee_Key` varchar(10) NOT NULL,
  `Access_date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User_Master`
--

DROP TABLE IF EXISTS `User_Master`;
CREATE TABLE `User_Master` (
  `User_Key` varchar(10) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `User_Email` varchar(50) DEFAULT NULL,
  `User_Password` varchar(50) DEFAULT NULL,
  `User_Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User_message`
--

DROP TABLE IF EXISTS `User_message`;
CREATE TABLE `User_message` (
  `User_key` varchar(10) NOT NULL,
  `Message_Type` varchar(20) NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Accommodation_Availability`
--
ALTER TABLE `Accommodation_Availability`
  ADD PRIMARY KEY (`Accomodation_Key`);

--
-- Indexes for table `Accommodation_Master`
--
ALTER TABLE `Accommodation_Master`
  ADD PRIMARY KEY (`Accomodation_Key`);

--
-- Indexes for table `Amenities_Availability`
--
ALTER TABLE `Amenities_Availability`
  ADD PRIMARY KEY (`Amenity_Key`);

--
-- Indexes for table `Amenity_Master`
--
ALTER TABLE `Amenity_Master`
  ADD PRIMARY KEY (`Amenity_Key`);

--
-- Indexes for table `Card_Print_Log`
--
ALTER TABLE `Card_Print_Log`
  ADD UNIQUE KEY `UniqueDevoteeStatus` (`Devotee_Key`,`Print_Status`);

--
-- Indexes for table `Devotee`
--
ALTER TABLE `Devotee`
  ADD PRIMARY KEY (`Devotee_Key`);

--
-- Indexes for table `Devotee_Accomodation`
--
ALTER TABLE `Devotee_Accomodation`
  ADD UNIQUE KEY `IndexUniqueDevoteeAccomodation` (`Accomodation_Key`,`Devotee_Key`,`Accomodation_Year`,`Accomodation_Status`,`Devotee_Accomodation_Update_Date_Time`) USING BTREE;

--
-- Indexes for table `Devotee_Advanced`
--
ALTER TABLE `Devotee_Advanced`
  ADD UNIQUE KEY `UniqueDevoteeAdvanced` (`Devotee_Key`,`Advanced_Field_Name`) USING BTREE;

--
-- Indexes for table `Devotee_Amenities_Allocation`
--
ALTER TABLE `Devotee_Amenities_Allocation`
  ADD UNIQUE KEY `UniquedevoteeAmenityAllocationForTheYear` (`Amenity_Key`,`Devotee_Key`,`Amenity_Allocation_Year`);

--
-- Indexes for table `Devotee_ID`
--
ALTER TABLE `Devotee_ID`
  ADD UNIQUE KEY `UniqueDevoteeID` (`Devotee_Key`) USING BTREE;

--
-- Indexes for table `Devotee_Photo`
--
ALTER TABLE `Devotee_Photo`
  ADD UNIQUE KEY `UniquePhotoIndex` (`Devotee_Key`,`Photo_type`);

--
-- Indexes for table `Devotee_Photo_Old`
--
ALTER TABLE `Devotee_Photo_Old`
  ADD PRIMARY KEY (`Devotee_Photo_ID`);

--
-- Indexes for table `Duty_Location_Master`
--
ALTER TABLE `Duty_Location_Master`
  ADD PRIMARY KEY (`Duty_Location_Key`);

--
-- Indexes for table `Duty_Position_Master`
--
ALTER TABLE `Duty_Position_Master`
  ADD PRIMARY KEY (`Duty_Position_Key`);

--
-- Indexes for table `User_Master`
--
ALTER TABLE `User_Master`
  ADD PRIMARY KEY (`User_Key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Devotee_Photo_Old`
--
ALTER TABLE `Devotee_Photo_Old`
  MODIFY `Devotee_Photo_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
