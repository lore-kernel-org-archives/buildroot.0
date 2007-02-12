From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:34 -0800
Subject: [Buildroot] [buildroot 0001031]: header files
Message-ID: <381e2909285d7fa9c16f682e1ab3ea3d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1031 
====================================================================== 
Reported By:                cheng
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1031
Category:                   Other
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-18-2006 13:35 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    header files
Description: 
buildroot has support for kernel headers up to 2.4.25.
i am using a target kernel of 2.4.20 and keep getting seg fault
of compiled applications. however, simpler programs worked fine.

i suspect it's a kernel header issue. can buildroot include
sanitized header for 2.4.20 kernel? there are still a number
of cpu out there which uses this out of factory.

i can work on upgrading the whole kernel or downgrading the
header. guess the latter would be the first choice to avoid
peripheral support issue.

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 01:22  
---------------------------------------------------------------------- 
buildroot supports 2.4.25 kernel-headers as the oldest headers.

Even 2.4.25 is two and a half year old, 2.4.20 would be more than 4 years
old!
Current is 2.6.19.1, closing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-18-06 13:35  cheng          New Issue                                    
09-18-06 13:35  cheng          Status                   new => assigned     
09-18-06 13:35  cheng          Assigned To               => uClibc          
12-22-06 01:22  bernhardf      Status                   assigned => closed  
12-22-06 01:22  bernhardf      Note Added: 0001908                          
12-22-06 01:22  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
