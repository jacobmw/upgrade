
# upgrade

Welcome to your new module. A short overview of the generated parts can be found in the PDK documentation at https://docs.puppet.com/pdk/1.0/pdk_generating_modules.html#module-contents .

Below you'll find the default README template ready for some content.

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with upgrade](#setup)
    * [What upgrade affects](#what-upgrade-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with upgrade](#beginning-with-upgrade)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module provides the upgrade task.  This allows you to install all available package updates with the ability to specify packages to exclude.

### Setup Requirements

This module is compatible with Puppet Enterprise and Puppet Bolt.

To run tasks with Puppet Enterprise, PE 2017.3 or later must be installed on the machine from which you are running task commands. Machines receiving task requests must be Puppet agents.
To run tasks with Puppet Bolt, Bolt 0.5 or later must be installed on the machine from which you are running task commands. Machines receiving task requests must have SSH

## Usage

To run a package task, use the task command, specifying the action and the name of the package.

With PE on the command line, run puppet task run upgrade exclude=<PACKAGES_TO_EXCLUDE>.
With Bolt on the command line, run bolt task run upgrade exclude=<PACKAGES_TO_EXCLUDE>..

You can also run tasks in the PE console. See PE task documentation for complete information.

## Reference

Users need a complete list of your module's classes, types, defined types providers, facts, and functions, along with the parameters for each. You can provide this list either via Puppet Strings code comments or as a complete list in the README Reference section.

* If you are using Puppet Strings code comments, this Reference section should include Strings information so that your users know how to access your documentation.

* If you are not using Puppet Strings, include a list of all of your classes, defined types, and so on, along with their parameters. Each element in this listing should include:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
