require 'rmagick'

Jekyll::Hooks.register :site, :after_init do
  images_filenames = Dir['img/home/sponsors/*']
  image_list = Magick::ImageList.new
  images_filenames.each do |filename|
    image = read_and_resize_image(filename)
    break if image.nil?
    image_list.push(image)
    padding_image = Magick::Image.new(30, 100) { self.background_color = 'white' }
    image_list.push(padding_image)
  end
  output_image = image_list.append(false)
  output_image.alpha Magick::BackgroundAlphaChannel
  output_image.write('img/home/sponsor_marquee.jpg')
end

def read_and_resize_image(filename)
  image = Magick::Image.read(filename).first
  image.resize_to_fit(9999, 100)
rescue Magick::ImageMagickError => e
  warn "Error reading sponsor '#{filename}' image for marquee: #{e}"
end
