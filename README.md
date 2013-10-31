puppet-module-beuser
====================

Puppet module to manage beuser sudo wrapper

Description
====================

This module is for Ericsson internal use.
It installs the ''beuser'' wrapper for sudo used by Service Desk.
''beuser'' is an alternative for su, which allows changing active uid.
The restriction is that you can only ''su'' to users with a uid > 100.
The idea is to allow Service Desk work-force to ''su'' towards others
user-ids they are supporting. However, they are not supposed to get
administrative access on the systems themselves.

Note, that when you allow ''beuser'' to be executed by non-admins,
whether by sudo (preferred) or setuid, you must make sure that the
admins on the system have no sudo entries which allow command invocation
without password. Otherwise users can use ''beuser'' to aquire an account
of an admin and then use the unrestricted commands for them.

The module needs to package beuser (or what it's configured to) available
on a installation source.

Parameters
====================

ensure
------
Ensure package installation

- *Default*: 'present'

package_name
------------
Name of package to be installed

- *Default*: 'beuser'


# Compatibility #

Any platform with a beuser package 
