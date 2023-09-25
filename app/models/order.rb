class Order < ApplicationRecord
    self.primary_key = :OrderID

    belongs_to :customer,   foreign_key: :CustomerID, 
                            primary_key: :CustomerID

    scope :between, ->(start_date, end_date) { where(OrderDate: start_date..end_date) }
end
