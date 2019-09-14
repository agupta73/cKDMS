DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_DEVOTEE`(IN `p_Devotee_Key` VARCHAR(10), IN `p_Devotee_Type` VARCHAR(30), IN `p_Devotee_First_Name` VARCHAR(50), IN `p_Devotee_Last_Name` VARCHAR(50), IN `p_Devotee_Gender` VARCHAR(6), IN `p_Devotee_ID_Type` VARCHAR(10), IN `p_Devotee_ID_Number` VARCHAR(50), IN `p_Devotee_Station` VARCHAR(50), IN `p_Devotee_Cell_Phone_Number` VARCHAR(15), IN `p_Devotee_Status` VARCHAR(20), IN `p_Devotee_Remarks` VARCHAR(250), IN `p_Devotee_Record_Updated_By` VARCHAR(10), IN `p_Devotee_Accommodation_ID` VARCHAR(10), IN `p_Devotee_Accomodation_Status` VARCHAR(10))
BEGIN

    INSERT INTO devotee(
        Devotee_Key,
        Devotee_Type,
        Devotee_First_Name,
        Devotee_Last_Name,
        Devotee_Gender,
        Devotee_ID_Type,
        Devotee_ID_Number,
        Devotee_Station,
        Devotee_Cell_Phone_Number,
        Devotee_Status,
        Devotee_Remarks,
        Devotee_Record_Update_Date_Time,
        Devotee_Record_Updated_By
    )
VALUES(
    p_Devotee_Key,
    p_Devotee_Type,
    p_Devotee_First_Name,
    p_Devotee_Last_Name,
    p_Devotee_Gender,
    p_Devotee_ID_Type,
    p_Devotee_ID_Number,
    p_Devotee_Station,
    p_Devotee_Cell_Phone_Number,
    p_Devotee_Status,
    p_Devotee_Remarks,
    NOW(),
    p_Devotee_Record_Updated_By
);

INSERT INTO Devotee_Accomodation(
    Accomodation_Key,
    Devotee_Key,
    Accomodation_Year,
    Arrival_Date_Time,
    Departure_Date_Time,
    Accomodation_Status,
    Devotee_Accomodation_Update_Date_Time,
    Devotee_Accomodation_Updated_By
)
VALUES(
    p_Devotee_Accommodation_ID,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Accomodation_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count + 1,
    Available_Count = Available_Count - 1
WHERE	
	Accomodation_Key = p_Devotee_Accommodation_ID;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_DEVOTEE_W_SEVA_I`(
	IN `p_Devotee_Key` VARCHAR(10), 
	IN `p_Devotee_Type` VARCHAR(30), 
	IN `p_Devotee_First_Name` VARCHAR(50), 
	IN `p_Devotee_Last_Name` VARCHAR(50), 
	IN `p_Devotee_Gender` VARCHAR(6), 
	IN `p_Devotee_ID_Type` VARCHAR(10), 
	IN `p_Devotee_ID_Number` VARCHAR(50), 
	IN `p_Devotee_Station` VARCHAR(50), 
	IN `p_Devotee_Cell_Phone_Number` VARCHAR(15), 
	IN `p_Devotee_Status` VARCHAR(20), 
	IN `p_Devotee_Remarks` VARCHAR(250), 
	IN `p_Devotee_Referral` VARCHAR(100), 
	IN `p_Devotee_Seva_Id` VARCHAR(6),
	IN `p_Devotee_Seva_Status` VARCHAR(10),
	IN `p_Devotee_Record_Updated_By` VARCHAR(10), 
	IN `p_Devotee_Accommodation_ID` VARCHAR(10), 
	IN `p_Devotee_Accomodation_Status` VARCHAR(10),
	IN `p_Devotee_Address_1` VARCHAR(100),
    IN `p_Devotee_Address_2` VARCHAR(100),
    IN `p_Devotee_State` VARCHAR(25),
    IN `p_Devotee_Zip` VARCHAR(12),
    IN `p_Devotee_Country` VARCHAR(20),
    IN `p_Comments`  VARCHAR(250),
    IN `p_Joined_Since`  VARCHAR(4)
	)
BEGIN

    INSERT INTO devotee(
        Devotee_Key,
        Devotee_Type,
        Devotee_First_Name,
        Devotee_Last_Name,
        Devotee_Gender,
        Devotee_ID_Type,
        Devotee_ID_Number,
        Devotee_Station,
        Devotee_Cell_Phone_Number,
        Devotee_Status,
        Devotee_Remarks,
        Devotee_Referral,
        Devotee_Record_Update_Date_Time,
        Devotee_Record_Updated_By,
    	Devotee_Address_1,
    	Devotee_Address_2,
    	Devotee_State,
    	Devotee_Zip,
    	Devotee_Country,
    	Comments,
    	Joined_Since
    )
VALUES(
    p_Devotee_Key,
    p_Devotee_Type,
    p_Devotee_First_Name,
    p_Devotee_Last_Name,
    p_Devotee_Gender,
    p_Devotee_ID_Type,
    p_Devotee_ID_Number,
    p_Devotee_Station,
    p_Devotee_Cell_Phone_Number,
    p_Devotee_Status,
    p_Devotee_Remarks,
    p_Devotee_Referral,
    NOW(),
    p_Devotee_Record_Updated_By,
	p_Devotee_Address_1,
    p_Devotee_Address_2,
    p_Devotee_State,
    p_Devotee_Zip,
    p_Devotee_Country,
    p_Comments,
    p_Joined_Since
);

