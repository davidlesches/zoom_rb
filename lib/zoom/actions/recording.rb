# frozen_string_literal: true

module Zoom
  module Actions
    module Recording
      def recording_list(*args)
        options = Zoom::Params.new(Utils.extract_options!(args))
        options.require(%i[user_id])
        Utils.parse_response(self.class.get("/users/#{options[:user_id]}/recordings", query: options.except(:user_id), headers: request_headers)
      end

      def recording_get(*args)
        options = Zoom::Params.new(Utils.extract_options!(args))
        options.require(%i[meeting_id])
        Utils.parse_response self.class.get("/meetings/#{options[:meeting_id]}/recordings", query: options.except(:meeting_id), headers: request_headers)
      end
    end
  end
end
