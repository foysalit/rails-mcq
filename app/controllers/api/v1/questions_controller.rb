class Api::V1::QuestionsController < ApplicationController
	before_action :authenticate_api_v1_user!
	before_action :set_question, only: [:show, :update, :destroy]

# GET /questions
	def index
		@questions = nil

		render json: @questions
	end

# GET /questions/1
	def show
		data = {:question => @question}
		data.choices = Choice.where(question_id: params[:id]).all
		render json: data
	end

# GET /questions/1/choices
	def choices
		@choices = Choice.where(question_id: params[:id]).all
		render json: @choices
	end

# POST /questions
	def create
		@question = Question.new(question_params)

		if @question.save
			render json: @question, status: :created
		else
			render json: @question.errors, status: :unprocessable_entity
		end
	end

# PATCH/PUT /questions/1
	def update
		if @question.update(question_params)
			render json: @question
		else
			render json: @question.errors, status: :unprocessable_entity
		end
	end

# DELETE /questions/1
	def destroy
		@question.destroy
	end

	private
	# Use callbacks to share common setup or constraints between actions.
		def set_question
			@question = Question.find(params[:id])
		end

	# Only allow a trusted parameter "white list" through.
		def question_params
			params.require(:question).permit(:title, :exam_id)
		end

end
