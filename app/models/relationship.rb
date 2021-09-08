class Relationship < ApplicationRecord
# Userモデル上でフォローとフォロワーを区別するため、
# 本来userテーブルにはfollowed、followerテーブルは存在しないが
# 下記の記述で更にテーブル名をつけて、class_nameでuserテーブル内のでの別名であることを示唆

  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'


end