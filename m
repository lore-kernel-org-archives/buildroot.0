From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:49 -0800
Subject: [Buildroot] [buildroot 0000558]: mixed libraries when compiling
	libstdc++
Message-ID: <5e023b1927f32d51fadb30defacb261e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=558 
====================================================================== 
Reported By:                thraxisp
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   558
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-23-2005 14:08 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    mixed libraries when compiling libstdc++
Description: 
The compiler seems to mix host and target libraries when building
libstdc++. The log below has start and end files from the host, but the
rest was just compiled as the target.

SVN updated buildroot
gcc 3.4.3
building c++ and libstdc++ library
uclibc 0.9.28, bintools 2.16.1
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-28-06 01:08  
---------------------------------------------------------------------- 
Works for me with the fixes i just installed (revision 17099) for gcc-4.2
on i386. Please try 4.2 and report back. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-23-05 14:08  thraxisp       New Issue                                    
11-23-05 14:08  thraxisp       Status                   new => assigned     
11-23-05 14:08  thraxisp       Assigned To               => uClibc          
12-28-06 01:08  bernhardf      Note Added: 0001945                          
12-28-06 01:08  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
