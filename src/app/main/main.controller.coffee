angular.module 'coffeeBaseCtrlTest'
  .factory 'BaseController', ($timeout, webDevTec, toastr) ->
    'ngInject'

    class BaseController
      constructor: (vm) ->
        @vm = vm
        @vm.awesomeThings  ?= []
        @vm.classAnimation ?= ''
        @vm.creationDate   ?= 1453658664761
        @vm.showToastr      = @showToastr

      activate: ->
        console.log 'activate from BaseController'
        @getWebDevTec()
        $timeout (=>
          @vm.classAnimation = 'rubberBand'
          return
        ), 4000
        return

      getWebDevTec: ->
        @vm.awesomeThings = webDevTec.getTec()
        angular.forEach @vm.awesomeThings, (awesomeThing) ->
          awesomeThing.rank = Math.random()
          return
        return

      showToastr: =>
        toastr.info 'Fork <a href="https://github.com/Swiip/generator-gulp-angular" target="_blank"><b>generator-gulp-angular</b></a>'
        @vm.classAnimation = ''
        return

    BaseController

angular.module 'coffeeBaseCtrlTest'
  .controller 'MainController', (BaseController) ->
    'ngInject'
    vm = this

    class MainController extends BaseController
      activate: =>
        console.log 'activate from MainController'
        super

    mainCtrl = new MainController(vm)
    mainCtrl.activate()
