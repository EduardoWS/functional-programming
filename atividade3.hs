-- Atividade 3 - Disciplina: SSC0960 - Programação Funcional

-- Nome: Eduardo Ribeiro Rodrigues            NUSP: 13696679
-- Nome: Matheus Bermudes Viana               NUSP: 11849797
-- Nome: Matheus Henrique de Cerqueira Pinto  NUSP: 11911104

-- Função para encontrar o comprimento do segmento crescente máximo
maxIncreasingSegment :: [Int] -> Int
maxIncreasingSegment [] = 0
maxIncreasingSegment (x:xs) = maxSegment xs x 1 1
  where
    maxSegment [] _ currentMax globalMax = max currentMax globalMax
    maxSegment (y:ys) prev currentMax globalMax
      | y > prev = maxSegment ys y (currentMax + 1) globalMax
      | otherwise = maxSegment ys y 1 (max currentMax globalMax)

-- Função principal
main :: IO ()
main = do
  -- Lê a linha de entrada e converte para uma lista de inteiros
  input <- getLine
  let numbers = map read (words input) :: [Int]
  -- Encontra e imprime o comprimento do segmento crescente máximo
  print $ maxIncreasingSegment numbers
