class ComposersController < ApplicationController
    def index

    end


    def new
    @composer = Composer.new
    end

    def create
        @composer = Composer.new(composer_params)
        answers = [
            @composer.question1,
            @composer.question2,
            @composer.question3,
            @composer.question4,
            @composer.question5,
            @composer.question6,
            @composer.question7,
        ]
        @composer.a_count = answers.count { |a| a == "2" }
        if @composer.save
            flash[:notice] = "診断が完了しました"
            redirect_to @composer and return
        else
            redirect_to :action => "new"
        end
    end


    def show
        @composer = Composer.find(params[:id])
    end

    private

    def composer_params
    params.require(:composer).permit(
        :question1, :question2, :question3, :question4,
        :question5, :question6, :question7, :a_count
    )
    end
end
