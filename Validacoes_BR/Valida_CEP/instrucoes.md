Para esta solução é passado o cep como varchar para função, ela retorna "0" se o cep for INVÁLIDO e 1 se for "VÁLIDO"

Validações implementadas: 
    retorna 0 quando: 
        - Se o CEP for null  
        - Se o CEP não possuir 8 caracteres 
        - Algum caracter do CEP não for número

Como aplicar essa solução na sua base: 
1- Implementar a função fnValida_Cep.sql

Como usar: 
declare @conteudo varchar(max) = 'HELL[Ó ) | º olá mundo!'
SELECT dbo.FN_REMOVECHARINVALIDO(@conteudo)
    Resultado: 
        "HELLO   o ola mundo"
