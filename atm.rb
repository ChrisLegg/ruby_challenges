require 'rspec'

def atm total, denominations
  withdraw = denominations.inject({}) do |hash, denomination|
    hash[denomination] = total.divmod(denomination).first
    total = total.divmod(denomination).last
    hash
  end
end

describe 'ATM' do
  it 'disepenses the correct denominations to users' do
    expect(atm 110, [100,20,10,5]).to eq({100=>1, 20=>0, 10=>1, 5=>0})
    expect(atm 245, [20, 10, 5]).to eq({20=>12, 10=>0, 5=>1})
  end
end
