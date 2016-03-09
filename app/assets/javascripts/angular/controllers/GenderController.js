appGender.controller("Gender", function($scope, gender){
	$scope.errorMessages = [];
	angular.extend($scope, {
		genderData: {},
		events: {}
	});

	$scope.events = gender.query();

	angular.extend($scope, {
		submitgender: function() {
		
		
			gender.create($scope.genderData, function(){
      			$scope.genderData = "";
    		}, function(error){
      			console.log(error)
    		});
		
	
		}

	});

});