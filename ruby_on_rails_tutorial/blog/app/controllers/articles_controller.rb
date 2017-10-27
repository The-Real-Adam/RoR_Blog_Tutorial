class ArticlesController < ApplicationController

# shows All Articles -- L in CRUDL
  def index
    @articles = Article.all
  end

# Shows a single article by ID -- R in CRUDL
  def show
    @article = Article.find(params[:id])
  end

# Shows article creation Directs to C
  def new
    @article = Article.new
  end

# Update an article directs to U
  def edit
    @article = Article.find(params[:id])
  end

# Create A new Article -- C in CRUDL
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

# Does the Updating  -- U in CRUDL
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

# Does the deletion of stuff 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

# some security think of this as a gitignore or whatevs- it wont show up publicly
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
