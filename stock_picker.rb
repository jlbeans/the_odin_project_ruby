def stock_picker(prices_arr)
  highest_profit_days=[0,0]
  highest_profit=0

  prices_arr.each_with_index do |buy_price,buy_day|
    prices_arr.each_with_index do |sell_price,sell_day|

      next if sell_day <= buy_day

      if (sell_price - buy_price) >= highest_profit
        highest_profit=(sell_price - buy_price)
        highest_profit_days[0]=buy_day
        highest_profit_days[-1]=sell_day
      end
    end
  end

  highest_profit_days
end

p stock_picker([4,10,2,15,1])
p stock_picker([17,3,6,9,15,8,6,1,10])
