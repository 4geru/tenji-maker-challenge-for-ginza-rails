# frozen_string_literal: true

class TenjiAnalizer
  TEMPLATE_JAPANESE_MAP = %w[
    あいうえお
    かきくけこ
    さしすせそ
    たちつてと
    なにぬねの
    はひふへほ
    まみむめも
    らりるれろ
  ]

  def word_position_detector(word)
    TEMPLATE_JAPANESE_MAP.each_with_index do |line, index|
      if line.index(word)
        return [index, line.index(word)]
      end
    end

    nil
  end
end
