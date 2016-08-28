class Story < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author
  belongs_to :category
  has_many :comments, :as => :commentable

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
