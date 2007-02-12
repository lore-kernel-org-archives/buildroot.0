From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:55 -0800
Subject: [Buildroot] [buildroot 0000574]: Build for ARM 926T fails if option
	software floating point is enabled
Message-ID: <83dcd44c2c2d888fb90e66197e023e5f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=574 
====================================================================== 
Reported By:                Luis
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   574
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-01-2005 04:27 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    Build for ARM 926T fails if option software floating
point is enabled
Description: 
This error was reported by [1], but the proposed solution (update autoconf)
does not solve the error in this case.


My host infos:
gcc (GCC) 4.0.2 (Debian 4.0.2-2)
autoconf (GNU Autoconf) 2.59
buildroot-20051130

[1] http://bugs.busybox.net/view.php?id=299&nbn=3
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-01-05 04:27  Luis           New Issue                                    
12-01-05 04:27  Luis           Status                   new => assigned     
12-01-05 04:27  Luis           Assigned To               => uClibc          
12-01-05 04:27  Luis           File Added: .config                          
01-23-06 08:16  prpplague      Status                   assigned => resolved
01-23-06 08:16  prpplague      Resolution               open => fixed       
01-23-06 08:16  prpplague      Additional Information Updated                   

03-08-06 16:55  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
