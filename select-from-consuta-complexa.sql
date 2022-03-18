select Funcionario.nome, Dependente.Cpf_Funcionario, Dependente.nome as depentende from Dependente, Funcionario
where Dependente.Cpf_Funcionario=Funcionario.Cpf