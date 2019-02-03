require 'sinatra/base'
require_relative 'lib/peep'


class PeepManager < Sinatra::Base

  get '/' do
      $peep = Peep.new
      erb (:index)
  end

enable :sessions

  get '/list-peeps' do
      erb (:view_add_peeps)
  end

  post '/save-peeps' do
      $peep.add_peep(params[:peepshow])
      redirect '/list-peeps'
  end


  run! if app_file == $0

end
