module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      files: ['src/coffee/**/*.coffee']
      tasks: ['build']
    coffee:
      compile:
        options:
          sourceMap: false
          bare: true
        files: [
          expand: true
          cwd: 'src/coffee'
          src: ['**/*.coffee']
          dest: 'src/js/compiled'
          ext: '.js'
        ]
    browserify:
      dist:
        src: 'src/js/compiled/**/*.js'
        dest: 'src/js/kashiwa.js'
    uglify:
      compile:
        files: [
          expand: true
          cwd: 'src/js/'
          src: 'kashiwa.js'
          dest: 'public/js/'
          ext: '-min.js'
        ]
    bower:
      install:
        options:
          targetDir: './public/lib'
          layout: 'byType'
          install: true
          verbose: true
          cleanTargetDir: true
          cleanBowerDir: false
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.registerTask 'build', ['coffee', 'browserify', 'uglify']
  grunt.registerTask 'default', ['watch']
  return