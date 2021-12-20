# frozen_string_literal: true

class TenjiBuilder
  def builder(binary_numbers)
    lines = ['', '', '']

    binary_numbers.each_with_index do |binary_number, index|
      # for 1st line
      if binary_number & 9 == 9
        lines[0] += 'oo'
      elsif binary_number & 8 == 8
        lines[0] += '-o'
      elsif binary_number & 1 == 1
        lines[0] += 'o-'
      else
        lines[0] += '--'
      end

      # for 2nd line
      if binary_number & 18 == 18
        lines[1] += 'oo'
      elsif binary_number & 16 == 16
        lines[1] += '-o'
      elsif binary_number & 2 == 2
        lines[1] += 'o-'
      else
        lines[1] += '--'
      end

      # for 3rd line
      if binary_number & 36 == 36
        lines[2] += 'oo'
      elsif binary_number & 32 == 32
        lines[2] += '-o'
      elsif binary_number & 4 == 4
        lines[2] += 'o-'
      else
        lines[2] += '--'
      end

      # 最後の要素以外は、空行を入れる
      if index != binary_numbers.size - 1
        lines[0] += ' '
        lines[1] += ' '
        lines[2] += ' '
      end
    end

    # 最後の行も改行するので、 "\n" を足す
    lines.join("\n") + "\n"
  end
end
