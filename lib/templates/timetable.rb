class TimeTable
    def initialize(ttrows)
        @rows = ttrows.map do |row,params|
            params = params.dup
            case row.to_s.to_i % 2
                when 0
                    params[:color] = "#b7d2ff"
                when 1 
                    params[:color] = "#d8e7ff"
            end

            TTRow.new(params.map do |k,v| [k.to_sym,v] end.to_h)
        end

    end

    def to_s
        header = "<table style=\"width:85%;margin:auto;font-size:1.5em;\">
        <thead><tr style=\"background-color:#31a0f5;color:#ffffff;text-align:center;\"><th><strong>START</strong></th><th><strong>END</strong></th><th><strong>DJ</strong></th><th style=\"font-size:.66em;\">VJ</th></tr></thead><tbody>"

        content = @rows.inject("") do |rslt,row|
            "#{rslt}#{row.to_s}"
        end
        footer = "
        </tbody></table>"

        "#{header}#{content}#{footer}".gsub(/\>\ +\</,"><").gsub(/^\ +/,"")
    end
end

class TTRow
    def initialize(startTime: ,endTime: ,dj: ,vj: ,color:)
        @start = num2time startTime
        @end = num2time endTime 
        @dj = dj
        @vj = vj
        @color = color
    end

    def to_s
        "
        <tr style=\"background-color:#{@color};\"><td><strong>#{@start}</strong></td><td><strong>#{@end}</strong></td><td><strong>#{@dj}</strong></td><td style=\"font-size:.66em;\">#{@vj}</td></tr>
        ".gsub(/\>\ +\</,"><").gsub(/^\ +/,"").chomp
    end

    private
    def num2time(time)
        raise if time == 0
        hour = padding(time / 100)
        min = padding(time % 100)

        return "#{hour}:#{min}"
    end
    
    def padding(num)
        if num < 0
            raise
        elsif num < 10
            return "0#{num}"
        else
            return num.to_s
        end
    end
end