# Load the rails application
if RUBY_VERSION =~ /1.9/
        Encoding.default_external = Encoding::UTF_8
        Encoding.default_internal = Encoding::UTF_8
    end

require File.expand_path('../application', __FILE__)

ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML)
ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::YAML)

ActiveSupport::XmlMini::PARSING.delete("symbol")
ActiveSupport::XmlMini::PARSING.delete("yaml")

# Initialize the rails application
Enki::Application.initialize!
