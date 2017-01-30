class BlogsController < ApplicationController
  def new

  end

  def show
    @blog = Blog.find params[:id]
  end

  def create
    @blog = Blog.create(
        title:       params[:label],
        body:        params[:contents]
    )

    redirect_to "/blogs/#{@blog.id}"
  end

  def edit
    @blog = Blog.find params[:id]
  end

  def update
    @blog = Blog.find params[:id]
    @blog.update(
        title:       params[:label],
        body:        params[:contents]
    )

    redirect_to "/blogs/#{@blog.id}"
  end

  def all
    @blog = Blog.all.each do |b|
      b.title
      b.body
    end
  end

  def favorite
    Favorite.where(
                user_id: current_user.id,
                blog_id: params[:id]
    ).first_or_create

    redirect_to "/blogs/#{params[:id]}/"
  end

  def unfavorite
    Favorite.where(
        user_id: current_user.id,
        blog_id: params[:id]
    ).delete_all

    redirect_to "/blogs/#{params[:id]}/"
  end

end


# def all
#   if params[:closed]
#     @issues = Issue.where(status: "closed")
#   else
#     @issues = Issue.all
#   end
# end



# class IssuesController < ApplicationController
#   def new
#   end
#
#   def create
#     Issue.create(
#         title:       params[:label],
#         description: params[:contents]
#     )
#
#     redirect_to '/'
#   end
#
#   def all
#     if params[:closed]
#       @issues = Issue.where(status: "closed")
#     else
#       @issues = Issue.all
#     end
#   end
#
#   def show
#     @issue = Issue.find params[:id]
#   end
# end