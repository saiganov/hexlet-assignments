# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, :status, :creator, :completed, { presence: true, allow_blank: false }
  validates :completed, inclusion: [true, false]
end
