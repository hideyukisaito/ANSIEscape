# -*- coding: utf-8 -*-

# Usage:
#
# options = {
#   :color => ANSIEscape::YELLOW,
#   :bgcolor => ANSIEscape::BG_BLACK,
#   :decorate => [
#     ANSIEscape::BLINK,
#     ANSIEscape::UNDERSCORE
#   ]
# }
#
# puts ANSIEscape::color_and_deco("Hello World!", options)

module ANSIEscape
  # decorations
  ALL_ATTR_OFF  = "\e[0m"
  BOLD          = "\e[1m"
  UNDERSCORE    = "\e[4m"
  BLINK         = "\e[5m"
  REVERSE_VIDEO = "\e[7m"
  CONCEALED     = "\e[8m"
  
  # text colors
  BLACK   = "\e[30m"
  RED     = "\e[31m"
  GREEN   = "\e[32m"
  YELLOW  = "\e[33m"
  BLUE    = "\e[34m"
  MAGENTA = "\e[35m"
  CYAN    = "\e[36m"
  WHITE   = "\e[37m"
  
  # background colors
  BG_BLACK   = "\e[40m"
  BG_RED     = "\e[41m"
  BG_GREEN   = "\e[42m"
  BG_YELLOW  = "\e[43m"
  BG_BLUE    = "\e[44m"
  BG_MAGENTA = "\e[45m"
  BG_CYAN    = "\e[46m"
  BG_WHITE   = "\e[47m"
  
  # end of sequence
  EOL = "\e[0m"
  
  COLOR_OPTIONS = [:color, :bgcolor]
  
  def decorate(str, options)
    return str if options.nil?
    p str
    es = ""
    if options.instance_of?(Array)
      options.each { |d| es << d }
    else
      es = options
    end
    
    es + str.to_s + ANSIEscape::EOL
  end
  
  def colorize(str, options)
    return str if options.nil?
    
    es = ""
    COLOR_OPTIONS.each { |k| es << options[k] }
    es + str.to_s + ANSIEscape::EOL
  end
  
  def color_and_deco(str, options)
    return str if options.nil? || !options.instance_of?(Hash)
    
    str = colorize(str, {:color => options[:color] || "", :bgcolor => options[:bgcolor] || ""})
    str = decorate(str, options[:decorate])
  end
  
  module_function :decorate, :colorize, :color_and_deco
end

options = {
 :color => ANSIEscape::YELLOW,
 :bgcolor => ANSIEscape::BG_BLACK,
 :decorate => [
   ANSIEscape::BLINK,
   ANSIEscape::UNDERSCORE
  ]
}

puts ANSIEscape::color_and_deco("Hello World!", options)