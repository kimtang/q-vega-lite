module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch:{
      main:{files:['main.q','vlite.q'],tasks:['shell:stopMain','shell:reloadMain','shell:log'],options:{atBegin:true,interrupt:true}},
      test:{files:['test/test.q','vlite.q'],tasks:['shell:stopTest','shell:reloadTest','shell:log'],options:{atBegin:true,interrupt:true}}

    },
    shell:{
      startAll:{ command:"pm2 start pm2.yaml"},
      stopAll:{  command:"pm2 stop pm2.yaml"},
      restartAll:{ command:"pm2 restart pm2.yaml"},
      reloadAll:{ command:"pm2 reload pm2.yaml"},

      status:{ command:"pm2 status"},
      log:{ command:"pm2 log"},

      startMain:{ command:"pm2 start pm2.yaml --only main"},
      stopMain:{  command:"pm2 stop pm2.yaml --only main"},
      restartMain:{ command:"pm2 restart pm2.yaml --only main"},
      reloadMain:{ command:"pm2 reload pm2.yaml --only main"},
      consoleMain:{ command:"pm2 log pm2.yaml --only main"},

      startTest:{ command:"pm2 start pm2.yaml --only test"},
      stopTest:{  command:"pm2 stop pm2.yaml --only test"},
      restartTest:{ command:"pm2 restart pm2.yaml --only test"},
      reloadTest:{ command:"pm2 reload pm2.yaml --only test"},
      consoleTest:{ command:"pm2 log pm2.yaml --only test"}

    },
    concurrent:{
      main:{options:{logConcurrentOutput: true},tasks:['watch:main','watch:test']},
      test:{options:{logConcurrentOutput: true},tasks:['watch:test']}
    }
  });

  // Load the Grunt plugins.
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-concurrent');
  grunt.loadNpmTasks('grunt-shell');


  // Register the default tasks.
  grunt.registerTask('startAll', ['shell:startAll']);
  grunt.registerTask('stopAll', ['shell:stopAll']);
  grunt.registerTask('restartAll', ['shell:restartAll']);
  grunt.registerTask('reloadAll', ['shell:reloadAll']);

  grunt.registerTask('startMain', ['shell:startMain']);
  grunt.registerTask('stopMain', ['shell:stopMain']);
  grunt.registerTask('restartMain', ['shell:restartMain']);

  grunt.registerTask('startTest', ['shell:startTest']);
  grunt.registerTask('stopTest', ['shell:stopTest']);
  grunt.registerTask('restartTest', ['shell:restartTest']);

  grunt.registerTask('log', ['shell:log']);
  grunt.registerTask('status', ['shell:status']);

  grunt.registerTask('default', ['concurrent:main']);
  grunt.registerTask('test', ['concurrent:test']);
};
