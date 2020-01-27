## notes to future self

### prep
install gem [rack-cors](https://github.com/cyu/rack-cors) for handling cross-origin res

forgery protection in application controller to allow postman post requests (see this [SO](https://stackoverflow.com/questions/41619177/actioncontroller-invalidauthenticitytoken-in-apiv1userscontrollercreate))

strucutre postman post requests like ```{ "user": { "email":"test@test.com, "password":"..." }}``` etc. to pass strong params in rails controller (see [this](https://medium.com/@spaquet/testing-rails-5-api-with-postman-36f1e79dc4d))

this [tutorial](https://medium.com/@pamit/todo-list-building-a-react-app-with-rails-api-7a3027907665) is useful for meshing rails/react via internal api

### react app

install in rails app root with 
`create-react-app <REACT-APP-NAME>`

Profile.dev: 
```
web: PORT=4000 yarn --cwd <REACT-APP-NAME> start
api: PORT=3000 bundle exec rails server
```
> `--cwd` option means run server in specified directory (as opposed to root, where rails is run)

`index.js` in (rails) app>javascript>packs

config react app with proxy for dev in package.json. add:
```
"proxy": "http://localhost:3000"
```

run rails app/ react app (port 4000) simultaneous with heroku local via Profile:
`heroku local -f Procfile.dev`

example api controller:

```ruby
class VocabsController < ApplicationController
  def index
    vocabs = Vocab.order("created_at DESC")
    render json: vocabs
  end

  def show
    vocab = Vocab.find(params[:id])
    render json: vocab
  end

  def create
    vocab = Vocab.new(vocab_params)
    if vocab.save
      render json: vocab
    else
      render json: vocab.errors
    end
  end

  def update
    vocab = Vocab.find(params[:id])
    vocab.update_attributes!(vocab_params)
    render json: vocab
  end

  def destroy
    vocab = Vocab.find(params[:id])
    vocab.destroy
    head :no_content, status: :ok
  end

  private

  def vocab_params
    params.require(:vocab).permit(:french, :english, :starred)
  end
end

```


