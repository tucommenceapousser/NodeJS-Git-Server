


#Require the GitServer module
GitServer = require './host.js'



###
	##Create example repo 1
	
	This repo does NOT allow Anonymous access
###
repoOne = 
	name		: 'stackdot'
	anonRead 	: false
	users		: [
		user:
			username: 'demo'
			password: 'demo'
		permissions:['R','W']
	]



###
	##Create example repo 2
	
	This repo allows Anonymous reading (fetch,clone) access
###
repoTwo =
	name		: 'anon'
	anonRead	: true
	users		: [
		user:
			username: 'demo2'
			password: 'demo2'
		permissions:['R','W']
	]
	onSuccessful :
		fetch : ->
			console.log 'Successful fetch on "anon" repo'
		push : ->
			console.log 'Success push on "anon" repo'



# Put these into arrays
repos 	= [ repoOne, repoTwo ] 



###
	#Create the GitServer object
	
		We are passing in `repos` array for the list of Repos we want to run  return
		We are passing in `true` to enable verbose logging  return
		We are passing in `/tmp/repos` to specify where the .git repos should live  return
		We are passing in `7000` for the port to run on ( port 80 requires sudo )
		
###
_git = new GitServer repos, true, '/tmp/repos', 7000