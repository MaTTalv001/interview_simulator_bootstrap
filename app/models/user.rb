class User < ApplicationRecord
    has_many :question_responses, dependent: :destroy

    def reset_interview_usage
        update(daily_interview_count: 5, last_interview_date: Date.today)
      end
    
      def can_use_interview?
        reset_interview_usage if last_interview_date.nil? || last_interview_date < Date.today
        daily_interview_count > 0
      end
    
      def use_interview
        if can_use_interview?
          decrement!(:daily_interview_count)
        else
          raise "You have reached your daily limit for AI interviews."
        end
      end
    
      def remaining_interviews
        daily_interview_count
      end
end
