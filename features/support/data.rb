# frozen_string_literal: true

# module para globalizar a chamada de massa
module DataLoad
  def buscar_massa
    path = "/helpers/massas/massas_teste"
    YAML.load_file(File.dirname(__FILE__) + "#{path}.yml")
  end

  def carregar_arquivo_massa(nome_arquivo)
    massa = File.read(
      "#{Dir.pwd}/features/support/helpers/massas/#{nome_arquivo}"
    )
    JSON.parse(massa)
  end
end
