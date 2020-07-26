# frozen_string_literal: true

# Item model, with any validations or scopes
class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  translates :name, :description, touch: true

  def cache_key
    super + '-' + Globalize.locale.to_s
  end
end
