class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :authorize_admin, except: [:index, :show]


  def index
    @people = search_people(params[:search])

    # Redirect to the show page if only one person is found
    if @people.size == 1
      redirect_to @people.first
    end
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :phone, :instagram, :user_id, :profile_picture)
    end

    def authorize_user
      unless current_user.admin? || @person.user == current_user
        redirect_to root_path, alert: 'You are not authorized to perform this action.'
      end
    end

    def authorize_admin
      unless current_user.admin?
        action = params[:action].to_sym
        subject = params[:controller].classify.constantize
        id = params[:id]
    
        if action == :show || action == :edit || action == :update || action == :destroy
          redirect_to root_path, alert: 'You are not authorized to perform this action.' unless subject.exists?(id: id, user_id: current_user.id)
        elsif action == :new || action == :create
          # Allow all users to create new people
        end
      end
    end
    
end
