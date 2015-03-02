###
read.coffee
Copyright (C) 2015 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
angular.module('read', [
  'ui.bootstrap'
]).directive('note', ->
  {
    restrict: 'A'
    scope:
      id: '='
      notes: '=note'
    link: (scope, element, attrs)->
      create = (html, node)->
        f = html.indexOf(node.t)
        n = 0
        while node.n > n and f > -1
          f = html.indexOf(node.t, f+1)
          n++
        s: f
        c: node.c
        t: node.t
        m: node.m
      newHtml = (html, insert)->
        insert.sort((x, y)->
          return x.s - y.s
        )
        o = 0
        ret = ''
        for i in insert
          if o < i.s
            ret += html.substring(o, i.s)
            h = true
            o = i.s + i.t.length
          if i.m
            ret += "<ruby><rb>#{ i.t }</rb><rp>(</rp><rt>#{ i.m }</rt><rp>)</rp></ruby>"
            h = false
          if i.c
            if h
              ret += i.t
            ret += '<small>'
            ret += i.t
            ret += ':'
            ret += i.c
            ret += '</small>'
        ret += html.substring(o, html.length)
        ret
      update = (notes)->
        insert = []
        for n in notes
          if scope.id == n.i
            insert.push(create(scope.old, n))
        if insert.length > 0
          element.html(newHtml(scope.old, insert))
      if not scope.old
        scope.old = element.text()
      scope.$watch('notes', (n, o)->
        element.text(scope.old)
        update(n)
      ,true)
  }
)

ReadCtrl = ($scope, $log, $http)->
  $log.debug('xxxx')
  $scope.notes = []
  $scope.clean = ->
    $scope.notes = []
  $scope.update = ->
    $scope.notes = [
      {
        i: 1
        t: '规'
        n: 0
        c: '规则'
      }
      {
        i: 3
        t: '悌'
        n: 0
        m: 'ti'
      }
      {
        i: 3
        t: '悌'
        n: 0
        c: '这里是尊敬兄长的意思'
      }
    ]

ReadCtrl.$inject = [
  '$scope'
  '$log'
  '$http'
]

