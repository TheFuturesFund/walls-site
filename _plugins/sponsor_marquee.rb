require 'rmagick'

Jekyll::Hooks.register :site, :after_init do
  images_filenames = Dir['img/home/sponsors/*']
  image_list = Magick::ImageList.new
  images_filenames.each do |filename|
    image = read_and_resize_image(filename)
    image_list.push(image) unless image.nil?
  end
  output_image = image_list.append(false)
  output_image.alpha Magick::BackgroundAlphaChannel
  output_image.write('img/home/sponsor_marquee.jpg')
end

def read_and_resize_image(filename)
  image = Magick::Image.read(filename).first
  image.resize_to_fit(9999, 200)
rescue Magick::ImageMagickError => e
  warn "Error reading sponsor '#{filename}' image for marquee: #{e}"
end
