require 'yaml'
Dir.glob("#{__dir__}/lib/templates/*.rb").each do |template|
    require template
end

input = File.open(ARGV[0]) do |yml|
    YAML.load(yml, symbolize_names: true)
end

input.each do |element|
    element.each do |template_class,params|
        puts Object.const_get(template_class).new(params)
    end
end
