CREATE OR REPLACE FUNCTION belasting 
(p_jaarsal NUMBER) 
RETURN NUMBER 
IS  
    v_belasting NUMBER; 
BEGIN  
    IF p_jaarsal <= 30000 THEN                
        v_belasting := ROUND(p_jaarsal * 0.25);           
    ELSIF p_jaarsal <= 55000 THEN               
        v_belasting := ROUND(30000 * 0.25 + (p_jaarsal-30000) * 0.5);           
    ELSE               
        v_belasting := ROUND(30000 * 0.25 + 25000 * 0.5 + (p_jaarsal-55000) * 0.6);          
    END IF;  
    RETURN v_belasting; 
END; 
/ 