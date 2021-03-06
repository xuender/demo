module.exports = (grunt)->
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-bumpx')

  grunt.initConfig(
    pkg:
      grunt.file.readJSON('package.json')
    clean:
      dist: [
        'dist'
        'public'
      ]
    bump:
      options:
        part: 'patch'
      files: [ 'package.json', 'bower.json']
    copy:
      dist:
        files: [
          {
            cwd: 'public'
            src: '**'
            dest: 'public'
            expand: true
          }
        ]
      root:
        files: [
          src: [
            '*.html'
          ]
          dest: 'public'
          filter: 'isFile'
          expand: true
        ]
      read:
        files: [
          cwd: 'read'
          src: [
            '*.html'
          ]
          dest: 'public'
          filter: 'isFile'
          expand: true
        ]
      img:
        files: [
          cwd: 'img'
          src: [
            '*'
          ]
          dest: 'public/img'
          expand: true
        ]
      bootstrap:
        files: [
          cwd: 'bower_components/bootstrap/dist'
          src: [
            'css/*.min.css'
            'css/*.map'
            'fonts/*'
            'js/*.min.js'
            'js/*.map'
          ]
          dest: 'public'
          expand: true
        ]
      d3:
        files: [
          cwd: 'bower_components/d3/'
          src: [
            'd3.min.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      highcharts:
        files: [
          cwd: 'bower_components/highcharts/'
          src: [
            'highcharts-all.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      highchartsNg:
        files: [
          cwd: 'bower_components/highcharts-ng/dist/'
          src: [
            'highcharts-ng.min.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      angular:
        files: [
          cwd: 'bower_components/angular/'
          src: [
            'angular.js'
            'angular.min.js'
            'angular.min.js.map'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      angularI18n:
        files: [
          cwd: 'bower_components/angular-i18n/'
          src: [
            'angular-locale_zh-cn.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      angular_route:
        files: [
          cwd: 'bower_components/angular-route/'
          src: [
            'angular-route.js'
            'angular-route.min.js'
            'angular-route.min.js.map'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      ng_table_js:
        files: [
          cwd: 'bower_components/ng-table/'
          src: [
            'ng-table.js'
            'ng-table.min.js'
            'ng-table.map'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      ng_table_css:
        files: [
          cwd: 'bower_components/ng-table/'
          src: [
            'ng-table.min.css'
          ]
          dest: 'public/css'
          expand: true
          filter: 'isFile'
        ]
      storage:
        files: [
          cwd: 'bower_components/angular-local-storage/'
          src: [
            'angular-local-storage.min.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      md5:
        files: [
          cwd: 'bower_components/blueimp-md5/js'
          src: [
            'md5.min.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      jquery:
        files: [
          cwd: 'bower_components/jquery/dist'
          src: [
            'jquery.min.js'
            'jquery.min.map'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      upload:
        files: [
          cwd: 'bower_components/ng-file-upload'
          src: [
            'angular-file-upload-html5-shim.min.js'
            'angular-file-upload.min.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      hotkey:
        files: [
          cwd: 'bower_components/ng-hotkey'
          src: [
            'hotkey.min.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      socket:
        files: [
          cwd: 'bower_components/ngSocket/dist'
          src: [
            'ngSocket.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      ui:
        files: [
          cwd: 'bower_components/angular-bootstrap'
          src: [
            'ui-bootstrap-tpls.min.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      fontCss:
        files: [
          cwd: 'bower_components/font-awesome/css'
          src: [
            'font-awesome.min.css'
          ]
          dest: 'public/css'
          expand: true
          filter: 'isFile'
        ]
      font:
        files: [
          cwd: 'bower_components/font-awesome/fonts'
          src: [
            '*'
          ]
          dest: 'public/fonts'
          expand: true
          filter: 'isFile'
        ]
      text:
        files: [
          cwd: 'bower_components/textAngular/dist'
          src: [
            'textAngular-sanitize.min.js'
            'textAngular.min.js'
          ]
          dest: 'public/js'
          expand: true
          filter: 'isFile'
        ]
      css:
        files: [
          cwd: 'css'
          src: [
            '*.css'
          ]
          dest: 'public/css'
          expand: true
          filter: 'isFile'
        ]
    coffee:
      options:
        bare: true
      read:
        files:
          'public/js/read.min.js': [
            'read/read.coffee'
          ]
    watch:
      css:
        files: [
          'read/*.css'
        ]
        tasks: ['copy:read']
      html:
        files: [
          'read/*.html'
        ]
        tasks: [
          'copy:read'
        ]
      coffee:
        files: [
          'read/*.coffee'
        ]
        tasks: ['coffee']
  )
  grunt.registerTask('test', ['karma'])
  grunt.registerTask('dev', [
    'clean'
    'copy'
    'coffee'
  ])
  grunt.registerTask('dist', [
    'dev'
    'copy:dist'
  ])
  grunt.registerTask('deploy', [
    'bump'
    'dist'
  ])
  grunt.registerTask('default', ['dist'])
