Atmos
=====

Per EMC: EMC® Atmos(TM) is an object-storage system with enormous scalability and extensibility. It uses metadata-driven policies to manage data placement and data services.

The cloud storage product is used by several service providers including [AT&T](https://www.synaptic.att.com/staas), [HostedSolutions](http://www.hostedsolutions.com/services/stratus-cloud-storage.php) and [Peer1](http://www.peer1.com/hosting/cloudone-storage.php)

Atmos Client Library
--------------------

EMC has graciously provided [an example library](https://code.google.com/p/atmos-ruby/), but I've decided to write my own because:

* I wanted it to be Typhoeus/MonsterMash based rather than Net::HTTP
* I wanted to reorganize it into multiple classes
* I think it's more Ruby-ish
* I'm having fun doing it

Project Status
--------------

Barely started.  I've just started mocking up what I think the library structure will be and registered for developer access to the AtmosOnline Service.  If I don't get access soon, I'll set up a AtmosVE image on my laptop.

Comments, questions, concerns and collaboration are welcome!

Configuration
-------------

Use the atmos.yml config file

	development:
	  host: 192.168.1.5
	  port: 80
	  uid:	user1
	  secret: ssh_dont_tell
	  use_ssl: no
	  namespace: MyRubyApp
	

Atmos Base Object Examples
--------------------------

	# Create an empty anonymous object
	id = Atmos::Object.create()
	
	# Create one with data
	id = Atmos::Object.create(:data => "Hello", :path => "hello_world.txt")
	# This gets stored in /MyRubyApp/objects/hello_world.txt

	# Create one with metadata
	id = Atmos::Object.create(:data => "Hello", :metadata => {'somekey' => 'somevalue'})
	
	# Read back an object
	Atmos::Object.read(id)
	
	# Read an object's user_metadata
	Atmos::Object.read(id, :field => :user_metadata)
	
	# Read an object's tags and system metadata
	Atmos::Object.read(id, :fields => [:tags, :system_metadata])
	
	# List objects
	Atmos::Object.list
	# This will list objects in /MyRubyApp/objects
	
	# List objects in a directory
	Atmos::Object.list("somedir")
	# This will list objects in /MyRubyApp/objects/somedir/ if that directory exists
	
Atmos Tag Examples
------------------

	# List all tags
	Atmos::Tag.list

	# List tags in a specific directory
	Atmos::Tag.list("somedir")
	
Atmos Versioning Examples
-------------------------

	# Create a new version of an object
	Atmos::Version.create(some_object_id)
	
	# List versions of an object 
	Atmos::Version.list(some_object_id)
	
	# Promote a previous version back to the base object
	Atmos::Version.promote(some_object_id, some_version_id)
