            # language: pt
            # encoding: utf-8

            @Funcionarios
            Funcionalidade: Excluir um funcionario
            Como consumidor,
            Desejo realizar exclusão de um funcionario
            
            @exclui_funcionario
            Cenario: Excluir funcionario
            Dado o id do funcionario
            Quando faco uma solicitacao DELETE para o servico delete
            Entao o codigo de resposta HTTP deve ser igual 200
            E o contrato deve ser valido "schema_delete.json"
            E será retornado mensagem "Successfully! Record has been deleted"