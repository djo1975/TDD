class Solver
  def factorial(number)
    raise ArgumentError, 'Argument must be a non-negative integer' if !number.is_a?(Integer) || number.negative?

    result = 1
    (1..number).each do |i|
      result *= i
    end
    result
  end

  def reverse(word)
    word.reverse
  end

  def fizzbuzz(number, mock)
    if mock.divisible_by_3?(number) && mock.divisible_by_5?(number)
      'fizzbuzz'
    elsif mock.divisible_by_3?(number)
      'fizz'
    elsif mock.divisible_by_5?(number)
      'buzz'
    else
      number.to_s
    end
  end
end
