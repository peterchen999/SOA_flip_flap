# Module that can be included (mixin) to take and output Yaml data
require 'yaml'
module YamlBuddy
  # take_yaml: converts a String with YAML data into @data
  # parameter: yaml - a String in YAML format
  def take_yaml(yaml)
    @data = YAML.load(yaml)
  end

  # to_yaml: converts @data into yaml string
  # returns: String in YAML format
  def to_yaml
    data.to_yaml
  end
end