require 'fileutils'

describe 'Jekyll Table of Contents' do
  describe '#Empty _config.yml' do
    it 'Should produce no error' do
      test_dir = File.expand_path('../test0', __FILE__)
      expect(system("cd #{test_dir} && jekyll build")).to be true
    end
  end

  describe '#Run test' do
    it 'Should produce the table of contents' do
      test_dir = File.expand_path('../test', __FILE__)
      system "cd #{test_dir} && jekyll build"

      expect(File.read("#{test_dir}/_site/a/index.html")).to eq <<-EOF
<ul>

  <li><a href="/a/sub1/">A Sub 1</a></li>

  <li><a href="/a/sub2/sub2.html">A Sub 2</a></li>

</ul>
      EOF

      expect(File.read("#{test_dir}/_site/b/index.html")).to eq <<-EOF
<ul>

  <li><a href="/b/sub1/">B Sub 1</a></li>

  <li><a href="/b/sub2/sub2.html">B Sub 2</a></li>

</ul>
      EOF

    end
  end
end

# vim: ts=2 sw=2 et
