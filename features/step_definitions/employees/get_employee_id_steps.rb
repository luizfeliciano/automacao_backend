# frozen_string_literal: true

Dado('o id {int} do funcionario') do |id|
  @id = id
end

Quando('faco uma solicitacao Get para o servico employees_id') do
  @response = RequestEmployees.new.get_employees_id(Headers.new.padrao, @id)
end

Entao('será retornado o funcionario especifico do id consultado') do
  expect(@response.parsed_response['status']).to_not be_nil
  expect(@response.parsed_response['data']).to_not be_nil
  expect(@response.parsed_response['message']).to_not be_nil
  expect(@response.parsed_response['data']).to have_key 'id'
  expect(@response.parsed_response['data']).to have_key 'employee_name'
  expect(@response.parsed_response['data']).to have_key 'employee_salary'
  expect(@response.parsed_response['data']).to have_key 'employee_age'
  expect(@response.parsed_response['data']).to have_key 'profile_image'
end

Entao('será retornado response nulo') do
  expect(@response.parsed_response['status']).to_not be_nil
  expect(@response.parsed_response['data']).to be_nil
  expect(@response.parsed_response['message']).to_not be_nil
end