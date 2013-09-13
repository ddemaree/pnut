#= require jquery
#= require jquery_ujs
#= require knockout-2.2.1
#= require underscore-1.4.2
#= require moment.min
#= require_tree .

window.pnut = {}

class pnut.Destination
  getDisplayTitle: ()->
    @title() || @displayURL()

  updateTitle: (formElement)=>
    formData = $(formElement).serialize()
    jsonEndpointURL = "/admin/destinations/#{@id}.json" #$(formElement).attr('action') + '.json'
    @title(@titleBuffer())
    @editingTitle(false)

    _success = (data)=>
      console.log("Record saved")

    $.post(jsonEndpointURL, formData, _success)


  constructor: (data)->
    @editingTitle = ko.observable(false)
    @titleBuffer = ko.observable("")

    @data = data
    @id = data.id
    @title = ko.observable(data.title)
    @displayURL = ko.observable(data.displayURL)
    @canonicalPath = ko.observable(data.canonicalPath || "")
    @url = ko.observable(data.url)
    @createdAt = data.createdAt || ""
    @createdDate = moment(@createdAt).format("MMM DD YYYY")
    @createdTime = moment(@createdAt).format("hh:mma")

    @displayTitle = ko.computed(@getDisplayTitle, this)


class pnut.DestinationsList
  constructor: (data)->
    @destinations = ko.observableArray([])
    _.each data, (destData)=>
      # console.log(row)
      # field = new tix.TemplateField(row)
      dest = new pnut.Destination(destData)
      @destinations.push(dest)