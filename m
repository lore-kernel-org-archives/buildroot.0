From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 8 Nov 2007 19:00:44 -0800
Subject: [Buildroot] [buildroot 0001581]: libusb configure.guess/sub doesn't
	support armeb
Message-ID: <65bbce1da97531ac3e4b95d6de7f004d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1581 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1581
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-08-2007 19:00 PST
Last Modified:              11-08-2007 19:00 PST
====================================================================== 
Summary:                    libusb configure.guess/sub doesn't support armeb
Description: 
libusb's configure script doesn't support armeb.

Updating the files using $(CONFIG_UPDATE) caused all sorts of libtool hell
to break loose, so I had to run autoreconf during the build too. Thus
adding a dependency on automake, autoconf.

Patch attached fixes this for me.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-07 19:00  hmoffatt       New Issue                                    
11-08-07 19:00  hmoffatt       Status                   new => assigned     
11-08-07 19:00  hmoffatt       Assigned To               => buildroot       
11-08-07 19:00  hmoffatt       File Added: br-libusb-autoconf.mk                
   
======================================================================
