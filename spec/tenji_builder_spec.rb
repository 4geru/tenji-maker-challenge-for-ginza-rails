require "spec_helper"
require "./lib/tenji_builder"

describe "TenjiBuilder" do
  describe '.builder' do
    subject { TenjiBuilder.new.builder(numbers) }
    context '1文字のとき' do
      context 'あのとき' do
        let(:numbers) { [1] }
        let(:expect_word) do
          <<~TEXT
            o-
            --
            --
          TEXT
        end
        it do
          expect(subject).to eq(expect_word)
        end
      end

      context 'いのとき' do
        let(:numbers) { [3] }
        let(:expect_word) do
          <<~TEXT
            o-
            o-
            --
          TEXT
        end
        it do
          expect(subject).to eq(expect_word)
        end
      end

      context 'ろのとき' do
        let(:numbers) { [26] }
        let(:expect_word) do
          <<~TEXT
            -o
            oo
            --
          TEXT
        end
        it do
          expect(subject).to eq(expect_word)
        end
      end
    end

    context '複数文字のとき' do
      context 'いぬのとき' do
        let(:numbers) { [3, 13] }
        let(:expect_word) do
          <<~TEXT
            o- oo
            o- --
            -- o-
          TEXT
        end
        it do
          expect(subject).to eq(expect_word)
        end
      end
    end
  end
end
