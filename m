From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:09 -0800
Subject: [Buildroot] [buildroot 0000964]: file-4.17 patch failed
Message-ID: <5d7c7e4a1b8519f40bb14b186a42f089@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=964 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   964
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-19-2006 12:48 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    file-4.17 patch failed
Description: 
the unversioned file.patch file is for 4.10.... it fails

disabling it allows file-4.17 to build.  no other testing has been done.

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 07-19-06 16:51  
---------------------------------------------------------------------- 
there is no file.patch, sounds like your repo is out of date 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-19-06 12:48  bowerymarc     New Issue                                    
07-19-06 12:48  bowerymarc     Status                   new => assigned     
07-19-06 12:48  bowerymarc     Assigned To               => uClibc          
07-19-06 16:51  vapier         Note Added: 0001532                          
07-19-06 16:51  vapier         Status                   assigned => closed  
07-19-06 16:51  vapier         Resolution               open => unable to
reproduce
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
