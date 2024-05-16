-- Atividade 2 - Disciplina: SSC0960 - Programação Funcional

-- Nome: Eduardo Ribeiro Rodrigues  NUSP: 13696679
-- Nome: Matheus Bermudes Viana     NUSP: 11849797
-- Nome:

-- Função principal
main :: IO ()
main = do
  x <- readLn
  y <- readLn
  if x < y
    then do
      let primes = primesInRange x y
      print $ maxPrimeGap primes
    -- caso contrario, nao faz nada
    else return ()

-- Função que verifica se um número é primo
-- "all" verifica se todos os elementos da lista satisfazem a condição
-- "floor" arredonda para baixo
-- "sqrt" retorna a raiz quadrada de um número
-- isPrime :: Int -> Bool
-- isPrime n
--   | n <= 1    = False
--   | otherwise = all (\x -> n `mod` x /= 0) [2..floor (sqrt (fromIntegral n))] 


-- Crivo de Eratóstenes - Função que retorna uma lista de números primos de 2 até infinito
-- É uma implementação mais eficiente para verificar se um número é primo (implementação da página principal do site haskell.org)
primes :: [Int]
primes = filterPrime [2..] where
  filterPrime (p:xs) = p : filterPrime [x | x <- xs, x `mod` p /= 0]

                                                       
-- Função que retorna uma lista de números primos no intervalo [x, y]
-- "takeWhile" retorna os elementos de uma lista que satisfazem a condição
-- "dropWhile" remove os elementos de uma lista que satisfazem a condição
primesInRange :: Int -> Int -> [Int]
primesInRange x y = takeWhile (<= y) $ dropWhile (< x) primes


-- Função que retorna o maior gap entre números primos consecutivos
-- "zipWith" aplica uma função a pares de elementos de duas listas
-- "drop" remove os primeiros n elementos de uma lista
-- "maximum" retorna o maior elemento de uma lista
maxPrimeGap :: [Int] -> Int
maxPrimeGap primes = aux (zipWith (-) (drop 1 primes) primes) 0
    where
        aux [] maxGap = maxGap
        aux (x:xs) maxGap = aux xs (max maxGap x)
