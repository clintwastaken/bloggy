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

    redirect_to '/'
  end

  def all
    @blog = Blog.all.each do |b|
      b.title
      b.body
    end
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