class Api::V1::ExamsController < ApplicationController
	before_action :authenticate_api_v1_user!
	before_action :set_exam, only: [:show, :update, :destroy]

# GET /exams
	def index
		@exams = Exam.where(user_id: current_user.id).all

		render json: @exams
	end

# GET /exams/1
	def show
		render json: @exam
	end

# GET /exams/1/questions
	def questions
		@questions = Question.where(exam_id: params[:id]).all
		render json: @questions
	end

# POST /exams
	def create
		@exam = Exam.new(exam_params)

		if @exam.save
			render json: @exam, status: :created
		else
			render json: @exam.errors, status: :unprocessable_entity
		end
	end

# PATCH/PUT /exams/1
	def update
		if @exam.update(exam_params)
			render json: @exam
		else
			render json: @exam.errors, status: :unprocessable_entity
		end
	end

# DELETE /exams/1
	def destroy
		@exam.destroy
	end

	private
	# Use callbacks to share common setup or constraints between actions.
		def set_exam
			@exam = Exam.find(params[:id])
			if @exam.user_id != current_user.id
				Devise::FailureApp
			end
		end

	# Only allow a trusted parameter "white list" through.
		def exam_params
			params.require(:exam).permit(:title, :expired)
		end

end
