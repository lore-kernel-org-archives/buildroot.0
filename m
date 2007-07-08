From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 04:31:43 -0700
Subject: [Buildroot] [buildroot 0000558]: mixed libraries when compiling
	libstdc++
Message-ID: <f92de15b05af7beae7af23fff15417d8@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-23-2005 14:08 PST
Last Modified:              07-08-2007 04:31 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 07-08-07 04:31  
---------------------------------------------------------------------- 
works for me.. 

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
07-08-07 04:31  bernhardf      Status                   assigned => closed  
07-08-07 04:31  bernhardf      Note Added: 0002573                          
======================================================================
