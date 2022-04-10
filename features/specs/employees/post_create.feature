            # language: pt
            # encoding: utf-8

            @Funcionarios
            Funcionalidade: Criar novo funcionario
            Como consumidor,
            Desejo realizar a criação de um novo funcionario
            
            @cria_funcionario
            Cenario: Cria um funcionario
            Dado o body 'body_create.json'
            Quando faco uma solicitacao Post para o servico create
            Entao o codigo de resposta HTTP deve ser igual 200
            E o contrato deve ser valido "schema_post_create.json"
            E será retornado os dados do funcionario criado