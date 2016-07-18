require 'rolodex/sass'

module Rolodex
  class << self
    # Inspired by bootstrap-sass
    def load!
      if defined?(::Rails)
        require 'rolodex/engine'
      elsif defined?(:Sprockets)
        Sprockets.append_path(File.join(asset_path, 'stylesheets'))
        Sprockets.append_path(File.join(asset_path, 'javascripts'))
      end
    end

    def gem_path
      @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
    end

    def asset_path
      @asset_path ||= File.join gem_path, 'src'
    end
  end
end

Rolodex.load!
