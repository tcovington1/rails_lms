class CoursesController < ApplicationController
  before_action :set_course, only [:show, :edit, :update, :destroy]

  def index
    @course = Course.all
  end

  def show
    # before action
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course 
    else
      render :new
    end
  end

  def edit
    # before action
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

private
  def course_params
    params.require(:course).permit(:first_name, :last_name)
      # name of model, and permit anything the model has
  end

  def set_course
    @course = Course.find(params[:id])
  end

end
