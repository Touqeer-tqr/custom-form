module ApplicationHelper
  class ActionView::Helpers::FormBuilder
    # http://stackoverflow.com/a/2625727/1935918
    # https://github.com/indrimuska/jquery-editable-select
    # https://github.com/seiyria/bootstrap-slider
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper
    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::AssetTagHelper
    def range_selector(selectors, ranges, select_options, options = {})
      options[:suggestions] = false if options[:suggestions].nil?
      options[:slider_step] = 1 if options[:slider_step].nil?
      options[:value] = [select_options.keys.first, select_options.keys.last] if options[:value].nil?
      options[:type] = options[:type] == 'amount' ? '$' : ''
      selectors = selectors.map &:to_s
      select_tag(selectors[0], options_for_select(select_options), value: options[:value][0])+
      text_field_tag(selectors[0]+'_'+selectors[1], nil, data: {'slider-step': options[:slider_step]})+
      select_tag(selectors[1], options_for_select(select_options), value: options[:value][1])+
      generate_script(selectors, ranges, options).html_safe
    end

    private
    def generate_script(selectors, ranges, options)
      return <<-SCRIPT
        <script type='text/javascript'>
          $('##{selectors[0]}').editableSelect({filter: #{options[:suggestions]}});
          $('##{selectors[1]}').editableSelect({filter: #{options[:suggestions]}});
          if ($('##{selectors[1]}').val() == '#{options[:value][1]}'){
            slidevalue = '#{ranges[1]}';
          }
          else{
            slidevalue = $('##{selectors[1]}').val();
          }
          if ($('##{selectors[0]}').val() == '#{options[:value][0]}'){
            slideMinValue = '#{ranges[0]}';
          }
          else{
            slideMinValue = $('##{selectors[0]}').val();
          }
          #{selectors[0]+'_'+selectors[1]}_slider = new Slider('##{selectors[0]+'_'+selectors[1]}', {
            id: 'slider12c',
            min: #{ranges[0]},
            max: #{ranges[1]},
            range: true,
            value: [parseFloat(slideMinValue.replace('$', '')), parseFloat(slidevalue.replace('$', ''))],
            tooltip: 'hide'
          }).on('slide', function(ev) {
              $('##{selectors[0]}').text(formatDigits(ev[0], '#{options[:type]}'))
              $('##{selectors[0]}').val(formatDigits(ev[0], '#{options[:type]}'))
              $('##{selectors[1]}').text(formatDigits(ev[1], '#{options[:type]}'))
              $('##{selectors[1]}').val(formatDigits(ev[1], '#{options[:type]}'))
              if( ev[0] <= #{ranges[0]} ){
                $('##{selectors[0]}').val('#{options[:value][0]}');
              }
              if( ev[1] >= #{ranges[1]} ){
                $('##{selectors[1]}').val('#{options[:value][1]}');
              }
          }).on('slideStop', function(ev) {
              $('##{selectors[0]}').text(formatDigits(ev[0], '#{options[:type]}'))
              $('##{selectors[0]}').val(formatDigits(ev[0], '#{options[:type]}'))
              $('##{selectors[1]}').text(formatDigits(ev[1], '#{options[:type]}'))
              $('##{selectors[1]}').val(formatDigits(ev[1], '#{options[:type]}'))
              if( ev[0] <= #{ranges[0]} ){
                $('##{selectors[0]}').val('#{options[:value][0]}');
              }
              if( ev[1] >= #{ranges[1]} ){
                $('##{selectors[1]}').val('#{options[:value][1]}');
              }
          });
          setOnChangeListner(#{selectors}, #{ranges}, #{selectors[0]+'_'+selectors[1]}_slider)
        </script>
      SCRIPT
    end
  end

  def drop_down_options
    {
      "$0.01"  => 1,
      "$0.50"  => 50,
      "$1"     => 100,
      "$2"     => 200,
      "$3"     => 300,
      "$4"     => 400,
      "$5"     => 500,
      "$10"    => 1000,
      "$15"    => 1500,
      "$25"    => 2500,
      "$50"    => 5000,
      "$75"    => 7500,
      "$100"   => 10000
    }
  end
  def drop_down_options2
    {
      "1"       => 1,
      "50"      => 50,
      "100"     => 100,
      "200"     => 200,
      "300"     => 300,
      "400"     => 400,
      "500"     => 500,
      "1000"    => 1000,
      "1500"    => 1500,
      "2500"    => 2500,
      "5000"    => 5000,
      "7500"    => 7500,
      "10000"   => 10000
    }
  end
end