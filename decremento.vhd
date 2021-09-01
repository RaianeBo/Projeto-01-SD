--Módulo decremento: soma um bit ao valor de entrada.

LIBRARY ieee;

ENTITY decremento IS PORT (
  A : IN BIT_VECTOR(3 DOWNTO 0);
  result : OUT BIT_VECTOR(3 DOWNTO 0);
  carry : OUT BIT
);
END decremento;

ARCHITECTURE estrutura OF decremento IS

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

  I0 : somadorCompleto port map (A(0), '0', '1', resultAUX(0), carryAUX(0));
  I1 : somadorCompleto port map (A(1), '1', carryAUX(0), resultAUX(1), carryAUX(1));
  I2 : somadorCompleto port map (A(2), '1', carryAUX(1), resultAUX(2), carryAUX(2));
  I3 : somadorCompleto port map (A(3), '1', carryAUX(2), resultAUX(3), carryAUX(3));

  result <= resultAUX;
  carry <= carryAUX(3);
  
END estrutura;