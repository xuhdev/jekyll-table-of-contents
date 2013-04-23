module Jekyll
  class TableOfContentPage < Page
    def initialize(site, base, dir, toc_data)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'table_of_contents.html')

      self.data['table_of_contents'] = toc_data
    end
  end

  class TableOfContentGenerator < Generator
    safe true

    def generate(site)
      unless site.layouts.has_key? 'table_of_contents'
        return
      end

      toc_config = site.config['table_of_contents']

      unless toc_config.has_key? 'dirs'
        return
      end

      toc_config['dirs'].each do |dir|
        toc_data = []

        site.pages.each do |page|
          if is_file_in_dir(page.dir, "/#{dir}")
            page.data['table_of_contents'] = {}
            page.data['table_of_contents']['url'] = page.url
            toc_data << page.data
          end
        end

        site.pages << TableOfContentPage.new(site, site.source, dir, toc_data)
      end
    end

    private

    # is file in dir (file could also be a directory)
    def is_file_in_dir(file, dir)
      dir_ = (dir == '/' ? dir : dir.chomp('/'))
      file_ = (file == '/' ? file : file.chomp('/'))

      while file_ != '.' and file_ != '/' and file_ != dir_
        file_ = File.dirname(file_)
      end

      return (file_ == dir) ? true : false
    end
  end
end
