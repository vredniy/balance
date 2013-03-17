Balance::Application.configure do 
  config.generators do |g|
    g.orm :active_record, :migration => true
    g.test_framework :rspec, :fixtures => false
    g.helper false
    g.controller :assets => false
  end
end
