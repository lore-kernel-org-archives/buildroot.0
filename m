From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:24 -0800
Subject: [Buildroot] [buildroot 0000787]: Not all DirectFB libs are copied
	to target
Message-ID: <b18a5475e4eeb2ed63298ca833d0223f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=787 
====================================================================== 
Reported By:                tyler
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   787
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-16-2006 22:44 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    Not all DirectFB libs are copied to target
Description: 
libdirectfb* is copied to target, but when the package builds it also
builds libdirect* and libfusion*, which libdirectfb will call upon, but
they are not copied along with libdirectfb.

====================================================================== 

---------------------------------------------------------------------- 
 tyler - 03-27-06 09:53  
---------------------------------------------------------------------- 
I attached a patch for directfb.mk to install libdirect* and libfusion* to
target dir 

---------------------------------------------------------------------- 
 andersen - 04-06-06 10:43  
---------------------------------------------------------------------- 
applied, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-16-06 22:44  tyler          New Issue                                    
03-16-06 22:44  tyler          Status                   new => assigned     
03-16-06 22:44  tyler          Assigned To               => uClibc          
03-27-06 09:51  tyler          File Added: directfb.mk.patch                    
03-27-06 09:53  tyler          Note Added: 0001197                          
04-06-06 10:43  andersen       Note Added: 0001227                          
04-06-06 10:43  andersen       Status                   assigned => closed  
04-06-06 10:43  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
