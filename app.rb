require 'sinatra/base'
require_relative 'lib/peep'


class PeepManager < Sinatra::Base

  get '/' do
      erb (:index)
  end

  get '/list-peeps' do
      @peeps = Peep.all
      erb (:view_add_peeps)
  end

  post '/save-peeps' do
      Peep.add_peep_db(params[:peepshow])
      redirect '/list-peeps'
  end


  run! if app_file == $0

end
