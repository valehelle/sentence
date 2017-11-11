class RelationshipController < ApplicationController
    def follower
        user = User.last()
        followers = getFollowers(user.id)
        render :json => followers.to_json() 
    end
    def following
        user = User.first()
        followees = getFollowing(user.id)
        render :json => followees.to_json(:only => [ :uid, :nickname ]) 
    end
    def follow
        id = params[:uid]
        user = User.first()
        target = User.last()
        user.follow!(target)
        render :json => user
    end
    def unfollow
        uid = params[:uid]
        user = User.first()
        target = User.last()
        render :json => user
    end
    def accept
        user_id = 2
        uid = params[:uid]
        user = User.find_by(uid: uid)
        target_id = user.id
        relationship = Follow.find_by(follower_id: target_id, followable_id: user_id)
        relationship.accepted = true
        relationship.save!
        render :json => relationship.to_json(:only => [ :accepted ]) 
    end
    def reject
        uid = params[:uid]
        user = User.first()
        target = User.last()
        user.unfollow!(target)
        render :json => user
    end
    def find
        nickname = params[:nickname]
        user = User.find_by(nickname: nickname)
        if user.nil?
            user = []
        end
        render :json => user.to_json(:only => [ :nickname, :uid ])
    end

    private
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
