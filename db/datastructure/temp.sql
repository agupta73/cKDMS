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
    
Update Seva_Availability set assigned_count = 0;

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