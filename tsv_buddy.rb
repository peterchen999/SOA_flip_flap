# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split(/\n/)
    rows = lines.map { |line| line.split("\t") }
    keys = lines.first.split("\t")
    @data = rows[1..].map { |line| keys.zip(line).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    file_str = generate_title_str(data.first.keys, '')
    generate_data_str(data, file_str)
  end
end

def generate_title_str(titles, file_str)
  titles.each do |val|
    file_str << val
    file_str << "\t"
  end
  file_str = file_str.chop
  file_str << "\n"
  file_str
end

def generate_data_str(yml_array, file_str)
  yml_array.each do |val|
    val.each do |_key, value|
      file_str << value
      file_str << "\t"
    end
    file_str = file_str.chop
    file_str << "\n"
  end
  file_str
end
