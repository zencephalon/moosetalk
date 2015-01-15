def add_error!(error_msg)
  if session[:errors]
    session[:errors] << error_msg
  else
    session[:errors] = [error_msg]
  end
end

def display_errors!
  errors = session[:errors]
  session[:errors] = nil
  errors.join(", ") if errors
end

def parse_ar_errors_for_display!(messages)
  messages.each do |key, arr|
    arr.each do |err|
      add_error!("#{key}: #{err}")
    end
  end
end