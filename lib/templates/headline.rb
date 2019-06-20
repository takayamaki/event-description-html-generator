class H3
    def initialize(text: ,color:"#003366" ,fontSize:2.5,content:nil)
        @text = text
        @color = color
        @fontSize = fontSize
        @content = content
    end

    def to_s
        "<h3 style=\"color:#{@color};font-size:#{@fontSize}em;\">#{@text.lines(chomp:true).join("<br />")}</h3>
        #{"<p style=\"margin-left:1.5em;\">#{@content.lines(chomp:true).join("<br />")}</p>" if @content}".gsub(/\>\ +\</,"><").gsub(/^\ +/,"").chomp
    end
end

class H4
    def initialize(text: ,color:"#006699" ,fontSize:1.8,content:nil)
        @text = text
        @color = color
        @fontSize = fontSize
        @content = content
    end

    def to_s
        "<h4 style=\"color:#{@color};font-size:#{@fontSize}em;\">#{@text.lines(chomp:true).join("<br />")}</h4>
        #{"<p style=\"margin-left:1.5em;\">#{@content.lines(chomp:true).join("<br />")}</p>" if @content}".gsub(/\>\ +\</,"><").gsub(/^\ +/,"").chomp
    end
end