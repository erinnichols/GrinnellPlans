class MainBoard < ActiveRecord::Base
  self.table_name = 'mainboard'
  self.primary_key = 'threadid'
  belongs_to :account, foreign_key: :userid
  has_many :sub_boards, foreign_key: :threadid
  validates_presence_of :userid, :title

  before_update :set_lastupdated
  before_create :set_created

  private

  def set_created
    self.created = Time.now
  end

  def set_lastupdated
    self.lastupdated = Time.now
  end
end
