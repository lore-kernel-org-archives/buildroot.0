From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 23 Apr 2007 19:05:43 -0700
Subject: [Buildroot] [buildroot 0001324]: Adding custom package does not
	include the editing of buildroot/package/Config.in
Message-ID: <f22b8d9de4a361467eb35e2c72a4a20c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1324 
====================================================================== 
Reported By:                bobwired
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1324
Category:                   Documentation
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-23-2007 19:05 PDT
Last Modified:              04-23-2007 19:05 PDT
====================================================================== 
Summary:                    Adding custom package does not include the editing
of buildroot/package/Config.in
Description: 
The docs (http://buildroot.uclibc.org/buildroot.html) for adding a new
package do not mention that you need to add an entry to the
buildroot/package/Config.in file.

For example, to add the package foo, you might edit Config.in from 
...
source "package/fakeroot/Config.in"
source "package/gettext/Config.in"
...

to

...
source "package/fakeroot/Config.in"
source "package/foo/Config.in"
source "package/gettext/Config.in"
...

Inserting the new package in the existing Config.in file in alphabetical
order.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-23-07 19:05  bobwired       New Issue                                    
04-23-07 19:05  bobwired       Status                   new => assigned     
04-23-07 19:05  bobwired       Assigned To               => buildroot       
======================================================================
