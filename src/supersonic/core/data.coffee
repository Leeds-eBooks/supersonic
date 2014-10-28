data = require 'ag-data'

module.exports = (window) ->
  createModel = switch
    when window?.ag?.data?.resources then (name) ->
      try
        data.loadResourceBundle(window.ag.data.resources).createModel name
      catch err
        throw new Error "Could not load model #{name}: #{err}"
    else (name) ->
      throw new Error "No cloud resources available"

  {
    ###
     # @category core
     # @module data
     # @name model
     # @function
     # @apiCall supersonic.data.model
     # @description
     # Allows access to cloud resources you have configured for your app through Steroids Connect.
     # @type
     # model: (
     #   name: String
     # ) => Model
     # @define {String} name The name of a configured cloud resource
     # @exampleCoffeeScript
     # Task = supersonic.data.model 'task'
     # takeOutTheTrash = new Task {
     #   description: "Take out the trash"
     # }
     # takeOutTheTrash.save()
    ###
    model: createModel
  }

###
 # @category core
 # @module data
 # @name Model
 # @description
 # A Supersonic Data Model class. Provides access to a specific cloud resource through a fluent interface.
 # @type
 # Model: {
 #   findAll: () => Promise Collection
 #   find: (id) => Promise Resource
 # }
 # @define {Function} findAll returns a collection of resources
 # @define {Function} find returns a resource by a specific id
###
###
 # @category core
 # @module data
 # @name Model.findAll
 # @function
 # @type
 # findAll: () => Promise collection: Collection Resource
 # @description
 # Access a collection of resources
 # @exampleCoffeeScript
 # supersonic.data.model('task').findAll().then (tasks) ->
 #   for task in tasks
 #      console.log task.description
###
###
 # @category core
 # @module data
 # @name Collection.save
 # @function
 # @type
 # collection.save: () => Promise
 # @description
 # Persist all resources in this collection
 # @exampleCoffeeScript
 # supersonic.data.model('task').findAll().then (tasks) ->
 #   for task in tasks
 #     task.completed = true
 #   tasks.save()
###
###
 # @category core
 # @module data
 # @name Model.find
 # @function
 # @type
 # find: (id) => Promise Resource
 # @description
 # Find a resource from the cloud by an id
 # @exampleCoffeeScript
 # supersonic.data.model('task').find(123).then (task) ->
 #   console.log task.description
###
###
 # @category core
 # @module data
 # @name Resource.save
 # @function
 # @type
 # resource.save: () => Promise
 # @description
 # Persist the data in this resource to the cloud. If the instance is new, create it in the cloud; otherwise update the existing cloud resource.
 # @exampleCoffeeScript
 # supersonic.data.model('task').find(123).then (task) ->
 #   task.done = true
 #   task.save()
###
###
 # @category core
 # @module data
 # @name Resource.delete
 # @function
 # @type
 # resource.delete: () => Promise
 # @description
 # Remove this resource from the cloud backend.
 # @exampleCoffeeScript
 # supersonic.data.model('task').find(123).then (task) ->
 #   if task.done
 #     task.delete()
###