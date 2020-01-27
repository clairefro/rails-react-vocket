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
