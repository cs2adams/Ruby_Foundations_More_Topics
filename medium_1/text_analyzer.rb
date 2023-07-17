class TextAnalyzer
  def process
    text = File.read("sample_text.txt")
    yield(text)
  end
end

analyzer = TextAnalyzer.new

analyzer.process do |text|
  num_paras = text.split("\n\n").size
  puts "#{num_paras} paragraphs"
end

analyzer.process do |text|
  num_lines = text.split("\n").size
  puts "#{num_lines} lines"
end

analyzer.process do |text|
  num_words = text.split.size
  puts "#{num_words} words"
end


