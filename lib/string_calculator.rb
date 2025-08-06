class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiter = /[\n,]/
    if input.start_with?("//")
      parts = input.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2])
      input = parts[1]
    end

    numbers = input.split(/#{delimiter}/).map(&:to_i)

    negative_numbers = numbers.select { |n| n < 0 }
    if negative_numbers.any?
      raise "Negatives not allowed: #{negative_numbers.join(', ')}"
    end

    numbers.sum
  end
end
