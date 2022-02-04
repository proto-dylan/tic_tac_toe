# frozen_string_literal: true

require './lib/tic_tac_toe'

describe Board do
  subject(:board) { described_class.new }

  describe '#valid_move?' do
    it '1 is valid move' do
      test_move = board.valid_move?('1')
      expect(test_move).to be true
    end
    it '9 is valid move' do
      test_move = board.valid_move?('9')
      expect(test_move).to be true
    end
    it 'g is not a valid move' do
      test_move = board.valid_move?('g')
      expect(test_move).to be false
    end
  end
  
   
  

end
