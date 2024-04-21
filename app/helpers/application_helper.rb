module ApplicationHelper
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def user_signed_in?
      current_user.present?
    end

    def bootstrap_class_for(flash_type)
        case flash_type.to_sym
        when :notice
          "alert-info"  # または 'alert-success' など、お好みのアラートタイプ
        when :alert
          "alert-warning"  # または 'alert-danger'
        else
          flash_type.to_s
        end
      end
end