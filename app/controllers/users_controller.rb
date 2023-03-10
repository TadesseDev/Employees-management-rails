class UsersController < ApplicationController
  before_action :set_users, only: [:index, :create]
  def index
    respond_to do |format|
      format.html
      format.json {render :json => @users, :status => :ok}
      format.turbo_stream {
        render turbo_stream: turbo_stream.prepend(
          'users', UserComponent.with_collection(@users).render_in(view_context))
      }
    end
  end

  def edit
    @user=User.find(params[:id])
    respond_to do |format|
      if @user
          format.html
          format.turbo_stream {render turbo_stream:
            turbo_stream.replace(@user, render_to_string(NewUserComponent.new(user: @user)))
          }
      else
          format.html { redirect_to users_url, warning: 'Fail to delete user' }
          format.json { render :json, @user }
          format.turbo_stream {render turbo_stream:
            turbo_stream.remove(@user)
          }
      end
    end
  end
  def create
    @user=User.new(user_params)
    if @user.save
      respond_to do |format|
        p @users.length
        format.html { redirect_to @user, notice: 'User was created successfully.' }
        format.json { render :json, @user }
        format.turbo_stream {render turbo_stream:[
          turbo_stream.append('users', render_to_string(UserComponent.new(user: @user))),
          turbo_stream.replace(User.new, render_to_string(NewUserComponent.new(user: User.new)))
        ]
        }
      end
    end
  end

  def update
    @user=User.find(params[:id])
        respond_to do |format|
          if @user.update(user_params)
            format.html {redirect_to user_path, notice: 'User was updated successfully.'}
            format.json {render :json => @users, :status => :ok}
            format.turbo_stream {render turbo_stream: turbo_stream.replace(@user, render_to_string(UserComponent.new(user: @user)))}
          end
        end
  end

  def destroy
    @user=User.find(params[:id])
    respond_to do |format|
      if @user.destroy
          format.html { redirect_to users_url, notice: 'User was deleted successfully.' }
          format.json { render :json, @user }
          format.turbo_stream {render turbo_stream:
            turbo_stream.remove(@user)
          }
      else
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
