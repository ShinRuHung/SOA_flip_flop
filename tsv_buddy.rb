# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split("\n").map { |line| line.split("\t") }
    tsv_headers = rows.first
    @data = rows[1..].map { |row| tsv_headers.zip(row).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    @data << ''
    @data.reduce { |n1, n2| "#{n1}\n#{n2}" }
  end
end
