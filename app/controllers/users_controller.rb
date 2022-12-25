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
          turbo_stream.append('users', render_to_string(UserComponent.new(user: @user)))
        }
      end
    end
  end

  def update
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was deleted successfully.' }
        format.json { render :json, @user }
        format.turbo_stream {render turbo_stream:
          turbo_stream.remove(@user)
        }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_url, warning: 'Fail to delete user' }
        format.json { render :json, @user }
        format.turbo_stream {render turbo_stream:
          turbo_stream.remove(@user)
        }

    end
    end
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
