class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
    @member = Member.all
    @event = Event.all

  if params[:first_name]
    @member = Member.where(:first_name => params[:first_name])
  elsif params[:last_name]
    @member = Member.where(:last_name => params[:last_name])
  elsif params[:title]
    @event = Event.where(:title => params[:title])
  elsif params[:start_date]
    @event = Event.where(:start_date => params[:start_date])
  end

  @attendances = Attendance.where(:member_id => @member.ids).where(:event_id => @event.ids)
  #if params[:member_id]
  #  @attendances = Attendance.where(:member_id => params[:member_id])
  #end

  end

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        member = Member.find(attendance_params[:member_id])
        member.update(total_attendance: member.total_attendance + 1)

        format.html { redirect_to @attendance, notice: "Attendance was successfully created." }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)        
        format.html { redirect_to @attendance, notice: "Attendance was successfully updated." }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy
    member = Member.find(@attendance.member_id)
    member.update(total_attendance: member.total_attendance - 1)
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:member_id, :event_id)
    end
end