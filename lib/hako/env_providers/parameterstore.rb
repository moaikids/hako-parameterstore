# frozen_string_literal: true

require 'hako/env_provider'
require 'aws-sdk-ssm'

module Hako
  module EnvProviders
    class Parameterstore < EnvProvider
      # @param [Pathname] _root_path
      # @param [Hash<String, Object>] options
      def initialize(_root_path, options)
        @client = options['client'] || Aws::SSM::Client.new
      end

      # @param [Array<String>] variables
      # @return [Hash<String, String>]
      def ask(variables)
        env = {}
        variables.each do |key|
          val = get_value_from_parameterstore(key)
          if val
            env[key] = val
          end
        end
        env
      end

      # @return [Boolean]
      def can_ask_keys?
        true
      end

      # @param [Array<String>] variables
      # @return [Array<String>]
      def ask_keys(variables)
        keys = []
        read_parameters_from_parameterstore.each do |parameter, _|
          if variables.include?(parameter.name)
            keys << parameter.name
          end
        end
        keys
      end

      private

      # @return [Hash<String, Integer>]
      def read_parameters_from_parameterstore
        resp = @client.describe_parameters({})
        resp.parameters
      end

      # @param [String] key
      # @return [String]
      def get_value_from_parameterstore(key)
        val = nil
        begin
          resp = @client.get_parameter({name: key , with_decryption: true})
          if resp.parameter
            val = resp.parameter.value
          end
        rescure
        end
        val
      end
    end
  end
end
