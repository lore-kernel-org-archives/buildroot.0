From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:08 -0800
Subject: [Buildroot] [buildroot 0000400]: Update to tcpdump package
Message-ID: <836ba609620a8dc3637a7052e54f33df@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=400 
====================================================================== 
Reported By:                daisuke
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   400
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-23-2005 05:47 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Update to tcpdump package
Description: 
This patch updates the tcpdump package to build version 3.9.3, and the 
dhcpdump to build version 1.7. This patch need the libpcap 0.9.3 patch by
ID 0000399.

This patch was created against buildroot-20050823 snapshot.

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-23-05 22:41  
---------------------------------------------------------------------- 
thanks, now in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-23-05 05:47  daisuke        New Issue                                    
08-23-05 05:47  daisuke        Status                   new => assigned     
08-23-05 05:47  daisuke        Assigned To               => uClibc          
08-23-05 05:47  daisuke        File Added: tcpdump.patch                    
09-06-05 01:33  martin         Issue Monitored: martin                      
09-23-05 22:41  vapier         Note Added: 0000572                          
09-23-05 22:41  vapier         Status                   assigned => closed  
09-23-05 22:41  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
