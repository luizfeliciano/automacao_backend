            # language: pt
            # encoding: utf-8

            @Funcionarios
            Funcionalidade: Consulta de funcionario especifico
            Como consumidor,
            Desejo realizar a consulta de um funcionario especifico
            
            @Consulta_id
            Cenario: Consulta de um funcionario especifico
            Dado o id 1 do funcionario
            Quando faco uma solicitacao Get para o servico employees_id
            Entao o codigo de resposta HTTP deve ser igual 200
            E o contrato deve ser valido "schema_get_employee_id.json"
            E será retornado o funcionario especifico do id consultado

            @Consulta_id_inexistente
            Cenario: Consulta de um funcionario inexistente
            Dado o id 9999 do funcionario
            Quando faco uma solicitacao Get para o servico employees_id
            Entao o codigo de resposta HTTP deve ser igual 200
            E o contrato deve ser valido "schema_get_employee_id_inexis.json"
            E será retornado response nulo