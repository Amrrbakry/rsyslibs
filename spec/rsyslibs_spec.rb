require 'spec_helper'

RSpec.describe Rsyslibs do
  it 'has a version number' do
    expect(Rsyslibs::VERSION).not_to be nil
  end

  it 'has a valid version number' do
    expect(Rsyslibs::VERSION).to match(/\d+\.\d+\.\d+/)
  end
end
