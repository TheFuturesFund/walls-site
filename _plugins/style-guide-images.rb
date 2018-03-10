module Jekyll
  class StyleGuideImages < Converter
    priority :low

    def matches(ext)
      true
    end

    def output_ext(ext)
      '.html'
    end

    def convert(content)
      content.gsub("<StyleGuideImages/>", images_html)
    end

    def images_html
      swatches = image_file_paths.map do |path|
        image_swatch_for_path(path)
      end.join("\n")
      "<div class='swatches'>\n#{swatches}\n</div>"
    end

    def image_swatch_for_path(path)
      "<div class='swatch swatch-img'><img src='/#{path}'><span>/#{path}</span></div>"
    end

    def image_file_paths
      Dir['img/**/*\.*']
    end
  end
end
