require 'yaml'
require 
class Bot
  def initialize(bot_name, data_file)
    @name = bot_name || "Lars"
    begin
      @data = YAML.load(File.read(data_file))
    rescue
      raise "#{@name} can't load it's brain!"
    end
  end

  def greeting

  end

  def response_for(user_input)

  end
end
