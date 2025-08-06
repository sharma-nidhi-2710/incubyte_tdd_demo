require 'spec_helper'

describe "Add the numbers in a string" do
  it "returns 0 for an empty string" do
    expect(StringCalculator.add("")).to eq(0)
  end

  it "returns the sum of comma-separated numbers" do
    expect(StringCalculator.add("1,2")).to eq(3)
    expect(StringCalculator.add("1,2,3")).to eq(6)
  end
end
