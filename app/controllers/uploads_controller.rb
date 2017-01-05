class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    if params[:upload]
      file = params[:upload][:file]
      file_size = file.size
      @upload = Upload.create(upload_params)
      if @upload.valid?
        render :json => {status: 'success', file_size: file_size}
      else
        render :json => {status: 'error'}
      end
    else
      render :json => {status: 'no file'}
    end
  end

  private
    def upload_params
      params.require(:upload).permit(:file)
    end
end