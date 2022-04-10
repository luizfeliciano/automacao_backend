class RequestEmployees
  def get_employees(header)
    Http.get('/employees', headers: header)
  end

  def get_employees_id(header, id)
    Http.get("/employee/#{id}", headers: header)
  end

  def post_create(header, body)
    Http.post('/create', headers: header, body: body)
  end

  def put_update(header, body, id)
    Http.put("/update/#{id}", headers: header, body: body)
  end

  def delete(header, id)
    Http.delete("/delete/#{id}", headers: header)
  end
end
