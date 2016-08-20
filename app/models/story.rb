class Story < ApplicationRecord
  belongs_to :author

  def save_image(tempfile)
    filename = "#{self.id.to_s}.jpg"
    folder = "#{Rails.root}/public/uploads/stories/#{self.id}"

    FileUtils::mkdir_p folder

    f = File.open File.join(folder, filename), "wb"
    f.write tempfile.read()
    f.close

    update image: "/uploads/stories/#{self.id}/#{filename}"
  end
end
