# frozen_string_literal: true

require 'yaml'

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  def retrieve_key(input_hash)
    arr = input_hash.map { |k, _v| k }
    arr.reduce { |n1, n2| "#{n1}\t#{n2}" }
  end

  def retrieve_value(input_hash)
    arr = input_hash.map { |_k, v| v }
    arr.reduce { |n1, n2| "#{n1}\t#{n2}" }
  end

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_yaml(yaml)
    rows = YAML.safe_load(yaml)
    @data = rows.map { |data| retrieve_value(data) }
    @data.insert(0, retrieve_key(rows[0]))
    @data.reduce { |n1, n2| "#{n1}\n#{n2}" }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_yaml
    @data.to_yaml
  end
end
