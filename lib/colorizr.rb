class String
  @@color_names = ["red", "green", "yellow", "blue", "pink", "light_blue", "white", "light_grey", "black"]

  def self.create_colors
    color_codes = ["0;31", "0;32", "1;33", "0;34", "0;35", "1;34", "1;37", "1;30", "0;30"]
    (0..@@color_names.count-1).each do |index|
      self.send(:define_method, @@color_names[index]) do
        "\e[#{color_codes[index]}m#{self}\e[0m"
      end
    end
  end

  def self.colors
    @@color_names.map { |name| name.to_sym }
  end

  def self.sample_colors
    @@color_names.each do |name|
      puts "This is " + "#{name}".public_send(name)
    end
  end
end

String.create_colors