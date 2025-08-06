require 'spec_helper'

describe "Add the numbers in a string" do
  it "returns 0 for an empty string" do
    expect(StringCalculator.add("")).to eq(0)
  end

  it "returns the sum of comma-separated numbers" do
    expect(StringCalculator.add("1,2")).to eq(3)
    expect(StringCalculator.add("1,2,3")).to eq(6)
  end

  it "supports newlines as delimiters" do
    expect(StringCalculator.add("1\n2,3")).to eq(6)
  end

  it "supports custom single-character delimiters" do
    expect(StringCalculator.add("//;\n1;2")).to eq(3)
  end

  it "raises an error when negative numbers are present" do
    expect {
      StringCalculator.add("1,-2,3,-4")
    }.to raise_error("Negatives not allowed: -2, -4")
  end
end
