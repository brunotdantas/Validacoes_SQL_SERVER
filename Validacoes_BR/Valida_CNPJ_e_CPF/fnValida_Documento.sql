USE [CLR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnValida_Documento] ( 
    @Nr_Documento VARCHAR(14) 
)
RETURNS BIT
AS BEGIN
 
    DECLARE @Retorno BIT = 0
 
 
    IF (LEN(@Nr_Documento) = 11)
    BEGIN
 
        -- Valida CPF
        IF (@Nr_Documento IN ('00000000000', '11111111111', '22222222222', '33333333333', '44444444444', '55555555555', '66666666666', '77777777777', '88888888888', '99999999999', '12345678909'))
            SET @Retorno = 0
        ELSE
            SET @Retorno = CLR.dbo.fncValida_CPF(@Nr_Documento)
 
    END
    ELSE BEGIN 
        
        -- Valida CNPJ
        IF (LEN(@Nr_Documento) = 14)
            SET @Retorno = CLR.dbo.fncValida_CNPJ(@Nr_Documento)
        ELSE
            SET @Retorno = 0
 
    END
 
 
    RETURN @Retorno
    
 
END