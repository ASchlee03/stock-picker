def stock_picker(prices)
  max_profit = 0
  best_days = [0, 0]
  min_price = prices[0]
  
  prices.each_with_index do |price, day|
    if price < min_price
      min_price = price
    elsif price - min_price > max_profit
      max_profit = price - min_price
      best_days = [prices.index(min_price), day]
    end
  end

  [best_days, max_profit]
end

puts "Enter a list of stock prices separated by spaces (e.g. 17 3 6 9 15): "
prices = gets.chomp.split.map(&:to_i)
result, profit = stock_picker(prices)
puts "The best days to buy and sell are on days #{result[0]+1} and #{result[1]+1}, respectively, for a profit of $#{profit}."
