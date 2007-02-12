From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:26 -0800
Subject: [Buildroot] [buildroot 0000266]: Broken link in documentation
Message-ID: <1555ecb38cc5fe728fe35204a3f0b0cb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=266 
====================================================================== 
Reported By:                acutetech
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   266
Category:                   Documentation
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-23-2005 08:55 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Broken link in documentation
Description: 
This page http://buildroot.uclibc.org/buildroot.html#about says this:

The latest snapshot is always available at
http://uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2, and
previous snapshots are also available at
http://uclibc.org/downloads/snapshots/.

But the first of these links is broken. I got mine from here
http://buildroot.uclibc.org/downloads/snapshots/ selecting the latest
version.

BTW, most s/w download sites make available "latest snapshots" but also  a
"latest stable version". You don't seem to do this, no doubt for a very
good reason - perhpas you could add a word explaining why.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-28-05 01:08  
---------------------------------------------------------------------- 
thanks, fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-23-05 08:55  acutetech      New Issue                                    
08-28-05 01:08  vapier         Note Added: 0000454                          
08-28-05 01:08  vapier         Status                   assigned => closed  
08-28-05 01:08  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
