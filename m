From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 27 Feb 2008 18:20:12 -0800
Subject: [Buildroot] [buildroot 0001649]: avr32 & netplug-1.2.9
Message-ID: <a677327d3bc555282a81b587728d1e55@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1649 
====================================================================== 
Reported By:                dl9pf
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1649
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             12-06-2007 17:53 PST
Last Modified:              02-27-2008 18:20 PST
====================================================================== 
Summary:                    avr32 & netplug-1.2.9
Description: 
Fix for netplug-1.2.9 building with avr32

netlink.c  line 287:

change:
int addr_len

to:
socklen_t addr_len



====================================================================== 

---------------------------------------------------------------------- 
 sjhill - 02-27-08 18:20  
---------------------------------------------------------------------- 
Fixed in commit http://busybox.net/bugs/view.php?id=21131. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-06-07 17:53  dl9pf          New Issue                                    
12-06-07 17:53  dl9pf          Status                   new => assigned     
12-06-07 17:53  dl9pf          Assigned To               => buildroot       
02-27-08 18:20  sjhill         Status                   assigned => resolved
02-27-08 18:20  sjhill         Resolution               open => fixed       
02-27-08 18:20  sjhill         Note Added: 0005484                          
======================================================================
