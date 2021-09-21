USE [CLR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.fnValidaEmail(@Ds_Email varchar(max))
RETURNS BIT
AS BEGIN
	-- fonte: https://www.dirceuresende.com/blog/validando-cpf-cnpj-e-mail-telefone-e-cep-no-sql-server/

	DECLARE @Retorno BIT = 0

	SELECT @Retorno = 1
    WHERE @Ds_Email NOT LIKE '%[^a-z,0-9,@,.,_,-]%'
    AND @Ds_Email LIKE '%_@_%_.__%'
    AND @Ds_Email NOT LIKE '%_@@_%_.__%'

	RETURN @Retorno

END

