json.extract! employee, :id, :name, :position, :store_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
