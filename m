From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:28 -0800
Subject: [Buildroot] [buildroot 0000852]: toolchain/kernel-headers (2.6.12):
	Sync struct i2c_msg with kernel definition
Message-ID: <770c5e5bc998563e7611a81568c75d57@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=852 
====================================================================== 
Reported By:                jacmet
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   852
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-26-2006 05:18 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    toolchain/kernel-headers (2.6.12): Sync struct
i2c_msg with kernel definition
Description: 
The struct i2c_msg definition in linux-libc-headers-2.6.12.0 has two extra
members not present in the kernel definition causing all kinds of
problems. This patch fixes that.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 04-28-06 12:44  
---------------------------------------------------------------------- 
Thanks. Fixed in 14954. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-26-06 05:18  jacmet         New Issue                                    
04-26-06 05:18  jacmet         Status                   new => assigned     
04-26-06 05:18  jacmet         Assigned To               => uClibc          
04-26-06 05:18  jacmet         File Added: kernel-headers-2.6.12-i2c_msg.patch  
                 
04-28-06 12:44  jacmet         Status                   assigned => closed  
04-28-06 12:44  jacmet         Note Added: 0001336                          
04-28-06 12:44  jacmet         Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
