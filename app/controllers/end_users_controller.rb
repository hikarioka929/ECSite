class EndUsersController < ApplicationController
    def show
    end

    def edit
    end

    def update
    end

    def confirm
    end

    def cancel
        @end_user = current_end_user
        @end_user.destroy
        redirect_to root_path
    end
end
