class Api::V1::ExamsController < Api::V1::ApiController
    before_action :set_exam, only: [:show, :update, :destroy]
    
  
    # GET /api/v1/exams
    def index
      @exam = Exam.search(params)
  
      render json: @exam
    end
  
    # GET /api/v1/exams/1
    def show
      render json: @exam
    end
  
    # POST /api/v1/exams
    def create
      @exam = Exam.new(exam_params)
  
      if @exam.save
        render json: @exam, status: :created
      else
        render json: @exam.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/exams/1
    def update
      if @exam.update(exam_params)
        render json: @exam
      else
        render json: @exam.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/exams/1
    def destroy
      @exam.discard
      render json: @exam, status:200
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_exam
        @exam = Exam.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def exam_params
        params.require(:exam).permit(:name, :typo, :status)
      end
  
      
  end