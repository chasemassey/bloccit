class FavoriteMailer < ApplicationMailer
	default from: "chasemassey@gmail.com"

	def new_comment(user, post, comment)
	    headers["Message-ID"] = "<comments/#{comment.id}@guarded-ravine-9037.com>"
	    headers["In-Reply-To"] = "<post/#{post.id}@guarded-ravine-9037.com>"
	    headers["References"] = "<post/#{post.id}@guarded-ravine-9037.herokuapp.com>"

	    @user = user
	    @post = post
	    @comment = comment

	    mail(to: user.email, subject: "New comment on #{post.title}")
	  end

	  def new_post(post)
	    headers["Message-ID"] = "<posts/#{post.id}@guarded-ravine-9037.herokuapp.com>"
	    headers["In-Reply-To"] = "<post/#{post.id}@guarded-ravine-9037.herokuapp.com>"
	    headers["References"] = "<post/#{post.id}@guarded-ravine-9037.herokuapp.com>"

	    @post = post

	    mail(to: post.user.email, subject: "You've favorited #{post.title}!")
	  end

	end
