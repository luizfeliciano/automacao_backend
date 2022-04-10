# frozen_string_literal: true

require "report_builder"

Before do
  @schema_path = "features/support/helpers/schemas/"
end

After do |_scenario|
  @method = if @response.request.http_method == Net::HTTP::Get
      "GET"
    elsif @response.request.http_method == Net::HTTP::Post
      "POST"
    elsif @response.request.http_method == Net::HTTP::Put
      "PUT"
    elsif @response.request.http_method == Net::HTTP::Patch
      "PATCH"
    elsif @response.request.http_method == Net::HTTP::Delete
      "DELETE"
            end

    if @response
    puts "\n\n## REQUEST ##"
    puts "\nMETHOD => #{@method}"
    puts "\nURI => #{@response.request.last_uri}"
    end

  if @response.request.options.include?(:query) == true
    puts "\nPARAMS => #{@response.request.options[:query]}"
  end

  if @response.request.options.include?(:body) == true
    puts "\nBODY REQUEST => #{@response.request.options[:body]}"
  end

  if !@response.body.nil?
    puts "\n\n## RESPONSE ##"
    puts "\nSTATUS CODE => #{@response.code}"
    puts "\nBODY RESPONSE => #{@response.body.force_encoding("UTF-8").to_json}"
  elsif puts "\n\n## RESPONSE ##"
    puts "\nSTATUS CODE => #{@response.code}"
    puts "\nBODY RESPONSE => #{@response.body.to_json}"
  end
end

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = "log/reports.json"
    config.report_path = "log/Report-#{Time.new.strftime("%Y%m%d_%H%M%S")}"
    config.report_types = [:html]
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = "Resultado Automacao API Employees"
    config.compress_images = false
    config.additional_info = { "API" => "Employees" }
  end

  ReportBuilder.build_report
end
