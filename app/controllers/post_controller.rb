class PostController < ApplicationController
    def index
        post = Post.where("id > ?", 0)
        
                render :json => post.to_json(:only => [ :id, :created_at ], :include => [
                                             {:verb => 
                                                {:only => :content}
                                             },
                                             {:adjective => 
                                                {:only => :content}
                                             },
                                             {:noun => 
                                                {:only => [ :uid, :nickname ]}
                                             }]
                                             )   
    end
    def show
        post = Post.where("id > ?", id)

        render :json => post.to_json(:only => [ :id, :created_at ], :include => [
                                     {:verb => 
                                        {:only => :content}
                                     },
                                     {:adjective => 
                                        {:only => :content}
                                     },
                                     {:noun => 
                                        {:only => [ :uid, :nickname ]}
                                     }]
                                     )
    end
end
