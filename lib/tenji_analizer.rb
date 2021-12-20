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
  # あ：1
  # い：1, 2
  # う：1, 4
  # え：1, 2, 4
  # お：2, 4
  BOIN = [1, 3, 5, 11, 10]
  # あ：なし
  # か：6
  # さ：5, 6
  # た：3, 5
  # な：3
  # は：3, 6
  # ま：3, 5, 6
  # ら：5
  SHIIN = [0, 32, 48, 20, 4, 36, 52, 16]

  def word_detector(word)
    shiin, boin = word_position_detector(word)
    word_binary_detector(boin, shiin)
  end

  def word_binary_detector(boin, shiin)
    BOIN[boin] | SHIIN[shiin]
  end

  def word_position_detector(word)
    TEMPLATE_JAPANESE_MAP.each_with_index do |line, index|
      if line.index(word)
        return [index, line.index(word)]
      end
    end

    nil
  end
end