INSERT INTO Devotee_Accomodation(
    Accomodation_Key,
    Devotee_Key,
    Accomodation_Year,
    Arrival_Date_Time,
    Departure_Date_Time,
    Accomodation_Status,
    Devotee_Accomodation_Update_Date_Time,
    Devotee_Accomodation_Updated_By
)
VALUES(
    p_Devotee_Accommodation_ID,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Accomodation_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count + 1,
    Available_Count = Available_Count - 1
WHERE	
	Accomodation_Key = p_Devotee_Accommodation_ID;

INSERT INTO `Devotee_Seva`(
	`Seva_ID`, 
	`Devotee_Key`, 
	`Seva_Year`, 
	`Assignment_Date_Time`, 
	`Release_Date_Time`, 
	`Seva_Status`, 
	`Devotee_Seva_Update_Date_Time`, 
	`Devotee_Seva_Updated_By`) 
VALUES (
    p_Devotee_Seva_Id,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Seva_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE `Seva_Availability` 
SET 
	`Assigned_Count`= `Assigned_Count` + 1,
	`Availability_Update_Date_Time`= NOW(),
	`Availability_Updated_By`= p_Devotee_Record_Updated_By 
WHERE Seva_Id = p_Devotee_Seva_ID;



END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_MANAGE_AMENITY`(
    IN `p_Devotee_Key` VARCHAR(10),
    IN `p_Amenity_Key` VARCHAR(10),
    IN `p_Amenity_Quantity` INT,
    IN `p_Amenity_Managed_By` VARCHAR(10)
)
BEGIN
    DECLARE
        v_past_amenity_quantity INT ; DECLARE v_amenity_action VARCHAR(20) ; 
        
        
    SELECT
        IFNULL(SUM(Amenity_Quantity),0)
    INTO v_past_amenity_quantity
FROM
    Devotee_Amenities_Allocation
WHERE
    Devotee_Key = p_Devotee_Key AND Amenity_Key = p_Amenity_Key AND Amenity_Allocation_Status = 'Allocated' AND Amenity_Allocation_Year = YEAR(NOW()) ;
REPLACE
INTO
	`Devotee_Amenities_Allocation`(
    `Amenity_Key`,
    `Devotee_Key`,
    `Amenity_Quantity`,
    `Amenity_Allocation_Year`,
    `Amenity_Allocation_Status`,
    `Amenity_Allocation_Date_Time`,
    `Amenity_Allocated_By`
)
VALUES(
    p_Amenity_Key,
    p_Devotee_Key,
    v_past_amenity_quantity + p_Amenity_Quantity,
    YEAR(NOW()), 'Allocated', NOW(), p_Amenity_Managed_By);
    
UPDATE
    Amenities_Availability
SET
    Allocated_Count = Allocated_Count + p_Amenity_Quantity,
    Available_Count = Available_Count - p_Amenity_Quantity
WHERE
    Amenity_Key = p_Amenity_Key ; 
    

IF p_Amenity_Quantity > 0 THEN
SET
    v_amenity_action = 'Allocated' ; ELSE
SET
    v_amenity_action = 'Returned' ;
    END IF ;
    
INSERT INTO `Amenities_Allocation_Log`(
    `Amenity_Key`,
    `Devotee_Key`,
    `Amenity_Quantity`,
    `Amenity_Action`,
    `Amenity_Action_Year`,
    `Amenity_Action_By`,
    `Amenity_Action_Date_Time`
)
VALUES(
    p_Amenity_Key,
    p_Devotee_Key,
    p_Amenity_Quantity,
    v_amenity_action,
    YEAR(NOW()),
    p_Amenity_Managed_By,
    NOW()) ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_DEVOTEE_I`(IN `p_Devotee_Key` VARCHAR(10), IN `p_Devotee_Type` VARCHAR(30), IN `p_Devotee_First_Name` VARCHAR(50), IN `p_Devotee_Last_Name` VARCHAR(50), IN `p_Devotee_Gender` VARCHAR(6), IN `p_Devotee_ID_Type` VARCHAR(10), IN `p_Devotee_ID_Number` VARCHAR(50), IN `p_Devotee_Station` VARCHAR(50), IN `p_Devotee_Cell_Phone_Number` VARCHAR(15), IN `p_Devotee_Status` VARCHAR(20), IN `p_Devotee_Remarks` VARCHAR(250), IN `p_Devotee_Referral` VARCHAR(100), IN `p_Devotee_Record_Updated_By` VARCHAR(10), IN `p_Devotee_Accommodation_ID` VARCHAR(10), IN `p_Devotee_Accomodation_Status` VARCHAR(10))
BEGIN

    INSERT INTO devotee(
        Devotee_Key,
        Devotee_Type,
        Devotee_First_Name,
        Devotee_Last_Name,
        Devotee_Gender,
        Devotee_ID_Type,
        Devotee_ID_Number,
        Devotee_Station,
        Devotee_Cell_Phone_Number,
        Devotee_Status,
        Devotee_Remarks,
        Devotee_Referral,
        Devotee_Record_Update_Date_Time,
        Devotee_Record_Updated_By
    )
VALUES(
    p_Devotee_Key,
    p_Devotee_Type,
    p_Devotee_First_Name,
    p_Devotee_Last_Name,
    p_Devotee_Gender,
    p_Devotee_ID_Type,
    p_Devotee_ID_Number,
    p_Devotee_Station,
    p_Devotee_Cell_Phone_Number,
    p_Devotee_Status,
    p_Devotee_Remarks,
    p_Devotee_Referral,
    NOW(),
    p_Devotee_Record_Updated_By
);

INSERT INTO Devotee_Accomodation(
    Accomodation_Key,
    Devotee_Key,
    Accomodation_Year,
    Arrival_Date_Time,
    Departure_Date_Time,
    Accomodation_Status,
    Devotee_Accomodation_Update_Date_Time,
    Devotee_Accomodation_Updated_By
)
VALUES(
    p_Devotee_Accommodation_ID,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Accomodation_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count + 1,
    Available_Count = Available_Count - 1
WHERE	
	Accomodation_Key = p_Devotee_Accommodation_ID;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_INSERT_DEVOTEE_W_SEVA`(
	IN `p_Devotee_Key` VARCHAR(10), 
	IN `p_Devotee_Type` VARCHAR(30), 
	IN `p_Devotee_First_Name` VARCHAR(50), 
	IN `p_Devotee_Last_Name` VARCHAR(50), 
	IN `p_Devotee_Gender` VARCHAR(6), 
	IN `p_Devotee_ID_Type` VARCHAR(10), 
	IN `p_Devotee_ID_Number` VARCHAR(50), 
	IN `p_Devotee_Station` VARCHAR(50), 
	IN `p_Devotee_Cell_Phone_Number` VARCHAR(15), 
	IN `p_Devotee_Status` VARCHAR(20), 
	IN `p_Devotee_Remarks` VARCHAR(250), 
	IN `p_Devotee_Referral` VARCHAR(100), 
	IN `p_Devotee_Seva_Id` VARCHAR(6),
	IN `p_Devotee_Seva_Status` VARCHAR(10),
	IN `p_Devotee_Record_Updated_By` VARCHAR(10), 
	IN `p_Devotee_Accommodation_ID` VARCHAR(10), 
	IN `p_Devotee_Accomodation_Status` VARCHAR(10)
	)
BEGIN

    INSERT INTO devotee(
        Devotee_Key,
        Devotee_Type,
        Devotee_First_Name,
        Devotee_Last_Name,
        Devotee_Gender,
        Devotee_ID_Type,
        Devotee_ID_Number,
        Devotee_Station,
        Devotee_Cell_Phone_Number,
        Devotee_Status,
        Devotee_Remarks,
        Devotee_Referral,
        Devotee_Record_Update_Date_Time,
        Devotee_Record_Updated_By
    )
VALUES(
    p_Devotee_Key,
    p_Devotee_Type,
    p_Devotee_First_Name,
    p_Devotee_Last_Name,
    p_Devotee_Gender,
    p_Devotee_ID_Type,
    p_Devotee_ID_Number,
    p_Devotee_Station,
    p_Devotee_Cell_Phone_Number,
    p_Devotee_Status,
    p_Devotee_Remarks,
    p_Devotee_Referral,
    NOW(),
    p_Devotee_Record_Updated_By
);

INSERT INTO Devotee_Accomodation(
    Accomodation_Key,
    Devotee_Key,
    Accomodation_Year,
    Arrival_Date_Time,
    Departure_Date_Time,
    Accomodation_Status,
    Devotee_Accomodation_Update_Date_Time,
    Devotee_Accomodation_Updated_By
)
VALUES(
    p_Devotee_Accommodation_ID,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Accomodation_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count + 1,
    Available_Count = Available_Count - 1
WHERE	
	Accomodation_Key = p_Devotee_Accommodation_ID;

INSERT INTO `Devotee_Seva`(
	`Seva_ID`, 
	`Devotee_Key`, 
	`Seva_Year`, 
	`Assignment_Date_Time`, 
	`Release_Date_Time`, 
	`Seva_Status`, 
	`Devotee_Seva_Update_Date_Time`, 
	`Devotee_Seva_Updated_By`) 
VALUES (
    p_Devotee_Seva_Id,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Seva_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE `Seva_Availability` 
SET 
	`Assigned_Count`= `Assigned_Count` + 1,
	`Availability_Update_Date_Time`= NOW(),
	`Availability_Updated_By`= p_Devotee_Record_Updated_By 
WHERE Seva_Id = p_Devotee_Seva_ID;



END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_REFRESH_ACCO_COUNT`()
BEGIN

	DECLARE v_finished INTEGER DEFAULT 0 ;
    DECLARE v_accommodation_key VARCHAR(10) DEFAULT "" ;
    DECLARE v_accommodation_count INTEGER DEFAULT 0 ;
    DECLARE v_accommodation_capacity INTEGER DEFAULT 0 ;

	DECLARE csr_accomodation CURSOR FOR
      SELECT
    am.accomodation_key,
    COUNT(da.Accomodation_Key),
    am.accomodation_capacity
FROM
    Accommodation_Master am
LEFT OUTER JOIN Devotee_Accomodation da ON
    am.Accomodation_Key = da.Accomodation_Key AND da.Accomodation_Year = YEAR(NOW()) AND da.Accomodation_Status = 'Allocated'
GROUP BY
    am.Accomodation_Key;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1 ;
    
	OPEN csr_accomodation ;
    
		WHILE v_finished = 0 DO
        	
            FETCH csr_accomodation INTO v_accommodation_key, v_accommodation_count, v_accommodation_capacity ;
            
            IF v_finished = 0 THEN
            	UPDATE
                    Accommodation_Availability
                SET
                    allocated_count = v_accommodation_count,
                    available_count = v_accommodation_capacity - (reserved_count + out_of_availability_count + v_accommodation_count)
                WHERE
                    accomodation_key = v_accommodation_key ;
                END IF ;
        	
		END WHILE ;
    
    CLOSE csr_accomodation ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_REFRESH_AMENITY_COUNT`()
BEGIN

	DECLARE v_finished INTEGER DEFAULT 0 ;
    DECLARE v_amenity_key VARCHAR(10) DEFAULT "" ;
    DECLARE v_amenity_count INTEGER DEFAULT 0 ;
    DECLARE v_amenity_quantity INTEGER DEFAULT 0 ;

	DECLARE csr_amenity CURSOR FOR
      SELECT
    am.amenity_key,
    IFNULL(SUM(da.Amenity_Quantity), 0),
    am.amenity_quantity
FROM
    Amenity_Master am
LEFT OUTER JOIN Devotee_Amenities_Allocation da ON
    am.Amenity_Key = da.Amenity_Key AND da.Amenity_Allocation_Year = YEAR(NOW()) AND da.Amenity_Allocation_Status = 'Allocated'
GROUP BY
    am.Amenity_Key;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1 ;
    
	OPEN csr_amenity ;
    
		WHILE v_finished = 0 DO
        	
            FETCH csr_amenity INTO v_amenity_key, v_amenity_count, v_amenity_quantity ;
            
            IF v_finished = 0 THEN
            	UPDATE
                    Amenities_Availability
                SET
                    allocated_count = v_amenity_count,
                    available_count = v_amenity_quantity - (reserved_count + out_of_availability_count + v_amenity_count)
                WHERE
                    amenity_key = v_amenity_key ;
                END IF ;
        	
		END WHILE ;
    
    CLOSE csr_amenity ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_REFRESH_SEVA_COUNT`()
BEGIN

	DECLARE v_finished INTEGER DEFAULT 0 ;
    DECLARE v_seva_id VARCHAR(10) DEFAULT "" ;
    DECLARE v_seva_count INTEGER DEFAULT 0 ;
    

	DECLARE csr_seva CURSOR FOR
      SELECT
    sm.seva_id,
    COUNT(ds.seva_id)
FROM
    Seva_Master sm
LEFT OUTER JOIN Devotee_Seva ds ON
    sm.Seva_ID = ds.Seva_Id AND ds.Seva_Year = YEAR(NOW()) AND ds.Seva_Status = 'Assigned'
GROUP BY
    sm.Seva_Id;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1 ;
    
Update seva_availability set assigned_count = 0;

	OPEN csr_seva ;
    
		WHILE v_finished = 0 DO
        	
            FETCH csr_seva INTO v_seva_id, v_seva_count ;
            
            IF v_finished = 0 THEN
            	UPDATE
                    Seva_Availability
                SET
                    assigned_count = v_seva_count
                WHERE
                    seva_id = v_seva_id ;
                END IF ;
        	
		END WHILE ;
    
    CLOSE csr_seva ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_REPLACE_DEVOTEE`(IN `p_Devotee_Key` VARCHAR(10), IN `p_Devotee_Type` VARCHAR(30), IN `p_Devotee_First_Name` VARCHAR(50), IN `p_Devotee_Last_Name` VARCHAR(50), IN `p_Devotee_Gender` VARCHAR(6), IN `p_Devotee_ID_Type` VARCHAR(10), IN `p_Devotee_ID_Number` VARCHAR(50), IN `p_Devotee_Station` VARCHAR(50), IN `p_Devotee_Cell_Phone_Number` VARCHAR(15), IN `p_Devotee_Status` VARCHAR(20), IN `p_Devotee_Remarks` VARCHAR(250), IN `p_Devotee_Record_Updated_By` VARCHAR(10), IN `p_Devotee_Accommodation_ID` VARCHAR(10), IN `p_Devotee_Accomodation_Status` VARCHAR(10))
BEGIN
	
    DECLARE v_past_accomodation varchar(10);
    DECLARE v_past_accomodation_Count varchar(10);    

       REPLACE INTO devotee(
        Devotee_Key,
        Devotee_Type,
        Devotee_First_Name,
        Devotee_Last_Name,
        Devotee_Gender,
        Devotee_ID_Type,
        Devotee_ID_Number,
        Devotee_Station,
        Devotee_Cell_Phone_Number,
        Devotee_Status,
        Devotee_Remarks,
        Devotee_Record_Update_Date_Time,
        Devotee_Record_Updated_By
    )
VALUES(
    p_Devotee_Key,
    p_Devotee_Type,
    p_Devotee_First_Name,
    p_Devotee_Last_Name,
    p_Devotee_Gender,
    p_Devotee_ID_Type,
    p_Devotee_ID_Number,
    p_Devotee_Station,
    p_Devotee_Cell_Phone_Number,
    p_Devotee_Status,
    p_Devotee_Remarks,
    NOW(),
    p_Devotee_Record_Updated_By
);


SELECT count(*) INTO v_past_accomodation_count  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) AND
Accomodation_key = p_Devotee_Accommodation_ID;

IF (v_past_accomodation_Count = 0) THEN

SELECT accomodation_key INTO v_past_accomodation  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) 
ORDER BY 
Devotee_Accomodation_Update_Date_Time DESC
LIMIT 1;

UPDATE Devotee_Accomodation SET Accomodation_Status = 'Departed' ,  Devotee_Accomodation_Updated_By = p_Devotee_Record_Updated_By, Departure_date_time = NOW() WHERE Devotee_Key = p_Devotee_Key;

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count - 1,
    Available_Count = Available_Count + 1
WHERE	
	Accomodation_Key = v_past_accomodation;
    
INSERT INTO Devotee_Accomodation(
    Accomodation_Key,
    Devotee_Key,
    Accomodation_Year,
    Arrival_Date_Time,
    Departure_Date_Time,
    Accomodation_Status,
    Devotee_Accomodation_Update_Date_Time,
    Devotee_Accomodation_Updated_By
)
VALUES(
    p_Devotee_Accommodation_ID,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Accomodation_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count + 1,
    Available_Count = Available_Count - 1
WHERE	
	Accomodation_Key = p_Devotee_Accommodation_ID;
END IF;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_REPLACE_DEVOTEE_I`(IN `p_Devotee_Key` VARCHAR(10), IN `p_Devotee_Type` VARCHAR(30), IN `p_Devotee_First_Name` VARCHAR(50), IN `p_Devotee_Last_Name` VARCHAR(50), IN `p_Devotee_Gender` VARCHAR(6), IN `p_Devotee_ID_Type` VARCHAR(10), IN `p_Devotee_ID_Number` VARCHAR(50), IN `p_Devotee_Station` VARCHAR(50), IN `p_Devotee_Cell_Phone_Number` VARCHAR(15), IN `p_Devotee_Status` VARCHAR(20), IN `p_Devotee_Remarks` VARCHAR(250),  IN `p_Devotee_Referral` VARCHAR(100), IN `p_Devotee_Record_Updated_By` VARCHAR(10), IN `p_Devotee_Accommodation_ID` VARCHAR(10), IN `p_Devotee_Accomodation_Status` VARCHAR(10))
BEGIN
	
    DECLARE v_past_accomodation varchar(10);
    DECLARE v_past_accomodation_Count varchar(10);    

       REPLACE INTO devotee(
        Devotee_Key,
        Devotee_Type,
        Devotee_First_Name,
        Devotee_Last_Name,
        Devotee_Gender,
        Devotee_ID_Type,
        Devotee_ID_Number,
        Devotee_Station,
        Devotee_Cell_Phone_Number,
        Devotee_Status,
        Devotee_Remarks,
        Devotee_Referral,
        Devotee_Record_Update_Date_Time,
        Devotee_Record_Updated_By
    )
VALUES(
    p_Devotee_Key,
    p_Devotee_Type,
    p_Devotee_First_Name,
    p_Devotee_Last_Name,
    p_Devotee_Gender,
    p_Devotee_ID_Type,
    p_Devotee_ID_Number,
    p_Devotee_Station,
    p_Devotee_Cell_Phone_Number,
    p_Devotee_Status,
    p_Devotee_Remarks,
    p_Devotee_Referral,
    NOW(),
    p_Devotee_Record_Updated_By
);


SELECT count(*) INTO v_past_accomodation_count  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) AND
Accomodation_key = p_Devotee_Accommodation_ID;

IF (v_past_accomodation_Count = 0) THEN

SELECT accomodation_key INTO v_past_accomodation  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) 
ORDER BY 
Devotee_Accomodation_Update_Date_Time DESC
LIMIT 1;

UPDATE Devotee_Accomodation SET Accomodation_Status = 'Departed' ,  Devotee_Accomodation_Updated_By = p_Devotee_Record_Updated_By, Departure_date_time = NOW() WHERE Devotee_Key = p_Devotee_Key;

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count - 1,
    Available_Count = Available_Count + 1
WHERE	
	Accomodation_Key = v_past_accomodation;
    
INSERT INTO Devotee_Accomodation(
    Accomodation_Key,
    Devotee_Key,
    Accomodation_Year,
    Arrival_Date_Time,
    Departure_Date_Time,
    Accomodation_Status,
    Devotee_Accomodation_Update_Date_Time,
    Devotee_Accomodation_Updated_By
)
VALUES(
    p_Devotee_Accommodation_ID,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Accomodation_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count + 1,
    Available_Count = Available_Count - 1
WHERE	
	Accomodation_Key = p_Devotee_Accommodation_ID;
END IF;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_REPLACE_DEVOTEE_W_SEVA`(
	IN `p_Devotee_Key` VARCHAR(10), 
	IN `p_Devotee_Type` VARCHAR(30), 
	IN `p_Devotee_First_Name` VARCHAR(50), 
	IN `p_Devotee_Last_Name` VARCHAR(50), 
	IN `p_Devotee_Gender` VARCHAR(6), 
	IN `p_Devotee_ID_Type` VARCHAR(10), 
	IN `p_Devotee_ID_Number` VARCHAR(50), 
	IN `p_Devotee_Station` VARCHAR(50), 
	IN `p_Devotee_Cell_Phone_Number` VARCHAR(15), 
	IN `p_Devotee_Status` VARCHAR(20), 
	IN `p_Devotee_Remarks` VARCHAR(250),  
	IN `p_Devotee_Referral` VARCHAR(100), 
	IN `p_Devotee_Seva_Id` VARCHAR(6),
	IN `p_Devotee_Seva_Status` VARCHAR(10),
	IN `p_Devotee_Record_Updated_By` VARCHAR(10), 
	IN `p_Devotee_Accommodation_ID` VARCHAR(10), 
	IN `p_Devotee_Accomodation_Status` VARCHAR(10)
	)
BEGIN
	
    DECLARE v_past_accomodation varchar(10);
    DECLARE v_past_accomodation_Count varchar(10); 
    DECLARE v_past_seva varchar(10);   
	DECLARE v_past_seva_count varchar(10); 

       REPLACE INTO devotee(
        Devotee_Key,
        Devotee_Type,
        Devotee_First_Name,
        Devotee_Last_Name,
        Devotee_Gender,
        Devotee_ID_Type,
        Devotee_ID_Number,
        Devotee_Station,
        Devotee_Cell_Phone_Number,
        Devotee_Status,
        Devotee_Remarks,
        Devotee_Referral,
        Devotee_Record_Update_Date_Time,
        Devotee_Record_Updated_By
    )
VALUES(
    p_Devotee_Key,
    p_Devotee_Type,
    p_Devotee_First_Name,
    p_Devotee_Last_Name,
    p_Devotee_Gender,
    p_Devotee_ID_Type,
    p_Devotee_ID_Number,
    p_Devotee_Station,
    p_Devotee_Cell_Phone_Number,
    p_Devotee_Status,
    p_Devotee_Remarks,
    p_Devotee_Referral,
    NOW(),
    p_Devotee_Record_Updated_By
);


SELECT count(*) INTO v_past_accomodation_count  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) AND
Accomodation_key = p_Devotee_Accommodation_ID;

IF (v_past_accomodation_Count = 0) THEN

SELECT accomodation_key INTO v_past_accomodation  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) 
ORDER BY 
Devotee_Accomodation_Update_Date_Time DESC
LIMIT 1;

UPDATE Devotee_Accomodation SET Accomodation_Status = 'Departed' ,  Devotee_Accomodation_Updated_By = p_Devotee_Record_Updated_By, Departure_date_time = NOW() WHERE Devotee_Key = p_Devotee_Key;

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count - 1,
    Available_Count = Available_Count + 1
WHERE	
	Accomodation_Key = v_past_accomodation;
    
INSERT INTO Devotee_Accomodation(
    Accomodation_Key,
    Devotee_Key,
    Accomodation_Year,
    Arrival_Date_Time,
    Departure_Date_Time,
    Accomodation_Status,
    Devotee_Accomodation_Update_Date_Time,
    Devotee_Accomodation_Updated_By
)
VALUES(
    p_Devotee_Accommodation_ID,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Accomodation_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count + 1,
    Available_Count = Available_Count - 1
WHERE	
	Accomodation_Key = p_Devotee_Accommodation_ID;
END IF;


SELECT count(*) INTO v_past_seva_count  FROM Devotee_Seva WHERE
Devotee_Key = p_Devotee_Key AND
Seva_Status = 'Assigned' AND
Seva_Year = YEAR(NOW()) AND
Seva_Id = p_Devotee_Seva_Id;

IF (v_past_seva_Count = 0) THEN

SELECT seva_id INTO v_past_seva  FROM Devotee_Seva WHERE
Devotee_Key = p_Devotee_Key AND
Seva_Status = 'Assigned' AND
Seva_Year = YEAR(NOW()) 
ORDER BY 
Devotee_Seva_Update_Date_Time DESC
LIMIT 1;

UPDATE Devotee_Seva SET Seva_Status = 'Released' ,  Devotee_Seva_Updated_By = p_Devotee_Record_Updated_By, Release_Date_Time = NOW() WHERE Devotee_Key = p_Devotee_Key;

UPDATE `Seva_Availability` SET
	Assigned_Count = Assigned_Count - 1
WHERE	
	`seva_id` = v_past_seva;
    
INSERT INTO `Devotee_Seva`(
	`Seva_ID`, 
	`Devotee_Key`, 
	`Seva_Year`, 
	`Assignment_Date_Time`, 
	`Release_Date_Time`, 
	`Seva_Status`, 
	`Devotee_Seva_Update_Date_Time`, 
	`Devotee_Seva_Updated_By`) 
VALUES (
    p_Devotee_Seva_Id,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Seva_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE `Seva_Availability` 
SET 
	`Assigned_Count`= `Assigned_Count` + 1,
	`Availability_Update_Date_Time`= NOW(),
	`Availability_Updated_By`= p_Devotee_Record_Updated_By 
WHERE Seva_Id = p_Devotee_Seva_ID;

END IF;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_REPLACE_DEVOTEE_W_SEVA_I`(
	IN `p_Devotee_Key` VARCHAR(10), 
	IN `p_Devotee_Type` VARCHAR(30), 
	IN `p_Devotee_First_Name` VARCHAR(50), 
	IN `p_Devotee_Last_Name` VARCHAR(50), 
	IN `p_Devotee_Gender` VARCHAR(6), 
	IN `p_Devotee_ID_Type` VARCHAR(10), 
	IN `p_Devotee_ID_Number` VARCHAR(50), 
	IN `p_Devotee_Station` VARCHAR(50), 
	IN `p_Devotee_Cell_Phone_Number` VARCHAR(15), 
	IN `p_Devotee_Status` VARCHAR(20), 
	IN `p_Devotee_Remarks` VARCHAR(250),  
	IN `p_Devotee_Referral` VARCHAR(100), 
	IN `p_Devotee_Seva_Id` VARCHAR(6),
	IN `p_Devotee_Seva_Status` VARCHAR(10),
	IN `p_Devotee_Record_Updated_By` VARCHAR(10), 
	IN `p_Devotee_Accommodation_ID` VARCHAR(10), 
	IN `p_Devotee_Accomodation_Status` VARCHAR(10),
	IN `p_Devotee_Address_1` VARCHAR(100),
    IN `p_Devotee_Address_2` VARCHAR(100),
    IN `p_Devotee_State` VARCHAR(25),
    IN `p_Devotee_Zip` VARCHAR(12),
    IN `p_Devotee_Country` VARCHAR(20),
    IN `p_Comments`  VARCHAR(250),
    IN `p_Joined_Since`  VARCHAR(4)
	)
BEGIN
	
    DECLARE v_past_accomodation varchar(10);
    DECLARE v_past_accomodation_Count varchar(10); 
    DECLARE v_past_seva varchar(10);   
	DECLARE v_past_seva_count varchar(10); 

       REPLACE INTO devotee(
        Devotee_Key,
        Devotee_Type,
        Devotee_First_Name,
        Devotee_Last_Name,
        Devotee_Gender,
        Devotee_ID_Type,
        Devotee_ID_Number,
        Devotee_Station,
        Devotee_Cell_Phone_Number,
        Devotee_Status,
        Devotee_Remarks,
        Devotee_Referral,
        Devotee_Record_Update_Date_Time,
        Devotee_Record_Updated_By,
    	Devotee_Address_1,
    	Devotee_Address_2,
    	Devotee_State,
    	Devotee_Zip,
    	Devotee_Country,
    	Comments,
    	Joined_Since
    )
VALUES(
    p_Devotee_Key,
    p_Devotee_Type,
    p_Devotee_First_Name,
    p_Devotee_Last_Name,
    p_Devotee_Gender,
    p_Devotee_ID_Type,
    p_Devotee_ID_Number,
    p_Devotee_Station,
    p_Devotee_Cell_Phone_Number,
    p_Devotee_Status,
    p_Devotee_Remarks,
    p_Devotee_Referral,
    NOW(),
    p_Devotee_Record_Updated_By,
	p_Devotee_Address_1,
    p_Devotee_Address_2,
    p_Devotee_State,
    p_Devotee_Zip,
    p_Devotee_Country,
    p_Comments,
    p_Joined_Since
);


SELECT count(*) INTO v_past_accomodation_count  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) AND
Accomodation_key = p_Devotee_Accommodation_ID;

IF (v_past_accomodation_Count = 0) THEN

SELECT accomodation_key INTO v_past_accomodation  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) 
ORDER BY 
Devotee_Accomodation_Update_Date_Time DESC
LIMIT 1;

