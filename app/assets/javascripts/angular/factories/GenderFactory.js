angular.module("genderFactory",[])

.factory("gender", function($http){
	
	return {
        get : function() {
            return $http.get('http://localhost:3000/api/events');
        },
		 save : function(genderData) {
            return $http({
                method: 'POST',
                url: 'http://localhost/laravel51/public/api/genders',
                headers: { 'Content-Type' : 'application/x-www-form-urlencoded' },
                data: $.param(genderData)
            });
        }
	}

});