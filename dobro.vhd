--Módulo dobro:  retorna o valor dobrado 

LIBRARY ieee;

ENTITY dobro IS PORT (
  A : IN BIT_VECTOR(3 DOWNTO 0);
  result : OUT BIT_VECTOR(3 DOWNTO 0);
  carry : OUT BIT
);
END dobro;

ARCHITECTURE estrutura OF dobro IS

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

  S0 : somadorCompleto port map (A(0), A(0), '0', resultAUX(0), carryAUX(0));
  S1 : somadorCompleto port map (A(1), A(1), carryAUX(0), resultAUX(1), carryAUX(1));
  S2 : somadorCompleto port map (A(2), A(2), carryAUX(1), resultAUX(2), carryAUX(2));
  S3 : somadorCompleto port map (A(3), A(3), carryAUX(2), resultAUX(3), carryAUX(3));

  result <= resultAUX;
  carry <= carryAUX(3);
  
END estrutura;