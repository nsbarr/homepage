use Rack::Static, 
  :urls => ["/images", "/js", "/css"],
  :root => "public"
 
static_page_mappings = {
    '/'                  => 'public/index.html',
    '/chester'           => 'public/chester.html'
}

  static_page_mappings.each do |req, file|
    map req do 
      run Proc.new do |env|
        [
          200, 
          {
            'Content-Type'  => 'text/html', 
            'Cache-Control' => 'public, max-age=6400',
          },
          File.open(file, File::RDONLY)
        ]
      end
    end
  end