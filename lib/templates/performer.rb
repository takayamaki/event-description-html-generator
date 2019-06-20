class Performer
    def initialize(name: ,image: "",resident: "",profile: "",comment: "")
        @name = name
        @resident = Array(resident)
        @profile = profile
        @comment = comment
        @image = image
    end

    def to_s
        "<h4 style=\"font-size:1.5em;\"><strong>#{@name}</strong></h4>
        <img src=\"#{@image}\" width=\"150\" alt=\"\" style=\"float:right;margin:1.5em;\" />
        <h5 style=\"font-size:1.1em;\">所属</h5>
        <p style=\"margin-left:1.5em;\">#{@resident.join(", ")}</p>
        <h5 style=\"font-size:1.1em;\">プロフィール</h5>
        <p style=\"margin-left:1.5em;\">#{@profile.lines(chomp:true).join("<br />")}</p>
        <h5 style=\"font-size:1.1em;\">ひとこと</h5>
        <p style=\"margin-left:1.5em;\">#{@comment.lines(chomp:true).join("<br />")}</p>
        <hr style=\"clear:both;\" />".gsub(/\>\ +\</,"><").gsub(/^\ +/,"").chomp
    end
end