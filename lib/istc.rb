class ISTC

  class Version #:nodoc:
    Major = 1
    Minor = 0
    Tiny  = 0

    String = [Major, Minor, Tiny].join('.')
  end

  def initialize(str)
    @number = str.to_s
  end

  def valid?
    ISTC.valid? @number
  end

  def agency
    return nil unless valid?
    @number[0,3]
  end

  def year
    return nil unless valid?
    @number[3,4]
  end

  def work
    return nil unless valid?
    @number[7,8]
  end

  def check
    return nil unless valid?
    @number[15,1]
  end

  # output a hyphenated version of this ISTC
  def to_s
    return nil unless valid?
    "#{agency}-#{year}-#{work}-#{check}"
  end

  def self.valid?(istc)
    istc = istc.to_s
    istc.length == 16 && istc == ISTC.complete(istc[0,15])
  end

  # Purely for generating new ISTC numbers
  #
  def self.complete(num)
    num = num.to_s
    return nil unless num.length == 15 && num.match(/[\dA-Fa-f]{11}/)

    #puts num
    arr = (0..14).to_a.collect do |i|
      if i == 0 || i % 4 == 0
        num[i,1].hex * 11
      elsif i % 4 == 1
        num[i,1].hex * 9
      elsif i % 4 == 2
        num[i,1].hex * 3
      else
        num[i,1].hex * 1
      end
    end
    #puts arr.inspect
    sum = arr.inject { |sum, n| sum + n }
    remainder = sum % 16
    check = remainder.to_s(16).upcase

    "#{num}#{check}"
  end
end
