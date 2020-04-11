class Payrol

  TOTAL_MONTH = 12
  ONE         = 1

  def initialize
    # intial_input_from_user
    p 'Enter starting_point'
    @starting_point = gets.chomp.to_i

    p 'Enter the salary'
    @value = gets.chomp.to_i

    p 'Enter the number of years'
    @fiscal_year = gets.chomp.to_i
  end

  def month_finder
    initial_array = [@starting_point]
    (@fiscal_year * TOTAL_MONTH).times do |time_count|
      next if time_count.zero?
      initial_array << initial_array[time_count - 1] + @starting_point
    end
    output_month = find_index_as_per_month(initial_array, @value)

    p "Your month is #{output_month}"
  end

  def find_index_as_per_month(value_array, value)
    array_index = value_array.find_index(value)
    find_month(array_index)
  end

  def find_month(index)
    new_index = index > (TOTAL_MONTH - 1) ? (index % TOTAL_MONTH) : index
    new_index + 1
  end
end

Payrol.new.month_finder