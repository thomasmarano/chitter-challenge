require 'sinatra/base'
require_relative 'lib/peep'


class PeepManager < Sinatra::Base

  get '/' do
      #$peep = Peep.new
      erb (:index)
  end

#enable :sessions

  get '/list-peeps' do
      @peeps = Peep.all
      erb (:view_add_peeps)
  end

  # <% if $peep.list_of_peeps.length > 0 %>
  #     <% $peep.list_of_peeps.each do |each_peep| %>
  #         <ul>
  #             <li><%=each_peep%></li>
  #         </ul>
  #     <% end %>
  # <% end %>

  post '/save-peeps' do
      # p 'TESTING NEW'
      # p params[:peepshow]
      Peep.add_peep_db(params[:peepshow])
      #$peep.add_peep(params[:peepshow])
      redirect '/list-peeps'
  end


  run! if app_file == $0

end
