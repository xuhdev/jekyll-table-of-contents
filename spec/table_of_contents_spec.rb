require 'fileutils'

describe 'Jekyll Table of Contents' do
  describe '#Run test' do
    it 'Should produce the table of contents' do
      test_dir = File.expand_path('../test', __FILE__)
      system "cd #{test_dir} && jekyll build"

      File.read("#{test_dir}/_site/a/index.html").should == <<-EOF
<ul>

  <li><a href="/a/sub1/index.html">A Sub 1</a></li>

  <li><a href="/a/sub2/sub2.html">A Sub 2</a></li>

</ul>
      EOF

      File.read("#{test_dir}/_site/b/index.html").should == <<-EOF
<ul>

  <li><a href="/b/sub1/index.html">B Sub 1</a></li>

  <li><a href="/b/sub2/sub2.html">B Sub 2</a></li>

</ul>
      EOF

    end
  end
end

# vim: ts=2 sw=2 et
