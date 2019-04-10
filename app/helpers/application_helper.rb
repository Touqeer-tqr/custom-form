module ApplicationHelper
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