UPDATE Devotee_Accomodation SET Accomodation_Status = 'Departed' ,  Devotee_Accomodation_Updated_By = p_Devotee_Record_Updated_By, Departure_date_time = NOW() WHERE Devotee_Key = p_Devotee_Key;

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count - 1,
    Available_Count = Available_Count + 1
WHERE	
	Accomodation_Key = v_past_accomodation;
    
INSERT INTO Devotee_Accomodation(
    Accomodation_Key,
    Devotee_Key,
    Accomodation_Year,
    Arrival_Date_Time,
    Departure_Date_Time,
    Accomodation_Status,
    Devotee_Accomodation_Update_Date_Time,
    Devotee_Accomodation_Updated_By
)
VALUES(
    p_Devotee_Accommodation_ID,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Accomodation_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count + 1,
    Available_Count = Available_Count - 1
WHERE	
	Accomodation_Key = p_Devotee_Accommodation_ID;
END IF;


SELECT count(*) INTO v_past_seva_count  FROM Devotee_Seva WHERE
Devotee_Key = p_Devotee_Key AND
Seva_Status = 'Assigned' AND
Seva_Year = YEAR(NOW()) AND
Seva_Id = p_Devotee_Seva_Id;

IF (v_past_seva_Count = 0) THEN

SELECT seva_id INTO v_past_seva  FROM Devotee_Seva WHERE
Devotee_Key = p_Devotee_Key AND
Seva_Status = 'Assigned' AND
Seva_Year = YEAR(NOW()) 
ORDER BY 
Devotee_Seva_Update_Date_Time DESC
LIMIT 1;

UPDATE Devotee_Seva SET Seva_Status = 'Released' ,  Devotee_Seva_Updated_By = p_Devotee_Record_Updated_By, Release_Date_Time = NOW() WHERE Devotee_Key = p_Devotee_Key;

UPDATE `Seva_Availability` SET
	Assigned_Count = Assigned_Count - 1
WHERE	
	`seva_id` = v_past_seva;
    
INSERT INTO `Devotee_Seva`(
	`Seva_ID`, 
	`Devotee_Key`, 
	`Seva_Year`, 
	`Assignment_Date_Time`, 
	`Release_Date_Time`, 
	`Seva_Status`, 
	`Devotee_Seva_Update_Date_Time`, 
	`Devotee_Seva_Updated_By`) 
VALUES (
    p_Devotee_Seva_Id,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Seva_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE `Seva_Availability` 
SET 
	`Assigned_Count`= `Assigned_Count` + 1,
	`Availability_Update_Date_Time`= NOW(),
	`Availability_Updated_By`= p_Devotee_Record_Updated_By 
WHERE Seva_Id = p_Devotee_Seva_ID;

END IF;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPDATE_DEVOTEE`(IN `p_Devotee_Key` VARCHAR(10), IN `p_Devotee_Type` VARCHAR(30), IN `p_Devotee_First_Name` VARCHAR(50), IN `p_Devotee_Last_Name` VARCHAR(50), IN `p_Devotee_Gender` VARCHAR(6), IN `p_Devotee_ID_Type` VARCHAR(10), IN `p_Devotee_ID_Number` VARCHAR(50), IN `p_Devotee_Station` VARCHAR(50), IN `p_Devotee_Cell_Phone_Number` VARCHAR(15), IN `p_Devotee_Status` VARCHAR(20), IN `p_Devotee_Remarks` VARCHAR(250), IN `p_Devotee_Record_Updated_By` VARCHAR(10), IN `p_Devotee_Accommodation_ID` VARCHAR(10), IN `p_Devotee_Accomodation_Status` VARCHAR(10))
BEGIN
	
    DECLARE v_past_accomodation varchar(10);
    DECLARE v_past_accomodation_Count varchar(10);    

    UPDATE devotee SET
        Devotee_Type = p_Devotee_Type,
        Devotee_First_Name = p_Devotee_First_Name,
        Devotee_Last_Name = p_Devotee_Last_Name,
        Devotee_Gender = p_Devotee_Gender,
        Devotee_ID_Type = p_Devotee_ID_Type,
        Devotee_ID_Number = p_Devotee_ID_Number,
        Devotee_Station = p_Devotee_Station,
        Devotee_Cell_Phone_Number = p_Devotee_Cell_Phone_Number,
        Devotee_Status = p_Devotee_Status,
        Devotee_Remarks = p_Devotee_Remarks,
        Devotee_Record_Update_Date_Time = NOW(),
        Devotee_Record_Updated_By = p_Devotee_Record_Updated_By
     WHERE Devotee_Key = p_Devotee_Key;

SELECT count(*) INTO v_past_accomodation_count  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) AND
Accomodation_key = p_Devotee_Accommodation_ID;

IF (v_past_accomodation_Count = 0) THEN

SELECT accomodation_key INTO v_past_accomodation  FROM Devotee_Accomodation WHERE
Devotee_Key = p_Devotee_Key AND
Accomodation_Status = 'Allocated' AND
Accomodation_Year = YEAR(NOW()) 
ORDER BY 
Devotee_Accomodation_Update_Date_Time DESC
LIMIT 1;

UPDATE Devotee_Accomodation SET Accomodation_Status = 'Departed' ,  Devotee_Accomodation_Updated_By = p_Devotee_Record_Updated_By, Departure_date_time = NOW() WHERE Devotee_Key = p_Devotee_Key;

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count - 1,
    Available_Count = Available_Count + 1
WHERE	
	Accomodation_Key = v_past_accomodation;
    
INSERT INTO Devotee_Accomodation(
    Accomodation_Key,
    Devotee_Key,
    Accomodation_Year,
    Arrival_Date_Time,
    Departure_Date_Time,
    Accomodation_Status,
    Devotee_Accomodation_Update_Date_Time,
    Devotee_Accomodation_Updated_By
)
VALUES(
    p_Devotee_Accommodation_ID,
    p_Devotee_Key,
    YEAR(NOW()),
    NOW(),
    NULL,
    p_Devotee_Accomodation_Status,
    NOW(),
    p_Devotee_Record_Updated_By
);

UPDATE Accommodation_Availability SET
	Allocated_Count = Allocated_Count + 1,
    Available_Count = Available_Count - 1
WHERE	
	Accomodation_Key = p_Devotee_Accommodation_ID;
END IF;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPSERT_ACCO`(IN `p_Accomodation_Key` VARCHAR(5), IN `p_Accomodation_Name` VARCHAR(100), IN `p_Accomodation_Capacity` INT(11), IN `p_Reserved_Count` INT(11), IN `p_Out_of_Availability_Count` INT(11), IN `p_Accomodation_Updated_By` VARCHAR(10))
BEGIN
    REPLACE
INTO `Accommodation_Master`(
    `Accomodation_Key`,
    `Accomodation_Name`,
    `Accomodation_Capacity`,
    `Accomodation_Update_Date_Time`,
    `Accomodation_Updated_By`
)
VALUES(
    p_Accomodation_Key,
    p_Accomodation_Name,
    p_Accomodation_Capacity,
    NOW(), p_Accomodation_Updated_By) ;
    
REPLACE
INTO `Accommodation_Availability`(
    `Accomodation_Key`,
    `Reserved_Count`,
    `Out_of_Availability_Count`,
    `Availability_Update_Date_Time`,
    `Availability_Updated_By`
)
VALUES(
    p_Accomodation_Key,
    p_Reserved_Count,
    p_Out_of_Availability_Count,
    NOW(),
    p_Accomodation_Updated_By
    );

CALL PROC_REFRESH_ACCO_COUNT();

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPSERT_AMENITY`(IN `p_Amenity_Key` VARCHAR(5), IN `p_Amenity_Name` VARCHAR(100), IN `p_Amenity_Status` VARCHAR(20), IN `p_Amenity_Quantity` INT(11), IN `p_Reserved_Count` INT(11), IN `p_Out_of_Availability_Count` INT(11), IN `p_Amenity_Updated_By` VARCHAR(10))
BEGIN
    REPLACE
INTO `Amenity_Master`(
    `Amenity_Key`,
    `Amenity_Name`,
    `Amenity_Status`,
    `Amenity_Quantity`,
    `Amenity_Record_Update_Date_Time`,
    `Amenity_Record_Upated_by`
)
VALUES(
    p_Amenity_Key,
    p_Amenity_Name,
    p_Amenity_Status,
    p_Amenity_Quantity,
    NOW(), p_Amenity_Updated_By) ;
    
REPLACE
INTO `Amenities_Availability`(
    `Amenity_Key`,
    `Reserved_Count`,
    `Out_of_Availability_Count`,
    `Availability_Update_Date_Time`,
    `Availability_Updated_By`
)
VALUES(
    p_Amenity_Key,
    p_Reserved_Count,
    p_Out_of_Availability_Count,
    NOW(), p_Amenity_Updated_By) ;
CALL
    PROC_REFRESH_AMENITY_COUNT() ;
    END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPSERT_SEVA`(IN `p_Seva_Id` VARCHAR(6), IN `p_Seva_Description` VARCHAR(100))
BEGIN
    REPLACE
INTO `Seva_Master`(
    `Seva_Id`,
    `Seva_Description`,
    `Seva_Updated_On_Date_Time`,
    `Seva_Update_by`
)
VALUES(
    p_Seva_Id,
    p_Seva_Description,
    NOW(), 'Anil') ;
 
    END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC_UPSERT_SEVA_W_AVAIL_UPDATE`(IN `p_Seva_Id` VARCHAR(6), IN `p_Seva_Description` VARCHAR(100))
BEGIN
    REPLACE
INTO `Seva_Master`(
    `Seva_Id`,
    `Seva_Description`,
    `Seva_Updated_On_Date_Time`,
    `Seva_Update_by`
)
VALUES(
    p_Seva_Id,
    p_Seva_Description,
    NOW(), 'Anil') ;
 
 REPLACE INTO `Seva_Availability`(
	`Seva_Id`, 
	`Assigned_Count`, 
	`Availability_Update_Date_Time`, 
	`Availability_Updated_By`
	) 
VALUES (
	p_Seva_Id,
	0,
	NOW(),
	'Anil'
);
 
CALL PROC_REFRESH_SEVA_COUNT();

    END$$
DELIMITER ;
