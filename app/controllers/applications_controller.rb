class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = current_user.applications.build(application_params)

    if @application.save
      flash[:notice] = "You applications was created"
      redirect_to applications_path
    else
      flash.now[:alert] = "There was a problem, try again"
      render :new
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    @application.assign_atributes(application_params)

    if @application.save
      flash[:notice] = "Your applications has been updated"
      redirect_to @application
    else
      flash.now[:alert] = "There was an error, try again"
      render :edit
    end
  end

  def destroy
    @application = Application.find(params[:id])

    if @application.destroy
      flash[:notice] = "Application #{@application.url} was deleted"
      redirect_to applications_path
    else
      flash.now[:alert] = "There was an error, try again"
      render :show
    end
  end

  private

  def application_params
    params.require(:application).permit(:url)
  end
end
