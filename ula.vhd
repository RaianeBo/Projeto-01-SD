LIBRARY ieee;

ENTITY ula IS PORT (
  X: IN BIT_VECTOR(3 DOWNTO 0);
  Y: IN BIT_VECTOR(3 DOWNTO 0);
  OP : IN BIT_VECTOR(2 DOWNTO 0);
  carry: OUT BIT; 
  S : OUT BIT_VECTOR(3 DOWNTO 0));
  
END ula;

 architecture estrutura of ula is
  --Seleção 
  SIGNAL RESULT :          BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL A :               BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL B :               BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL selection :       BIT_VECTOR(2 DOWNTO 0); 
  
  --Soma
  SIGNAL somaResult :      BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL somaCarry :       BIT; 
  
  --Subtração
  SIGNAL subtractResult : BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL subtractCarry :  BIT; 
  
  --Incremento 
  SIGNAL incrementoResult :     BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL incrementoCarry :      BIT; 
 
  --Troca de Sinal 
  SIGNAL inversorResult:     BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL inversorCarry :     BIT; 
 
  --decremento 
  SIGNAL decrementoResult:     BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL decrementoCarry :     BIT; 
  
  --comparador
  --SIGNAL comparadorResult:     BIT_VECTOR(3 DOWNTO 0); 
  
   --dobro 
  SIGNAL dobroResult:     BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL dobroCarry :     BIT; 
  
  --complemento de um  
  --SIGNAL complementoResult:     BIT_VECTOR(3 DOWNTO 0); 
 
  
  
  
 
  -- Módulo soma de 4 bits
  COMPONENT somador IS PORT (
    A : IN BIT_VECTOR(3 DOWNTO 0);
    B : IN BIT_VECTOR(3 DOWNTO 0);
    result : OUT BIT_VECTOR(3 DOWNTO 0);
    carry : OUT BIT
    );
  END COMPONENT;

  -- Módulo subtração de 4 bits
  COMPONENT subtract IS PORT (
    A : IN BIT_VECTOR(3 DOWNTO 0);
    B : IN BIT_VECTOR(3 DOWNTO 0);
    result : OUT BIT_VECTOR(3 DOWNTO 0);
    carry : OUT BIT
    );
  END COMPONENT;
  
  COMPONENT incremento IS PORT (
	 A : IN BIT_VECTOR(3 DOWNTO 0);
    result : OUT BIT_VECTOR(3 DOWNTO 0);
    carry: OUT BIT
    );
  END COMPONENT;
  
  COMPONENT inverteSinal IS PORT (
	 A : IN BIT_VECTOR(3 DOWNTO 0);
	 result : OUT BIT_VECTOR(3 DOWNTO 0);
    carry : OUT BIT
    );
  END COMPONENT;
  
   COMPONENT comparador IS PORT (
	 A : IN BIT_VECTOR(3 DOWNTO 0);
	 B : IN BIT_VECTOR(3 DOWNTO 0);
    result : OUT BIT_VECTOR(3 DOWNTO 0));
   END COMPONENT;
  
  COMPONENT dobro IS PORT (
	 A : IN BIT_VECTOR(3 DOWNTO 0);
    result : OUT BIT_VECTOR(3 DOWNTO 0);
    carry : OUT BIT
    );
   END COMPONENT;
  
  COMPONENT decremento IS PORT (
	 A : IN BIT_VECTOR(3 DOWNTO 0);
    result : OUT BIT_VECTOR(3 DOWNTO 0);
    carry: OUT BIT
    );
  END COMPONENT;
  
  --COMPONENT complementodeUM IS PORT (
	 --A : IN BIT_VECTOR(3 DOWNTO 0);
    --result : OUT BIT_VECTOR(3 DOWNTO 0)
    --);
  --END COMPONENT;
  
	
 BEGIN
 selection <= OP( 2 DOWNTO 0); 
 
 
 S1: somador PORT MAP(A, B, SomaResult, somaCarry);
 
 S2: subtract PORT MAP(A, B, subtractResult, subtractCarry);
 
 S3: incremento PORT MAP(A, incrementoResult, incrementoCarry); 
 
 S4: inverteSinal PORT MAP(A, inversorResult, inversorCarry);
 
 --S5: comparador PORT MAP(A, B, comparadorResult);
 
 S6: dobro PORT MAP(A, dobroResult, dobroCarry);
 
 S7: decremento PORT MAP(A, decrementoResult, decrementoCarry); 
 
 --S8: complementodeUM PORT MAP(A, complementoResult);
 
 
 
 
 
  WITH selection SELECT RESULT <=
    somaResult WHEN "000",
    subtractResult WHEN "001",
	 incrementoResult WHEN "010",
	 inversorResult WHEN "011",
	 --comparadorResult WHEN "100",
    dobroResult WHEN "101",
	 decrementoResult WHEN "110",
	 somaResult WHEN OTHERS;
	 --complementoResult WHEN "111";
	 
	 
	 

 S <= RESULT;
 
 END estrutura;