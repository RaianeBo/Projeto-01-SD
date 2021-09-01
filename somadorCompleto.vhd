--Módulo somador completo.

LIBRARY ieee;

ENTITY somadorCompleto IS
  PORT (
    a : IN BIT;
    b : IN BIT;
    cin : IN BIT;
    sum : OUT BIT;
    cout : OUT BIT);
END somadorCompleto;

ARCHITECTURE estrutura OF somadorCompleto IS

  COMPONENT meioSomador IS
    PORT (
      a : IN BIT;
      b : IN BIT;
      sum : OUT BIT;
      carry : OUT BIT);
  END COMPONENT;

  SIGNAL c0, c1, c2 : BIT;

BEGIN
  SC1 : meioSomador port map (a, b, c0, c1);
  SC2 : meioSomador port map (c0, cin, sum, c2);
  cout <= c1 OR c2;
END estrutura;