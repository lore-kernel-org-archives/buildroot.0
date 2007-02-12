From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:00 -0800
Subject: [Buildroot] [buildroot 0000525]: New package: dialog
Message-ID: <d2ae92f64e12beafe6c59bd52e55073c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=525 
====================================================================== 
Reported By:                asdfgh
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   525
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-01-2005 07:27 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    New package: dialog
Description: 
I'm using this package in my environment, it would be very nice to include
this in buildroot.
====================================================================== 

---------------------------------------------------------------------- 
 crafterm - 11-29-05 08:58  
---------------------------------------------------------------------- 
Hi Mate,

Dialog requires ncurses right? Should we add a "select BR_PACKAGE_NCURSES"
to the Config.in so that it's automatically configured?

Cheers,

Marcus 

---------------------------------------------------------------------- 
 asdfgh - 12-01-05 08:16  
---------------------------------------------------------------------- 
Yes dialog depends on ncurses, so it should be added.

Regards,
Peter 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-01-05 07:27  asdfgh         New Issue                                    
11-01-05 07:27  asdfgh         Status                   new => assigned     
11-01-05 07:27  asdfgh         Assigned To               => uClibc          
11-01-05 07:27  asdfgh         File Added: dialog-buildroot.gz                  
 
11-29-05 08:58  crafterm       Note Added: 0000712                          
12-01-05 08:16  asdfgh         Note Added: 0000718                          
01-23-06 10:52  prpplague      Status                   assigned => resolved
01-23-06 10:52  prpplague      Resolution               open => fixed       
01-23-06 10:52  prpplague      Additional Information Updated                   

03-08-06 16:55  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
