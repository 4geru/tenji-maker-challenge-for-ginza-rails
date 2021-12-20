require "spec_helper"
require "./lib/tenji_analizer"

describe "TenjiAnalizer" do
  describe '.word_detector' do
    subject { TenjiAnalizer.new.word_detector(word) }
    # context 'あのとき' do
    #   let(:word) { 'あ' }
    #   it "1が返ってくる" do
    #     expect(subject).to eq(1)
    #   end
    # end
    fcontext 'さのとき' do
      let(:word) { 'さ' }
      it "49が返ってくる" do
        expect(subject).to eq(49)
      end
    end
  end

  describe '.word_position_detector' do
    subject { TenjiAnalizer.new.word_position_detector(word) }
    context 'あのとき' do
      let(:word) { 'あ' }
      it "[0, 0]が返ってくる" do
        expect(subject).to eq([0, 0])
      end
    end

    context 'ろのとき' do
      let(:word) { 'ろ' }
      it "[7, 4]が返ってくる" do
        expect(subject).to eq([7, 4])
      end
    end

    context 'よのとき' do
      let(:word) { 'よ' }
      it "nilが返ってくる" do
        expect(subject).to eq(nil)
      end
    end
  end
end
