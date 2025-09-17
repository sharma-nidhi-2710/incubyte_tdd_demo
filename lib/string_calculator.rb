class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiter, numbers_string = extract_delimiter_and_numbers(input)
    numbers = split_numbers(numbers_string, delimiter)
    check_for_negatives(numbers)

    input.include?('multiply') ? multiply(numbers) : numbers.sum
  end

  private

  def self.extract_delimiter_and_numbers(input)
    if input.start_with?("//")
      parts = input.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2])
      numbers_string = parts[1]
      [delimiter, numbers_string]
    else
      [/[\n,]/, input]
    end
  end

  def self.split_numbers(numbers_string, delimiter)
    numbers_string.split(/#{delimiter}/).map(&:to_i)
  end

  def self.check_for_negatives(numbers)
    negative_numbers = numbers.select { |n| n < 0 }
    if negative_numbers.any?
      raise "Negatives not allowed: #{negative_numbers.join(', ')}"
    end
  end

  def self.multiply(numbers)
    multiply = 1
    numbers.map do |num|
      multiply *= num
    end
    multiply
  end
end
