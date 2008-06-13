From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 13 Jun 2008 08:53:39 -0700
Subject: [Buildroot] [buildroot 0003734]: dbus-glib fails to compile for a
	i686 platform
Message-ID: <5dff5ebcb4fe2ebd338e4e803faad0f2@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3734 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3734
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-13-2008 08:53 PDT
Last Modified:              06-13-2008 08:53 PDT
====================================================================== 
Summary:                    dbus-glib fails to compile for a i686 platform
Description: 
The build of dbus-glib seems to look for several libraries in
build_i686/staging_dir/lib instead of build_i6i6/staging_dir/usr/lib
This is the case for recent svn versions of buildroot Explicit paths to
files
on the form lib*.so is used instead of -L and -l
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-13-08 08:53  KHAksnes       New Issue                                    
06-13-08 08:53  KHAksnes       Status                   new => assigned     
06-13-08 08:53  KHAksnes       Assigned To               => buildroot       
======================================================================
