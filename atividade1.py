"""
Resolução da Atividade 1 da disciplina de SSC0960 Programação Funcional - 2024/1.
"""

def eh_primo(n, divisor=2):
    """Verifica recursivamente se n é primo."""
    if n < 2:
        return False
    if divisor > int(n ** 0.5): # O maior divisor possível é a raiz quadrada de n
        return True
    if n % divisor == 0:
        return False
    return eh_primo(n, divisor + 1)

def list_primos(start, end, primos=[]):
    """Gera recursivamente uma lista de números primos no intervalo [start, end]."""
    if start > end:
        return primos
    
    # Se start é primo, adiciona ele à lista de primos
    if eh_primo(start):
        return list_primos(start + 1, end, primos + [start])
    
    # Se start não é primo, apenas passa para o próximo número
    else:
        return list_primos(start + 1, end, primos)

def max_primo_gap(primos):
    """Encontra o maior intervalo entre primos consecutivos."""
    
    # Função auxiliar para encontrar o maior intervalo
    def aux(primos, max_gap=0):
        
        # Se não houver mais primos, retorna o maior intervalo encontrado
        if len(primos) < 2:
            return max_gap
        
        # Calcula o intervalo entre os dois primos consecutivos
        current_gap = primos[1] - primos[0]
        
        # Atualiza o maior intervalo encontrado
        return aux(primos[1:], max(max_gap, current_gap))
    
    return aux(primos)


if __name__ == "__main__":
    # Lendo os valores de x e y com validação
    x = int(input())
    y = int(input())

    if x < 0 or y < 0:
        raise ValueError("Os valores de x e y devem ser positivos.")
    if x >= y:
        raise ValueError("O valor de x deve ser menor a y.")

    # Gerando a lista de números primos e encontrando o maior intervalo
    primos = list_primos(x, y)
    largest_gap = max_primo_gap(primos)

    print(largest_gap)
