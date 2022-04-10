class RequestEmployees
  def get_employees(header)
    Http.get('/employees', headers: header)
  end

  def get_employees_id(header, id)
    Http.get("/employee/#{id}", headers: header)
  end

  def post_transfers(headers, body, account_id)
    Http.post("/prepay-holder/v1/accounts/#{account_id}/transactions/transfers",
              headers: headers,
              body: body)
  end

  def get_transfers_transactions_hash_id(headers, account_id, transactions_hash_id)
    Http.get("/prepay-holder/v1/accounts/#{account_id}/transactions/#{transactions_hash_id}",
             headers: headers)
  end

  def post_backoffice_transfers(headers, body, account_id)
    Http.post("/prepay-backoffice/v1/accounts/#{account_id}/transactions/backoffice-transfers",
              headers: headers,
              body: body)
  end
end
