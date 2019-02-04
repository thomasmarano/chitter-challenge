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

  get '/compose-peep' do
      erb (:add_peeps)

  end

enable :sessions

  post '/save-peeps' do
      session[:peepshow] = params[:peepshow]
      time = Time.new.to_s
      Peep.add_peep_db(params[:peepshow], time)
      redirect '/add-confirmation'
  end

  get '/add-confirmation' do
      @peep = session[:peepshow]
      erb (:peep_confirmation)
  end


  run! if app_file == $0

end
