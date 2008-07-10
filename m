From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 9 Jul 2008 22:13:22 -0700
Subject: [Buildroot] [buildroot 0004044]: xcursor-themes-1.0.1 requires
	autotools 1.10.1
Message-ID: <ac97fccd8ab76f5705983b19acc0784e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4044 
====================================================================== 
Reported By:                UlfSamuelsson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4044
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-09-2008 22:13 PDT
Last Modified:              07-09-2008 22:13 PDT
====================================================================== 
Summary:                    xcursor-themes-1.0.1 requires autotools 1.10.1
Description: 
The xcursor-themes-1.0.1/.configure target
will call aclocal <...> --install

"--install" is not a valid option for aclocal (GNU automake) 1.9.6
but works for aclocal 1.10.1

We need to think if we want to force this upgrade
or change the configuration of xcursor-themes-1.0.1.

If we want to keep this, then we should name aclocal-1.10.1
as a dependency.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-09-08 22:13  UlfSamuelsson  New Issue                                    
07-09-08 22:13  UlfSamuelsson  Status                   new => assigned     
07-09-08 22:13  UlfSamuelsson  Assigned To               => buildroot       
======================================================================
