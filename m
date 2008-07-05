From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 5 Jul 2008 08:14:40 -0700
Subject: [Buildroot] [buildroot 0003584]: Cairo does not build directfb if
	directfb support required (dependencies missing)
Message-ID: <507de65e3a0b721dc90940637ef6ec3e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3584 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3584
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             06-03-2008 05:06 PDT
Last Modified:              07-05-2008 08:14 PDT
====================================================================== 
Summary:                    Cairo does not build directfb if directfb support
required (dependencies missing)
Description: 
Cairo supports being built for DirectFB.  However it is not dependent on
DirectFB so DirectFB may not actually be build yet 
====================================================================== 

---------------------------------------------------------------------- 
 Correa - 07-05-08 08:14  
---------------------------------------------------------------------- 
Fixed in 22654.

Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:06  daniellaird    New Issue                                    
06-03-08 05:06  daniellaird    Status                   new => assigned     
06-03-08 05:06  daniellaird    Assigned To               => buildroot       
06-03-08 05:06  daniellaird    File Added: cairo_directfb.patch                 
  
07-05-08 08:14  Correa         Status                   assigned => resolved
07-05-08 08:14  Correa         Resolution               open => fixed       
07-05-08 08:14  Correa         Note Added: 0009004                          
======================================================================
