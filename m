From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 17 Apr 2007 10:59:31 -0700
Subject: [Buildroot] [buildroot 0001197]: UCLIBC_HAS_RPC should be part of
	the default config
Message-ID: <af5858fdf2c6197fbbe1f6d2bb2020b0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1197 
====================================================================== 
Reported By:                smithj
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1197
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-05-2007 17:48 PST
Last Modified:              04-17-2007 10:59 PDT
====================================================================== 
Summary:                    UCLIBC_HAS_RPC should be part of the default config
Description: 
Busybox's default config should be buildable with uclibc's default config.
Busybox's default has CONFIG_FEATURE_MOUNT_NFS=y, which requires
UCLIBC_HAS_RPC=y. However, the default "defconfig" in uclibc has this
feature undefined.
====================================================================== 

---------------------------------------------------------------------- 
 smithj - 02-05-07 17:50  
---------------------------------------------------------------------- 
Sorry, obviously this is not arch-specific, but i can't seem to change it
now... 

---------------------------------------------------------------------- 
 bernhardf - 04-17-07 10:59  
---------------------------------------------------------------------- 
Fixed in busybox-1.5.0 which has MOUNT_NFS off per default. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-05-07 17:48  smithj         New Issue                                    
02-05-07 17:48  smithj         Status                   new => assigned     
02-05-07 17:48  smithj         Assigned To               => uClibc          
02-05-07 17:48  smithj         Issue Monitored: smithj                      
02-05-07 17:50  smithj         Note Added: 0002123                          
02-13-07 09:49  vapier         Project                  uClibc => buildroot 
02-13-07 09:49  vapier         Assigned To              uClibc => buildroot 
02-13-07 09:49  vapier         Category                 Architecture Specific =>
Other
02-13-07 09:49  vapier         version                  0.9.28 =>           
04-17-07 10:59  bernhardf      Status                   assigned => closed  
04-17-07 10:59  bernhardf      Note Added: 0002325                          
======================================================================
