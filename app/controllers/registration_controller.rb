class RegistrationController < DeviseTokenAuth::RegistrationsController
    before_action :isInvited
    private
    def sign_up_params
      params.permit(:nickname, :email, :password, :password_confirmation)
    end
    def isInvited
      email = params[:email]
      invite = Invited.find_by(email: email)
      if(invite.nil?)
        error = {"status":"error","errors":{"full_messages":"You are not invited. Please find someone you know to invite you."}}
        render :json => error
      end
    end
  
  end