class QuestionsController < ApplicationController
    def create
        @question = Question.new(question_params)
        if @question.save
            if(params[:options])
                params[:options].each do |option|
                    @option = Option.new(title: option, question_id: @question.id)
                    @option.save
                end
            end

            render json: @question
        else
            render json: @question.errors, status: :unprocessable_entity
        end
    end

    def pending
        @question = Question.where(created_by: params[:created_by]).last
        if !@question.hide
            render json: {"result": true}
        else
            render json: {"result": false}
        end
    end


    private
    def question_params
        params.require(:question).permit(:title, :created_by, :created_for)
    end
end
