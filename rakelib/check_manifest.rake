desc "Perform a sanity check on the gemspec file list"
task :check_manifest => [:templates] do
  raw_gemspec = Bundler.load_gemspec("yarp.gemspec")

  ignore_directories = %w[
    .bundle
    .idea
    .git
    .github
    .cache
    .ruby-lsp
    autom4te.cache
    bin
    build
    fuzz
    java
    pkg
    rakelib
    rust
    templates
    test
    top-100-gems
    tmp
    vendor
  ]

  ignore_files = %w[
    .editorconfig
    .git-blame-ignore-revs
    .gitattributes
    .gitignore
    .gitmodules
    *.iml
    Gemfile
    Gemfile.lock
    Makefile
    Rakefile
    config.log
    config.status
    configure.ac
    compile_commands.json
    include/yarp/config.h
    lib/yarp/yarp.{so,bundle,jar}
    tags
  ]

  intended_directories = Dir.children(".")
    .select { |filename| File.directory?(filename) }
    .reject { |filename| ignore_directories.any? { |ig| File.fnmatch?(ig, filename) } }

  intended_files = Dir.children(".")
    .select { |filename| File.file?(filename) }
    .reject { |filename| ignore_files.any? { |ig| File.fnmatch?(ig, filename, File::FNM_EXTGLOB) } }

  intended_files += Dir.glob(intended_directories.map { |d| File.join(d, "/**/*") })
    .select { |filename| File.file?(filename) }
    .reject { |filename| ignore_files.any? { |ig| File.fnmatch?(ig, filename, File::FNM_EXTGLOB) } }
    .sort

  intended_files -= %w[a.out test.c test.rb]

  spec_files = raw_gemspec.files.sort
  missing_files = intended_files - spec_files

  unless missing_files.empty?
    puts "✖  files must be added to either the gemspec or the ignore list:"
    missing_files.sort.each { |f| puts "- #{f}" }
    puts "(see #{__FILE__})"
    exit(1)
  end

  puts "☑  manifest looks good"
end
