--Módulo para inverter o sinal de um número: Recebe um valor, inverte os bits e soma 1 ao bit LSB. 

LIBRARY ieee;

ENTITY inverteSinal IS PORT (
  A : IN BIT_VECTOR(3 DOWNTO 0);
  result : OUT BIT_VECTOR(3 DOWNTO 0);
  carry : OUT BIT
);
END inverteSinal;

ARCHITECTURE estrutura OF inverteSinal IS

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
  -- Usa o módulo somador completo para somar o bit "0001" a entrada invertida. 
  IS0 : somadorCompleto port map (not A(0), '1', '0', resultAUX(0), carryAUX(0));
  IS1 : somadorCompleto port map (not A(1), '0', carryAUX(0), resultAUX(1), carryAUX(1));
  IS2 : somadorCompleto port map (not A(2), '0', carryAUX(1), resultAUX(2), carryAUX(2));
  IS3 : somadorCompleto port map (not A(3), '0', carryAUX(2), resultAUX(3), carryAUX(3));
  

  result <= resultAUX;
  carry <= carryAUX(3);
  
END estrutura;