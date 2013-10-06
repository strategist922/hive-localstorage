module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    
    reporter: 'spec'
    
    exec:
      compile:
        command: 'coffee -o lib/ -c src/*.coffee'
      ls: 
        command: 'ls test/*_test.{js,coffee}'
      test_compile:
        command: 'coffee -c test/*.coffee'
      test_run:
        command: 'mocha-phantomjs -R <%= reporter %> test/runner.html'
      test_clean:
        command: 'rm -r test/*_test.js'

  grunt.loadNpmTasks('grunt-exec')
  
  grunt.registerTask 'compile', [ 'exec:compile' ]
  
  grunt.registerTask 'test', [ 'exec:test_compile', 'exec:test_run', 'exec:test_clean' ]

  grunt.registerTask 'default', ['test']