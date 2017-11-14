module RelationshipHelper
    def getFollowers(id)
        followers = []
        fs = Follow.where(followable_id: id)
        fs.each do |f|
            user = {}
            u = User.find_by(id: f.follower_id)
            user['accepted'] = f.accepted
            user['uid'] = u.uid
            user['nickname'] = u.nickname 
            followers.push(user)
        end
       return followers
    end
    def getFollowing(id)
        following = []
        fs = Follow.where(follower_id: id)
        fs.each do |f|
            user = User.find_by(id: f.followable_id)
            following.push(user)
        end
       return following
    end
end
