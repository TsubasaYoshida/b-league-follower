module ApplicationHelper
  def format_math_sign(value)
    if value.nil?
      '-'
    elsif value > 0
      "+#{number_with_delimiter value}"
    elsif value == 0
      "±#{number_with_delimiter value}"
    else
      number_with_delimiter value
    end
  end
end
