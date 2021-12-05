class Api::V1::LaboratoriesController < Api::V1::ApiController
    before_action :set_laboratory, only: [:show, :update, :destroy,:associate_exam,:unassociate_exam]
    before_action :set_exam, only: [:associate_exam,:unassociate_exam]
    before_action :check_status_valid?, only: [:associate_exam,:unassociate_exam]
    # GET /api/v1/laboratories
    def index
      
      if params[:exam]
        @laboratories = Laboratory.search_by_exam(params[:exam])
      else
        @laboratories = Laboratory.search(params)
      end 
      render json: @laboratories, status: 200
    end
  
    # GET /api/v1/laboratories/1
    def show
      render json: @laboratory
    end
  
    # POST /api/v1/laboratories
    def create
      
      @laboratory = Laboratory.new(laboratory_params)
  
      if @laboratory.save
        render json: @laboratory, status: :created
      else
        render json: @laboratory.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/laboratories/1
    def update
      if @laboratory.update(laboratory_params)
        render json: @laboratory
      else
        render json: @laboratory.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/laboratories/1
    def destroy
      @laboratory.discard
      render json: @laboratory, status:200
    end

    def check_status_valid?
      return (@laboratory.status and @exam.status) if @exam and @laboratory.discarded_at.nil? and @exam.discarded_at.nil?
      false
    end

    def associate_exam
      if check_status_valid?
        if @laboratory.exams.include?(@exam)
          render json: {message:"Laboratório e exame já estão vinculados."}, status: :unprocessable_entity 
        else
          @laboratory.exams << @exam 
          render json: @laboratory, status: 200
        end
      else
        render json: {message:"Laboratório ou exame inválidos/inativos.Verifique, e tente novamente."}, status: :unprocessable_entity
      end  
    end

    def unassociate_exam
      
      if check_status_valid? and @laboratory.exams.include?(@exam) 
        @laboratory.laboratory_exams.where(exam_id:@exam.id,laboratory_id:@laboratory.id).first.delete
        render json: @laboratory, status: 200
      else
        render json: {message:"Laboratório ou exame inválidos/inativos.Verifique, e tente novamente."}, status: :unprocessable_entity
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_laboratory
        @laboratory = Laboratory.find(params[:laboratory_id]) if params[:laboratory_id]
        @laboratory = Laboratory.find(params[:id]) if params[:id]
      end
  
      # Only allow a trusted parameter "white list" through.
      def laboratory_params
        params.require(:laboratory).permit(:name, :address, :status)
      end
      
      def laboratories_params
        params.require(:laboratories).permit(:name, :address, :status)
      end

      def set_exam
        @exam = Exam.find(params[:exam_id])
      end
  
      
  end