require 'spec_helper'

RSpec.describe Rsyslibs do
  it 'has a version number' do
    expect(Rsyslibs::VERSION).not_to be nil
  end

  it 'has a valid version number' do
    expect(Rsyslibs::VERSION).to match(/\d+\.\d+\.\d+/)
  end
end

RSpec.describe Rsyslibs::Dependencies do
  context '.project_dependencies' do
    context 'when project dependencies are found' do
      before { allow(Bundler.definition).to receive(:dependencies).and_return(project_packages) }

      it 'returns an array of project dependencies names' do
        dependencies_names = Rsyslibs::Dependencies.project_dependencies
        expect(dependencies_names).to be_a(Array)
        expect(dependencies_names).to eq(%w[gem1 gem2 gem3])
      end
    end

    context 'when project dependencies are not found' do
      before { allow(Bundler.definition).to receive(:dependencies).and_raise(Bundler::GemfileNotFound) }

      it 'raises GemfileNotFound exception when it cant find Gemfile or bundle source' do
        expect { Rsyslibs::Dependencies.project_dependencies }.to raise_error(Bundler::GemfileNotFound)
      end
    end
  end

  context '.system_dependencies' do
    context 'successfull fetch' do
      before { allow(Rsyslibs::Request).to receive(:api).and_return(success_syslibs) }

      it 'returns an array of syslibs' do
        syslibs = Rsyslibs::Dependencies.system_dependencies
        expect(syslibs).to be_a(Array)
        expect(syslibs[0].keys).to eq(%w[id name version os os_bits os_vendor project_dependencies])
      end
    end

    context 'failed to fetch' do
      before { allow(Rsyslibs::Request).to receive(:api).and_return(failure_syslibs) }

      it 'returns error message' do
        syslibs = Rsyslibs::Dependencies.system_dependencies
        expect(syslibs).to eq('Failed to fetch system libraries from remote server. Please try again.')
      end
    end
  end
end
