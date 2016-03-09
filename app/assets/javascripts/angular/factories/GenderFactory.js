appGender.factory("gender", function($http,$resource){
	return $resource('http://localhost:3000/api/events', {},{
    query: { method: 'GET', isArray: true },
    create: { method: 'POST' }
    })
});