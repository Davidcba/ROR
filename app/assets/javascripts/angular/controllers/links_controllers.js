var myApp = angular.module('myapplication', ['ngRoute', 'ngResource']);

myApp.factory('Links', ['$resource',function($resource){
    return $resource('/links.json', {},{
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    })
}]);

myApp.factory('Link', ['$resource', function($resource){
    return $resource('/users/:id.json', {}, {
        show: { method: 'GET' },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    });
}]);

myApp.controller("LinkListCtr", ['$scope', '$http', '$resource', 'Users', 'User', '$location', function($scope, $http, $resource, Links, Link, $location) {

    $scope.links = Links.query();

    $scope.deleteUser = function (userId) {
        if (confirm("Are you sure you want to delete this user?")){
            User.delete({ id: userId }, function(){
                $scope.links = Links.query();
                $location.path('/');
            });
        }
    };
}]);
