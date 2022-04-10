# frozen_string_literal: true

Quando('faco uma solicitacao DELETE para o servico delete') do
  @response = RequestEmployees.new.delete(Headers.new.padrao, @id)
end

Entao('será retornado mensagem {string}') do |msg|
  expect(@response.parsed_response['status']).to_not be_nil
  expect(@response.parsed_response['data']).to_not be_nil
  expect(@response.parsed_response['message']).to_not be_nil
  expect(@response.parsed_response['message']).to eql msg
  expect(@response.parsed_response['data']).to eql @id.to_s
end
