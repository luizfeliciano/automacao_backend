# frozen_string_literal: true

Dado('o body {string}') do |massa|
  @body = carregar_arquivo_massa(massa)
end

Quando('faco uma solicitacao Post para o servico create') do
  @response = RequestEmployees.new.post_create(Headers.new.padrao, @body.to_json)
end

Entao('será retornado os dados do funcionario criado') do
  dados = JSON.parse(@body.to_json, object_class: OpenStruct)

  expect(@response.parsed_response['status']).to_not be_nil
  expect(@response.parsed_response['data']).to_not be_nil
  expect(@response.parsed_response['message']).to_not be_nil
  expect(@response.parsed_response['data']).to have_key 'id'
  expect(@response.parsed_response['data']).to have_key 'name'
  expect(@response.parsed_response['data']).to have_key 'salary'
  expect(@response.parsed_response['data']).to have_key 'age'
  expect(@response.parsed_response['data']['name']).to eql dados.name
  expect(@response.parsed_response['data']['salary']).to eql dados.salary
  expect(@response.parsed_response['data']['age']).to eql dados.age
end
