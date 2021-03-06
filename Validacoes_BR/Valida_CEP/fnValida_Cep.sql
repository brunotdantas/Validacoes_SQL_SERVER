USE [SEU_BANCO_DE_DADOS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (EXISTS (SELECT * FROM sysobjects WHERE (id = object_id(N'dbo.fnVerifica_Cep')) AND (xtype IN (N'FN', N'IF', N'TF'))))
    DROP FUNCTION [dbo].[fnVerifica_Cep];
GO

CREATE FUNCTION [dbo].[fnVerifica_Cep](@Nr_Cep varchar(4000))
RETURNS BIT
AS 
BEGIN
    -- fonte inicial: https://www.dirceuresende.com/blog/validando-cpf-cnpj-e-mail-telefone-e-cep-no-sql-server/

    DECLARE @chr CHAR, @tamanho INT

    -- Remove o sinal '-' se existir
    set @Nr_Cep = replace(@Nr_Cep,'-','')

    -- Verifica se o CEP NULL
    IF (@Nr_Cep is null)
        RETURN 0

    -- Verifica o cep é diferente de 8 digitos
    IF (LEN(@Nr_Cep) != 8)
        RETURN 0
        
    WHILE (LEN(@Nr_Cep) > 0)
    BEGIN
    
        SELECT @tamanho = LEN(@Nr_Cep), @chr = LEFT(@Nr_Cep,1)
        
        -- Verifica se o número informado possui apenas números
        IF CHARINDEX(@chr,'0123456789') = 0
        BEGIN
            RETURN 0
            BREAK
        END
        
        SET @Nr_Cep = STUFF(@Nr_Cep,1,1,'') -- retira o primeiro dígito
        
    END
    
    RETURN 1 -- CEP Válido 
    
END
GO
