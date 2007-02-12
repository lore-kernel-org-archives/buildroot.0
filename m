From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:58 -0800
Subject: [Buildroot] [buildroot 0000453]: hostap depends on pcmcia but
	doesn't select it.
Message-ID: <4adcf655f0fb124fc9108103224f626b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=453 
====================================================================== 
Reported By:                gnat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   453
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-29-2005 15:49 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    hostap depends on pcmcia but doesn't select it.
Description: 
When one selects hostap in buildroot, it attempts to build, but needs
pcmcia to be built as well, included patch adds that dependancy.
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-23-06 10:40  
---------------------------------------------------------------------- 
corrected as revision 13516. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-29-05 15:49  gnat           New Issue                                    
09-29-05 15:49  gnat           Status                   new => assigned     
09-29-05 15:49  gnat           Assigned To               => uClibc          
01-23-06 10:40  prpplague      Note Added: 0000984                          
01-23-06 10:40  prpplague      Status                   assigned => resolved
01-23-06 10:40  prpplague      Resolution               open => fixed       
03-08-06 16:55  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
