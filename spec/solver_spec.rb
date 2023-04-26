require_relative '../solver'

RSpec.describe Solver do
  describe '#factorial' do
    context 'when given a non-negative integer' do
      it 'returns the correct factorial value' do
        expect(Solver.new.factorial(0)).to eq(1)
        expect(Solver.new.factorial(1)).to eq(1)
        expect(Solver.new.factorial(2)).to eq(2)
        expect(Solver.new.factorial(3)).to eq(6)
        expect(Solver.new.factorial(4)).to eq(24)
      end
    end

    context 'when given a negative integer' do
      it 'raises an exception' do
        expect { Solver.new.factorial(-1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#reverse' do
    it 'returns the reversed string' do
      expect(Solver.new.reverse('hello')).to eq('olleh')
      expect(Solver.new.reverse('world')).to eq('dlrow')
      expect(Solver.new.reverse('ruby')).to eq('ybur')
    end
  end

  describe '#fizzbuzz' do
    context 'when given an integer that is divisible by 3' do
      it "returns 'fizz'" do
        fizz_mock = double('fizz_mock')
        allow(fizz_mock).to receive(:divisible_by_3?).and_return(true)
        allow(fizz_mock).to receive(:divisible_by_5?).and_return(false)
        expect(Solver.new.fizzbuzz(3, fizz_mock)).to eq('fizz')
        expect(Solver.new.fizzbuzz(9, fizz_mock)).to eq('fizz')
      end
    end

    context 'when given an integer that is divisible by 5' do
      it "returns 'buzz'" do
        buzz_mock = double('buzz_mock')
        allow(buzz_mock).to receive(:divisible_by_3?).and_return(false)
        allow(buzz_mock).to receive(:divisible_by_5?).and_return(true)
        expect(Solver.new.fizzbuzz(5, buzz_mock)).to eq('buzz')
        expect(Solver.new.fizzbuzz(10, buzz_mock)).to eq('buzz')
      end
    end

    context 'when given an integer that is divisible by both 3 and 5' do
      it "returns 'fizzbuzz'" do
        fizzbuzz_mock = double('fizzbuzz_mock')
        allow(fizzbuzz_mock).to receive(:divisible_by_3?).and_return(true)
        allow(fizzbuzz_mock).to receive(:divisible_by_5?).and_return(true)
        expect(Solver.new.fizzbuzz(15, fizzbuzz_mock)).to eq('fizzbuzz')
        expect(Solver.new.fizzbuzz(30, fizzbuzz_mock)).to eq('fizzbuzz')
      end
    end

    context 'when given an integer that is not divisible by 3 or 5' do
      it 'returns the integer as a string' do
        integer_mock = double('integer_mock')
        allow(integer_mock).to receive(:divisible_by_3?).and_return(false)
        allow(integer_mock).to receive(:divisible_by_5?).and_return(false)
        expect(Solver.new.fizzbuzz(7, integer_mock)).to eq('7')
        expect(Solver.new.fizzbuzz(19, integer_mock)).to eq('19')
      end
    end
  end
end
