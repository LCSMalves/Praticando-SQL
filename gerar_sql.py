import random
from datetime import datetime, timedelta

# Listas ampliadas de nomes e sobrenomes reais
nomes_reais = [
    "João", "Maria", "Pedro", "Ana", "Carlos", "Lucas", "Beatriz", "Fernanda", 
    "Ricardo", "Juliana", "Marcos", "Gabriela", "Luiz", "Camila", "Eduardo", 
    "Letícia", "Sérgio", "Paula", "Bruno", "Carla", "André", "Patrícia", 
    "Rafael", "Renata", "Thiago", "Larissa", "Rodrigo", "Cláudia", "Vinícius", 
    "Simone", "Felipe", "Aline", "Roberto", "Vanessa", "Gustavo", "Natália"
]

sobrenomes_reais = [
    "Silva", "Souza", "Oliveira", "Santos", "Pereira", "Costa", "Rodrigues", 
    "Almeida", "Nascimento", "Lima", "Araujo", "Gomes", "Martins", "Barbosa", 
    "Ribeiro", "Mendes", "Cardoso", "Teixeira", "Freitas", "Fernandes", 
    "Castro", "Pinto", "Barros", "Moura", "Campos", "Cavalcanti", "Duarte", 
    "Ferreira", "Vieira", "Monteiro", "Figueiredo", "Machado", "Medeiros"
]

cidades_reais = [
    "São Paulo", "Rio de Janeiro", "Belo Horizonte", "Salvador", "Fortaleza", 
    "Brasília", "Curitiba", "Manaus", "Recife", "Porto Alegre", "Belém", 
    "Goiânia", "Guarulhos", "Campinas", "São Luís", "São Gonçalo", 
    "Maceió", "Duque de Caxias", "Natal", "Campo Grande"
]

# Função para gerar um nome completo único
def gerar_nome_completo():
    nome = random.choice(nomes_reais)
    sobrenome = random.choice(sobrenomes_reais)
    return f"{nome} {sobrenome}"

# Função para gerar uma data de nascimento aleatória
def gerar_data_nascimento():
    start_date = datetime(1940, 1, 1)
    end_date = datetime(2005, 12, 31)
    return start_date + timedelta(days=random.randint(0, (end_date - start_date).days))

# Função para gerar um telefone aleatório
def gerar_telefone():
    return f"({random.randint(10, 99)}) {random.randint(90000, 99999)}-{random.randint(1000, 9999)}"

# Geração de dados para a tabela Clientes
def gerar_dados_clientes(qtd):
    nomes_gerados = set()
    clientes = []
    while len(clientes) < qtd:
        cadastro = len(clientes) + 1
        nome_completo = gerar_nome_completo()
        if nome_completo not in nomes_gerados:  # Garante nomes únicos
            nomes_gerados.add(nome_completo)
            data_nasc = gerar_data_nascimento().strftime('%Y-%m-%d')
            telefone = gerar_telefone()
            cidade = random.choice(cidades_reais)
            sexo = random.choice(['M', 'F'])
            clientes.append((cadastro, nome_completo, data_nasc, telefone, cidade, sexo))
    return clientes

# Geração de dados para a tabela Servicos
def gerar_dados_servicos(qtd):
    servicos = []
    for i in range(1, qtd + 1):
        num_serv = i
        nome_serv = f"Servico_{i}"
        valor = f"{random.randint(50, 500)}.00"
        servicos.append((num_serv, nome_serv, valor))
    return servicos

# Geração de dados para a tabela Utilizacoes
def gerar_dados_utilizacoes(qtd, qtd_clientes, qtd_servicos):
    utilizacoes = []
    for i in range(1, qtd + 1):
        ordem = i
        cliente = random.randint(1, qtd_clientes)
        servico = random.randint(1, qtd_servicos)
        utilizacoes.append((ordem, cliente, servico))
    return utilizacoes

# Função para gerar as linhas de SQL
def gerar_sql(tabela, colunas, dados):
    linhas = []
    for registro in dados:
        valores = ", ".join(f"'{v}'" if isinstance(v, str) else str(v) for v in registro)
        linhas.append(f"INSERT INTO {tabela} ({', '.join(colunas)}) VALUES ({valores});")
    return linhas

# Função principal
def main():
    with open('popula_bd_real_unico_ampliado.sql', 'w') as arquivo:
        # Gerar SQL para Clientes
        clientes = gerar_dados_clientes(400)
        sql_clientes = gerar_sql(
            "Clientes",
            ["Cadastro", "Nome", "DataNasc", "Telefone", "Cidade", "Sexo"],
            clientes
        )
        arquivo.write("\n".join(sql_clientes) + "\n\n")

        # Gerar SQL para Servicos
        servicos = gerar_dados_servicos(10)
        sql_servicos = gerar_sql(
            "Servicos",
            ["NumServ", "NomeServ", "Valor"],
            servicos
        )
        arquivo.write("\n".join(sql_servicos) + "\n\n")

        # Gerar SQL para Utilizacoes
        utilizacoes = gerar_dados_utilizacoes(1000, 400, 10)
        sql_utilizacoes = gerar_sql(
            "Utilizacoes",
            ["Ordem", "Cliente", "Servico"],
            utilizacoes
        )
        arquivo.write("\n".join(sql_utilizacoes) + "\n\n")

    print("Arquivo SQL gerado com sucesso: popula_bd_real_unico_ampliado.sql")

if __name__ == "__main__":
    main()