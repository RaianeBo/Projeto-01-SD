LIBRARY ieee;

ENTITY subtract IS PORT (
  A : IN BIT_VECTOR(3 DOWNTO 0);
  B : IN BIT_VECTOR(3 DOWNTO 0);
  result : OUT BIT_VECTOR(3 DOWNTO 0);
  carry : OUT BIT);
END subtract;

ARCHITECTURE estrutura OF subtract IS

  SIGNAL resultAUX : BIT_VECTOR(3 DOWNTO 0); 
  SIGNAL carryAUX : BIT_VECTOR(3 DOWNTO 0); 

 
  COMPONENT somadorCompleto IS
    PORT (
      a : IN BIT;
      b : IN BIT;
      cin : IN BIT;
      sum : OUT BIT;
      cout : OUT BIT);
  END COMPONENT;

BEGIN

  -- usa o módulo somador completo  para realizar a subtração em complemento de dois, invertento a segunda parcela e utilizando o carry in para somar o bit "0001". 
  D0 : somadorCompleto port map (A(0), NOT B(0), '1'        , resultAUX(0), carryAUX(0));
  D1 : somadorCompleto port map (A(1), NOT B(1), carryAUX(0), resultAUX(1), carryAUX(1));
  D2 : somadorCompleto port map (A(2), NOT B(2), carryAUX(1), resultAUX(2), carryAUX(2));
  D3 : somadorCompleto port map (A(3), NOT B(3), carryAUX(2), resultAUX(3), carryAUX(3));
  

  result <= resultAUX;
  carry <= carryAUX(3);
END estrutura;