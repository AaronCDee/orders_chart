class Customer < ApplicationRecord
    self.primary_key = :CustomerID
    
    has_many    :orders,        foreign_key: :CustomerID, 
                                primary_key: :CustomerID

    validates   :CustomerID,    presence: true, 
                                uniqueness: :true
end
