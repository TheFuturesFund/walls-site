require 'rmagick'

mural_folders = Dir['img/murals/*'].map do |filename|
  filename.match(/img\/murals\/wall_\d{3}/)
end.uniq

def create_center(folder)
  filename = Dir["#{folder}/center.*"].first
  return if filename.nil?
  image = Magick::Image.read(filename).first
  return if image.columns == 700
  image.resize_to_fit!(700, 9999)
  File.delete(filename)
  image.write(filename.gsub(/.\w*$/, '.jpg'))
end

def create_thumb(folder)
  filename = Dir["#{folder}/thumb.*"].first ||
             Dir["#{folder}/center.*"].first
  return if filename.nil?
  image = Magick::Image.read(filename).first
  return if image.columns == 250 && image.rows == 250
  image.resize_to_fill!(250, 250)
  thumb_filename = filename
                   .gsub("#{folder}/center", "#{folder}/thumb")
                   .gsub(/.\w*$/, '.jpg')
  File.delete(thumb_filename) if File.exist?(thumb_filename)
  image.write(thumb_filename)
end

def create_left(folder)
  filename = Dir["#{folder}/left.*"].first
  return if filename.nil?
  image = Magick::Image.read(filename).first
  return if image.columns == 350 && image.rows == 215
  image.resize_to_fill!(350, 215)
  File.delete(filename)
  image.write(filename.gsub(/.\w*$/, '.jpg'))
end

def create_right(folder)
  filename = Dir["#{folder}/right.*"].first
  return if filename.nil?
  image = Magick::Image.read(filename).first
  return if image.columns == 350 && image.rows == 215
  image.resize_to_fill!(350, 215)
  File.delete(filename)
  image.write(filename.gsub(/.\w*$/, '.jpg'))
end

mural_folders.each do |folder|
  puts "Resizing #{folder}"
  create_center(folder)
  create_thumb(folder)
  create_left(folder)
  create_right(folder)
end
