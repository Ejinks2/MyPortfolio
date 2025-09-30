module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    # Clean build directories
    clean:
      dist: ['dist/']
      temp: ['.tmp/']

    # Copy files to distribution
    copy:
      main:
        files: [
          {
            expand: true
            cwd: 'src/assets/'
            src: ['**/*.{jpg,jpeg,png,gif,svg,webp}']
            dest: 'dist/assets/'
          }
          {
            expand: true
            cwd: 'public/'
            src: ['**/*']
            dest: 'dist/'
          }
        ]

    # CSS processing
    cssmin:
      options:
        mergeIntoShorthands: false
        roundingPrecision: -1
        processImport: false
        rebase: false
      target:
        files:
          'dist/assets/styles.min.css': [
            'src/styles/App.css'
            'src/styles/carousel.css'
          ]

    # JavaScript linting (for any JS files)
    jshint:
      options:
        reporter: require('jshint-stylish')
        esversion: 6
        node: true
      all: [
        'Gruntfile.js'
        'src/**/*.js'
      ]

    # ESLint for TypeScript/React
    eslint:
      options:
        format: 'stylish'
      target: [
        'src/**/*.{ts,tsx,js,jsx}'
      ]

    # File watching for development
    watch:
      options:
        livereload: true
        spawn: false
      
      typescript:
        files: ['src/**/*.{ts,tsx}']
        tasks: ['eslint']
      
      styles:
        files: ['src/**/*.css']
        tasks: ['cssmin']
      
      assets:
        files: ['src/assets/**/*']
        tasks: ['copy']
      
      gruntfile:
        files: ['Gruntfile.coffee']
        tasks: ['jshint']

    # Connect server for development
    connect:
      server:
        options:
          port: 3001
          hostname: 'localhost'
          base: 'dist'
          keepalive: true
          livereload: true
          open: true

    # Concurrent tasks
    concurrent:
      dev: [
        'watch'
        'connect:server'
      ]
      options:
        logConcurrentOutput: true

    # File concatenation
    concat:
      options:
        separator: '\n'
        stripBanners: true
      css:
        src: ['src/styles/App.css', 'src/styles/carousel.css']
        dest: '.tmp/combined.css'

    # Uglify/Minify JavaScript
    uglify:
      options:
        banner: '/*!\n<%= pkg.name %> <%= pkg.version %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
        mangle: false
        compress: false
      
      dist:
        files:
          'dist/assets/app.min.js': ['dist/assets/index-*.js']

    # HTML processing
    htmlmin:
      dist:
        options:
          removeComments: true
          collapseWhitespace: true
          conservativeCollapse: true
          removeEmptyAttributes: true
          removeRedundantAttributes: true
          useShortDoctype: true
        files:
          'dist/index.html': 'index.html'

  # Load grunt plugins (only load what we have installed)
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-eslint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'

  # Define tasks
  grunt.registerTask 'default', [
    'clean'
    'copy'
    'cssmin'
    'htmlmin'
  ]

  grunt.registerTask 'build', [
    'clean'
    'copy'
    'cssmin'
    'concat'
    'htmlmin'
  ]

  grunt.registerTask 'dev', [
    'clean'
    'copy'
    'cssmin'
    'concurrent:dev'
  ]

  grunt.registerTask 'lint', [
    'jshint'
    'eslint'
  ]

  grunt.registerTask 'test', [
    'lint'
  ]

  # Custom task for portfolio-specific operations
  grunt.registerTask 'portfolio-setup', 'Setup portfolio development environment', ->
    grunt.log.writeln 'Setting up Ethan\'s Portfolio development environment...'
    grunt.task.run [
      'clean'
      'copy'
      'cssmin'
    ]
    grunt.log.writeln 'Portfolio setup complete!'

  grunt.registerTask 'portfolio-build', 'Build portfolio for production', ->
    grunt.log.writeln 'Building Ethan\'s Portfolio for production...'
    grunt.task.run [
      'build'
    ]
    grunt.log.writeln 'Portfolio build complete!'