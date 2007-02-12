From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:31 -0800
Subject: [Buildroot] [buildroot 0000797]: Buildroot doesn't build toolchain
Message-ID: <bab65e74e23660ae93513b2b363bdbac@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=797 
====================================================================== 
Reported By:                Zhukov
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   797
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-24-2006 06:56 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    Buildroot doesn't build toolchain
Description: 
Selected options: arm, arm920t, kernel 2.6.12. 
Buildroot stops at the fisrt call to arm-linux-uclibc-gcc, for it didn't
download and build it.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 03-24-06 08:32  
---------------------------------------------------------------------- 
you looked at the wrong error message

your host make is too old, upgrade to 3.80 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-24-06 06:56  Zhukov         New Issue                                    
03-24-06 06:56  Zhukov         Status                   new => assigned     
03-24-06 06:56  Zhukov         Assigned To               => uClibc          
03-24-06 06:56  Zhukov         File Added: buildroot.log                    
03-24-06 08:32  vapier         Note Added: 0001194                          
03-24-06 08:32  vapier         Status                   assigned => closed  
03-24-06 08:32  vapier         Resolution               open => won't fix   
03-29-06 03:48  aroman         Issue Monitored: aroman                      
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
