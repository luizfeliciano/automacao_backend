# frozen_string_literal: true

Quando('faco uma solicitacao Get para o servico employees') do
  @response = RequestEmployees.new.get_employees(Headers.new.padrao)
end

Entao('o codigo de resposta HTTP deve ser igual {int}') do |statuscode|
  expect(@response.code).to eq statuscode
end

Entao('o contrato deve ser valido {string}') do |schema|
  expect(JSON::Validator.validate!("#{@schema_path}#{schema}", @response.body)).to eql true
end

Entao('será retornado todos os funcionarios cadastrados') do
  expect(@response.parsed_response['status']).to_not be_nil
  expect(@response.parsed_response['data']).to_not be_nil
  expect(@response.parsed_response['message']).to_not be_nil

  @response.parsed_response['data'].each do | func |
    expect(func).to have_key 'id'
    expect(func).to have_key 'employee_name'
    expect(func).to have_key 'employee_salary'
    expect(func).to have_key 'employee_age'
    expect(func).to have_key 'profile_image'
  end
end
