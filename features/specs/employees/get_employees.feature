            # language: pt
            # encoding: utf-8

            @Funcionarios
            Funcionalidade: Consulta de funcionarios
            Como consumidor,
            Desejo realizar a consulta dos funcionarios cadastrados
            
            @Consulta
            Cenario: Consulta de todos os funcionarios
            Quando faco uma solicitacao Get para o servico employees
            Entao o codigo de resposta HTTP deve ser igual 200
            E o contrato deve ser valido "schema_get_employees.json"
            E será retornado todos os funcionarios cadastrados