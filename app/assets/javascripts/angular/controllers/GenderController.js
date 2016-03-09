angular.module("genderController",[])

.controller("Gender", function($scope, gender){
	$scope.errorMessages = [];
	angular.extend($scope, {
		genderData: {},
		events: {}
	});

	gender.get()
        .success(function(data) {
            $scope.events = data;  
            //console.log(data);         
        });

	angular.extend($scope, {
		submitgender: function() {
	
		gender.save($scope.genderData)
			.success(function(data) {
				$scope.genderData ="";
			})
			.error(function(data) {
				$scope.errorMessages = data;	
				console.log($scope.errorMessages);			
			});
		}

	});

});