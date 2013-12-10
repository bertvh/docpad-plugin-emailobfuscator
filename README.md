# emailobfuscator Plugin for [DocPad](http://docpad.org)

[![Build Status](https://secure.travis-ci.org/docpad/docpad-plugin-emailobfuscator.png?branch=master)](http://travis-ci.org/docpad/docpad-plugin-emailobfuscator "Check this project's build status on TravisCI")
[![NPM version](https://badge.fury.io/js/docpad-plugin-emailobfuscator.png)](https://npmjs.org/package/docpad-plugin-emailobfuscator "View this project on NPM")

## Install

```
docpad install emailobfuscator
```

## How it works

This plugin adds a function _checkAndObfuscate(emailAddress)_ to `templateData`. This function checks whether the
provided _emailAddress_ is valid and returns an obfuscated version (using [munge](https://npmjs.org/package/munge)). If
not valid, throws an error.

For example:

```
<a href="mailto:<%- @checkAndObfuscate('contact@me.com') %>">contact me</a>
<a href="mailto:<%- @checkAndObfuscate('mail@me.com') %>">@checkAndObfuscate('mail@me.com')</a>
```

You can also provide a list of named email addresses in the plugin config as follows:

```
plugins:
    emailobfuscator:
        emailAddresses:
            general: "general@address.com"
            support: "support@address.com"
```

And then use them like this:

```
<a href="mailto:<%- @emailAddresses.general %>">contact us</a>
<a href="mailto:<%- @emailAddresses.support %>">get support</a>
```

## History

You can discover the history inside the `History.md` file

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; YEAR+ [NAME](URL)
