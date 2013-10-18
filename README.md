puppet-module-beuser
====================

Puppet module to manage beuser sudo wrapper

Description
====================

This module is for Ericsson internal use.
It installs the ''beuser'' wrapper for sudo used by Service Desk.
''beuser'' is an alternative for su, which allows changing active uid.
The restriction is, that you can only ''su'' to users with a uid > 100.
The idea is, to allow Service Desk work-force to ''su'' towards others
user-ids they are supporting. However, they are not supposed to get
administrative access on the systems themselves.

Note, that when you allow ''beuser'' to be execute by non-admins
(whether by sudo (preferred) or setuid), you must make sure, that the
admins on the system have no sudo entries, which allow command invocation
without password. Otherwise users can use ''beuser'' to aquire an account
of an admin and then use the unrestricted commands for them.

Parameters
====================

srcdir
------
From where to copy the binary (file name is taken according to OS).

- *Default*: '/opt/eis_cm_repos/eis_cm_repo/beuser'

dstdir
------
Where to install the beuser binary locally.

- *Default*: '/bin'

binname
-------
File name of the binary to be installed.

- *Default*: 'beuser'

mode
----
File permissions the binary shall have.
To enable setuid, use something like: '4755'

- *Default*: '0755'

owner
-----
User the binary shall belong to.

- *Default*: 'root'

group
-----
Group the bindary shall belong to.

- *Default*: 'root'

# Compatibility #
* Solaris 10 x86 & sparc
* Solaris 11 x86 & sparc
* Solaris 9  sparc
* SUsE 10 i386 & x86
* SUsE 11 i386 & x86
* SUsE 9  i386 & x86
* RHEL 5  i386 & x86
* RHEL 6  i386 & x86
* Ubuntu 12.04   x86
