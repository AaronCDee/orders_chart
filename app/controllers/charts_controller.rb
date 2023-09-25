class ChartsController < ApplicationController
    def orders_by_customer
        @order_count = Order.joins(:customer).order(CompanyName: :asc).group(:CompanyName).count
    end

    def orders_by_month
        @order_count = Order.between(params[:start_date] == "" ? nil : params[:start_date], params[:end_date] == "" ? nil : params[:end_date])
                        .order(OrderDate: :asc)
                        .group("STRFTIME('%m-%Y', OrderDate)")
                        .count
    end

    def orders_by_country
        @order_count = Order.joins(:customer).order(Country: :asc).group(:Country).count
    end
end
