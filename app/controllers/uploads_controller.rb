class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    file = params[:upload][:file]
    file_size = file.size
    @upload = Upload.create(upload_params)
    if @upload.valid?
      render :json => {message: 'success', file_size: file_size}
    else
      render :json => {message: 'error'}
    end

  end

  private
    def upload_params
      params.require(:upload).permit(:file)
    end
end