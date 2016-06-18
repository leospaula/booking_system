module ApplicationHelper
  def flash_message
		msg = ""		
    flash.each do |key, value|
      case key
        when "error"               	        
          msg = 'sweetAlert("Oops...", "There seems to be error.", "error");'
        when "success"
    			msg = 'swal("Good job!", "Successfully completed!", "success");'
      end    
    end
    javascript_tag(msg)
  end
end
