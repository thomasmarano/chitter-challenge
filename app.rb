require 'sinatra/base'
require_relative 'lib/peep'


class PeepManager < Sinatra::Base

  get '/' do
      erb (:index)
  end

enable :sessions

  get '/list-peeps' do
      @peep = Peep.new
      erb (:view_add_peeps)
  end

  post '/save-peeps' do
      session[:peep] = params[:peep]
      redirect '/list-peeps'
  end


  run! if app_file == $0

end
