use Rack::Static, 
  :urls => ["/images", "/js", "/css"],
  :root => "public"

map '/' do
    run Proc.new { |env|
      [
        200, 
        {
          'Content-Type'  => 'text/html', 
          'Cache-Control' => 'public, max-age=6400' 
        },
        File.open('public/index.html', File::RDONLY)
      ]
    }
end

map '/public/chester.html' do
  run Proc.new { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=6400' 
      },
      File.open('public/chester.html', File::RDONLY)
    ]
  }
end