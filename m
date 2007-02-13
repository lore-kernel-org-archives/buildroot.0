From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 13 Feb 2007 09:49:29 -0800
Subject: [Buildroot] [buildroot 0001197]: UCLIBC_HAS_RPC should be part of
	the default config
Message-ID: <8af55025d6228f77ccfe0672ea877261@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             02-05-2007 17:48 PST
Last Modified:              02-13-2007 09:49 PST
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
======================================================================
