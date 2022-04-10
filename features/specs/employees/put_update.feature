            # language: pt
            # encoding: utf-8

            @Funcionarios
            Funcionalidade: Atualizar dados de um funcionario
            Como consumidor,
            Desejo realizar a atualização dos dados de um funcionario
            
            @atualiza_funcionario
            Cenario: Atualizar dados de um funcionario
            Dado o body 'body_create.json'
            E o id do funcionario
            Quando faco uma solicitacao PUT para o servico update
            Entao o codigo de resposta HTTP deve ser igual 200
            E o contrato deve ser valido "schema_post_create.json"
            E será retornado os dados do funcionario atualizado