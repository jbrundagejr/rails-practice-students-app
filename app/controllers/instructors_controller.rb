class InstructorsController < ApplicationController
  
  before_action :find_instructor, only: [:show, :edit, :update, :destroy]
  
  def index
    @instructors = Instructor.all
  end
  
  def show
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.valid?
      @instructor.save
      redirect_to @instructor
    else
      flash[:errors] = @instructor.errors.full_messages
      redirect_to new_instructor_path
    end
  end

  def edit
  end

  def update
    @instructor.assign_attributes(instructor_params)
    if @instructor.valid?
      @instructor.save
      redirect_to @instructor
    else
      flash[:errors] = @instructor.errors.full_messages
      redirect_to edit_instructor_path
    end
  end

  def destroy
    @instructor.destroy
    redirect_to instructors_path
  end

  private

  def find_instructor
    @instructor = Instructor.find(params[:id])
  end
  
  def instructor_params
    params.require(:instructor).permit(:name)
  end

end
