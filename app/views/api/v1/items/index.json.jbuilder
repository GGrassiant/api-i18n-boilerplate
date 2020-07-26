# frozen_string_literal: true

json.array! @items do |item|
  json.extract! item, :id, :name, :description
end
