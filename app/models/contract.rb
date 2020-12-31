class Contract < ApplicationRecord
  before_destroy :delete_documents

  has_one_attached :document

  validates :number, presence: true
  validates :firstname, presence: true, length: { maximum: 255 }
  validates :lastname, presence: true, length: { maximum: 255 }
  validates :register, format: { with: /[A-Яа-яЁёҮүӨө]{2}+[0-9]{8}\z/ } 
  validates :address, presence: true, length: { maximum: 255 }

  scope :created_at_desc, lambda {
    order(created_at: :desc)
  }

  private

  def delete_documents
    document.purge
  end

end
