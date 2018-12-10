module Response
  def json_response object, status = :ok
    # response = {
    #   status: {
    #     code: '000',
    #     message: 'Hello World!'
    #   },
    #   data: object
    # }
    render json: object, status: status
  end
end
