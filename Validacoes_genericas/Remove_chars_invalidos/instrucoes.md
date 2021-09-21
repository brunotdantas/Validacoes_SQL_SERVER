Para esta solução faço manualmente o mapeamento de cada char inválido, seu significado e para qual valor devemos substituir caso aconteça encontrado. A ideia de fazer o mapeamento manual é que permite ao usuário escolher qual lógica prefere aplicar, por exemplo o simbolo "ª" no padrão que criei é convertido para a letra "a" porém se o usuário preferir pode colocar qualquer outro valor.

Como aplicar essa solução na sua base: 
1- Executar o script cria_chars_invalidos.sql Criar a tabela de char inválidos 
2- Implementar a função de char_invalidos executando o script cria_FN_REMOVECHARINVALIDO.sql

Como usar: 
declare @conteudo varchar(max) = 'HELL[Ó ) | º olá mundo!'
SELECT dbo.FN_REMOVECHARINVALIDO(@conteudo)
    Resultado: 
        "HELLO   o ola mundo"
