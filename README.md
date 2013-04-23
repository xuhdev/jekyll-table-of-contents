# Jekyll Table of Contents Generator

This is a [Jekyll][] plugin which generates Tables of Contents.

## Installation

Drop `table_of_contents_generator.rb` in the `plugins` directory to your
plugins directory, which is usually `_plugins`.

## Usage

First, specify the directories you need to generate a Table of Contents for in
`_config.yml` by specifying `dirs` entry under `table_of_contents`. For
example, if you want to generate a table of contents for directories
`my_book_a` and `my_book_b`, simply add the following lines to your
`_config.yml` file:

```yaml
table_of_contents:
    dirs: [my_book_a, my_book_b]
```

Then you need to add a layout for table of contents pages. Create a file named
`table_of_contents.html` under `_layouts` directory. For example, with the
following lines you will have a list of titles in the Table of Contents page:

    ---
    layout: page
    title: Table of Contents
    ---
    <ul>
    {% for item in page.table_of_contents %}
      <li><a href="{{ item.table_of_contents.url }}">{{ item.title }}</a></li>
    {% endfor %}
    </ul>

From the above example you may notice that the variable
`page.table_of_contents` contains all the information of pages in the
directory for which you want to generate a table of contents. This plugin also
add a variable `table_of_contents.url` to each page in order to be accessible
to the URLs of the pages in the "table of contents" layout.

OK, then jekyll should generate the table of contents as `index.html` at the
roots of the directories which you specified to generate. Run `jekyll serve`
(For Jekyll version before 1.0.0, run `jekyll --server`) and visit
`http://localhost:4000/dir_table_of_contents_is_generated` to checkout your
table of contents pages!

For a complete example, you could check out the test directory: [spec/test/][].

[Jekyll]: http://jekyllrb.com/
[spec/test/]: https://github.com/xuhdev/jekyll-table-of-contents/tree/master/spec/test
