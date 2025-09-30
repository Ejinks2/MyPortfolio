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

    # Image optimization
    imagemin:
      dynamic:
        files: [{
          expand: true
          cwd: 'src/assets/'
          src: ['**/*.{png,jpg,jpeg,gif,svg}']
          dest: 'dist/assets/optimized/'
        }]
        options:
          optimizationLevel: 3
          progressive: true
          interlaced: true

    # CSS processing
    cssmin:
      options:
        mergeIntoShorthands: false
        roundingPrecision: -1
      target:
        files:
          'dist/assets/styles.min.css': [
            'src/styles/*.css'
            'src/index.css'
          ]

    # JavaScript/TypeScript linting
    jshint:
      options:
        jshintrc: '.jshintrc'
        reporter: require('jshint-stylish')
      all: [
        'Gruntfile.js'
        'src/**/*.js'
      ]

    # ESLint for TypeScript/React
    eslint:
      options:
        configFile: 'eslint.config.js'
        format: 'stylish'
      target: [
        'src/**/*.{ts,tsx,js,jsx}'
      ]

    # TypeScript compilation check
    ts:
      options:
        fast: 'never'
        compiler: './node_modules/typescript/bin/tsc'
      dev:
        tsconfig: './tsconfig.json'

    # File watching for development
    watch:
      options:
        livereload: true
        spawn: false
      
      typescript:
        files: ['src/**/*.{ts,tsx}']
        tasks: ['eslint', 'ts:dev']
      
      styles:
        files: ['src/**/*.css']
        tasks: ['cssmin']
      
      assets:
        files: ['src/assets/**/*']
        tasks: ['copy', 'imagemin']
      
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

    # Git hooks
    githooks:
      all:
        'pre-commit': 'lint-staged'

    # File concatenation
    concat:
      options:
        separator: ';'
        stripBanners: true
      dist:
        src: ['src/Components/*.tsx']
        dest: '.tmp/components-combined.js'

    # Uglify/Minify JavaScript
    uglify:
      options:
        banner: '/*!\n<%= pkg.name %> <%= pkg.version %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
        mangle: true
        compress:
          drop_console: true
      
      dist:
        files:
          'dist/assets/app.min.js': ['.tmp/components-combined.js']

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

    # Performance budget
    perfbudget:
      default:
        options:
          url: 'http://localhost:3001'
          budget:
            requests: 20
            gzip: 1024000  # 1MB
            SpeedIndex: 1500

    # Deploy to GitHub Pages
    'gh-pages':
      options:
        base: 'dist'
        branch: 'gh-pages'
        repo: 'https://github.com/Ejinks2/MyPortfolio.git'
      src: ['**/*']

    # Bundle analyzer
    webpack_bundle_analyzer:
      default:
        bundlePath: 'dist/assets/index-*.js'

  # Load grunt plugins
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-eslint'
  grunt.loadNpmTasks 'grunt-ts'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-githooks'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-perfbudget'
  grunt.loadNpmTasks 'grunt-gh-pages'
  grunt.loadNpmTasks 'grunt-webpack-bundle-analyzer'

  # Define tasks
  grunt.registerTask 'default', [
    'clean'
    'eslint'
    'ts:dev'
    'copy'
    'cssmin'
    'htmlmin'
  ]

  grunt.registerTask 'build', [
    'clean'
    'eslint'
    'ts:dev'
    'copy'
    'imagemin'
    'cssmin'
    'concat'
    'uglify'
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
    'ts:dev'
  ]

  grunt.registerTask 'optimize', [
    'build'
    'imagemin'
    'perfbudget'
  ]

  grunt.registerTask 'deploy', [
    'build'
    'gh-pages'
  ]

  grunt.registerTask 'analyze', [
    'build'
    'webpack_bundle_analyzer'
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

  grunt.registerTask 'portfolio-deploy', 'Deploy portfolio to GitHub Pages', ->
    grunt.log.writeln 'Deploying Ethan\'s Portfolio...'
    grunt.task.run [
      'optimize'
      'gh-pages'
    ]
    grunt.log.writeln 'Portfolio deployed successfully!'