class CoachingController < ApplicationController
  def ask
    @query = params[:query]
  end

  def answer
    @question = params[:query]
    @answer = coach_answer_enhanced(@question)
  end


  def coach_answer(user_input)
    if user_input.include? "?"
      return "Silly question, get dressed and go to work!"
    elsif user_input.include? "I am going to work"
      return ""
    else
      return "I don't care, get dressed and go to work!"
    end
  end

  def coach_answer_enhanced(user_input)
    if user_input.include? "I am going to work right now!".upcase
      return ""
    elsif user_input === user_input.upcase
      return "I can feel your motivation!" + " "+ coach_answer(user_input)
    else
      return coach_answer(user_input)
    end
  end
end
