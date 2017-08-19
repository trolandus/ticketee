class TicketsController < ApplicationController
    before_action :find_project
    before_action :find_ticket, only: [:show, :edit, :update, :destroy]
    
    def new
        @ticket = @project.tickets.build
    end
    
    def create
        @ticket = @project.tickets.build(ticket_params)
        if @ticket.save
           flash[:notice] = "Ticket has been created."
           redirect_to [@project, @ticket]
        else
           flash[:alert] = "Ticket has not been created."
           render "new"
        end
    end
    
    def show
        
    end
    
    private
    def ticket_params
        params.require(:ticket).permit(:title, :description) 
    end
    
    def find_project
        @project = Project.find(params[:project_id]) 
    end
    
    def find_ticket
        @ticket = Ticket.find(params[:id]) 
    end
end
