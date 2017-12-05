# frozen_string_literal: true

require 'spec_helper'
require 'hako/env_providers/parameterstore'

RSpec.describe Hako::EnvProviders::Parameterstore do
  let(:options) {}

  describe '#ask' do
    let(:stub_client) do
      allow(Aws::SSM::Client.new).to receive(:get_parameter).and_return('veryverysecret')
    end
    it 'returns known variables' do
      expect(described_class.new(fixture_root, client: stub_client).ask(['password'])).to eq('password' => 'veryverysecret')
    end
  end

  describe '#ask_empty' do
    let(:stub_client) do
      allow(Aws::SSM::Client.new).to receive(:get_parameter)
    end
    it 'returns empty to unknown variables' do
      expect(described_class.new(fixture_root, client: stub_client).ask(['undefined'])).to eq({})
    end
  end

  describe '#ask_keys' do
    let(:stub_client) do
      allow(Aws::SSM::Client.new).to receive(:describe_parameters).and_return(['password'])
    end
    it 'returns known variables' do
      expect(described_class.new(fixture_root, client: stub_client).ask_keys(%w[password undefined])).to match_array(['password'])
    end
  end
end
