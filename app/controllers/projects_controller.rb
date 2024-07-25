class ProjectsController < ApplicationController
    before_action :authenticate_user!

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params['id'])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(permitted_params)
        if @project.save
            redirect_to project_url(@project)
        else
            render :new
        end
    end

    # def create
    #     @project = Project.new(project_params)
    
    #     respond_to do |format|
    #       if @project.save
    #         format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
    #         format.json { render :show, status: :created, location: @project }
    #       else
    #         format.html { render :new, status: :unprocessable_entity }
    #         format.json { render json: @project.errors, status: :unprocessable_entity }
    #       end
    #     end
    # end

    def edit
    end

    def update
    end

    protected 

    def permitted_params
        params.require(:person).permit(:name)
    end
end

