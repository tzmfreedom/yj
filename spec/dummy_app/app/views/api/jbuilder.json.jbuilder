json.string_property @string
json.integer_property 123
json.array_property @integers
json.object_property do
  json.single_partial do
    json.partial! 'api/record', locals: { record: { a: 123, b: 100 } }
  end

  json.collection_partial do
    json.partial! 'api/record', collection: @records, as: :record
  end
end
