require 'spec_helper'

RSpec.describe Rsyslibs::OperatingSystemInfo do
  context '.os_info' do
    before { allow(OS).to receive(:report).and_return(os_info) }

    it 'returns a hash of operating system info' do
      os_report = Rsyslibs::OperatingSystemInfo.os_info
      expect(os_report).to be_a(Hash)
      expect(os_report.keys).to eq(%i[os os_vendor os_bits ruby_platform])
    end
  end

  context '.os_name' do
    context 'when os is MacOS' do
      before { allow(OS).to receive(:mac?).and_return(true) }

      it 'returns MacOS' do
        expect(Rsyslibs::OperatingSystemInfo.os_name).to eq('MacOS')
      end
    end

    context 'when os is Linux' do
      before { allow(OS).to receive(:mac?).and_return(false) }
      before { allow(OS).to receive(:linux?).and_return(true) }

      it 'returns MacOS' do
        expect(Rsyslibs::OperatingSystemInfo.os_name).to eq('Linux')
      end
    end

    context 'when os is not macOS or linux' do
      before { allow(OS).to receive(:mac?).and_return(false) }
      before { allow(OS).to receive(:linux?).and_return(false) }

      it 'returns Unknown os message' do
        expect(Rsyslibs::OperatingSystemInfo.os_name).to eq('Unknown OS')
      end
    end
  end
end
