# Export Plugin
module.exports = (BasePlugin) ->
  # Requires
  munge = require('munge')
  addrs = require("email-addresses")
  # Define Plugin
  class EmailobfuscatorPlugin extends BasePlugin

    # Plugin name
    name  : 'emailobfuscator'

    log : (msg) -> console.log('[' + @name + '-plugin]: ' + msg)

    # Checks whether the given emailAddress is valid.
    # If valid, returns an obfuscated version
    # If invalid, throws an error
    checkAndObfuscate : (emailAddress) ->
      if addrs(emailAddress)
        return munge(emailAddress, {encoding: 'utf8'})
      else
        @log("'" + emailAddress + "' is not a valid email address")
        throw "Invalid email address"
    # Add methods to templateData

    extendTemplateData: ({templateData}) ->
      docpad = @docpad
      config = @config

      # make the checkAndObfuscate method available through templateData
      templateData.checkAndObfuscate = @checkAndObfuscate

      # obfuscate the list of provided email addresses and make them available through templateData.emailaddresses
      config.emailAddresses = config.emailAddresses || {}
      templateData.emailAddresses = {}
      for label, address of config.emailAddresses
        templateData.emailAddresses[label] = @checkAndObfuscate(address)