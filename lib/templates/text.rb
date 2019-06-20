class Text
    def initialize(text: )
        @text = text
    end

    def to_s
        "<p style=\"margin-left:1.5em;\">#{@text.lines(chomp:true).join("<br />")}</p>".gsub(/\>\ +\</,"><").gsub(/^\ +/,"").chomp
    end
end