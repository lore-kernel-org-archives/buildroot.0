From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:34 -0800
Subject: [Buildroot] [buildroot 0000664]: bind package update
Message-ID: <9b34d44c48e55eb27e077549dcec2063@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=664 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   664
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-27-2006 14:23 PST
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    bind package update
Description: 
This patch consists of:
(1) bind version bump
(2) removing some X-compiling build fixes merged upstream
(3) removing the bind-dlopen patch: not of general enough use
(4) remove the package/bind/bind9 file - it isn't used
(5) Use $(STAGING_DIR)/lib instead of $(STAGING_DIR)/usr/lib
(6) Fix chroot'ed bind handling by init script

Thanks,
Devin Bayer
====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-14-06 12:26  
---------------------------------------------------------------------- 
applied 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-27-06 14:23  akvadrako      New Issue                                    
01-27-06 14:23  akvadrako      Status                   new => assigned     
01-27-06 14:23  akvadrako      Assigned To               => uClibc          
01-27-06 14:23  akvadrako      File Added: br-bind-9.3.2.patch                  
 
04-14-06 12:26  andersen       Note Added: 0001297                          
04-14-06 12:26  andersen       Status                   assigned => closed  
04-14-06 12:26  andersen       Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
