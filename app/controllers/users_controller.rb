class UsersController < ApplicationController
  before_action :set_users, only: [:index, :create]
  def index
    # @users=User.all
  end

  def create
    @user=User.new(user_params)
    if @user.save
      respond_to do |format|
        p @users.length
        format.html { redirect_to @user, notice: 'User was created successfully.' }
        format.json { render :json, @user }
        format.turbo_stream {render turbo_stream:
          turbo_stream.append('users', UserComponent.new(user: @user).render_in(view_context))
        }
      end
    end
  end

  def update
  end

  def destroy
  end

  def new
  end

  def show
  end
  private
  def set_users
    @users=User.all
  end
  def user_params
    params.require(:user).permit(:name, :date_of_birth, :gender)
  end
end
