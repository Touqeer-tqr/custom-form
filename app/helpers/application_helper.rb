module ApplicationHelper
  class ActionView::Helpers::FormBuilder
    # http://stackoverflow.com/a/2625727/1935918
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper
    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::AssetTagHelper
    def enum_select(name, options = {})
      @yrs =[2011,2010,2009,2008]
      select_tag 'year', options_for_select([["Select" , "" ]] + @yrs.to_a,2011)
    end
    def phone_text_field name, options = {}
      value = object.public_send(name).to_s
      if value.start_with? "9" # national number
        value = value[1..-1]
        options["value"] = value
      end
      text_field name, options
    end
  end
end