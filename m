From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 17 Jul 2008 03:40:15 -0700
Subject: [Buildroot] [buildroot 0001649]: avr32 & netplug-1.2.9
Message-ID: <716b0e33ca5e16abc3d98e1a7b7b65ce@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             12-06-2007 17:53 PST
Last Modified:              07-17-2008 03:40 PDT
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
07-16-08 08:02  bernhardf      Status                   resolved => new     
07-17-08 03:40  bernhardf      Status                   new => closed       
======================================================================
