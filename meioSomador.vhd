-- Módulo meio somador: Recebe dois bits e retorna o resultado da soma e o carry. 

LIBRARY ieee;

ENTITY meioSomador IS
  PORT (
    a : IN BIT;
    b : IN BIT;
    sum : OUT BIT;
    carry : OUT BIT);
END meioSomador;

ARCHITECTURE estrutura OF meioSomador IS

BEGIN
  sum <= a XOR b;
  carry <= a AND b;
END estrutura;
