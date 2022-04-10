# frozen_string_literal: true

Quando('faco uma solicitacao PUT para o servico update') do
  @response = RequestEmployees.new.put_update(Headers.new.padrao, @body.to_json, @id)
end

Entao('será retornado os dados do funcionario atualizado') do
  dados = JSON.parse(@body.to_json, object_class: OpenStruct)

  expect(@response.parsed_response['status']).to_not be_nil
  expect(@response.parsed_response['data']).to_not be_nil
  expect(@response.parsed_response['message']).to_not be_nil
  expect(@response.parsed_response['data']).to have_key 'name'
  expect(@response.parsed_response['data']).to have_key 'salary'
  expect(@response.parsed_response['data']).to have_key 'age'
  expect(@response.parsed_response['data']['name']).to eql dados.name
  expect(@response.parsed_response['data']['salary']).to eql dados.salary
  expect(@response.parsed_response['data']['age']).to eql dados.age
end
