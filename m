From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 04:30:56 -0700
Subject: [Buildroot] [buildroot 0000526]: Missing header files when building
	libstdc++
Message-ID: <5c794046578e4390f473ed58a7eb63d3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=526 
====================================================================== 
Reported By:                thraxisp
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   526
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-03-2005 09:02 PST
Last Modified:              07-08-2007 04:30 PDT
====================================================================== 
Summary:                    Missing header files when building libstdc++
Description: 
The header file bits/atomic_word.h is missing from the final build of
libstdc++. They are located in
/include/c++/3.4.3/armeb_linux-uclibc/bits/, but these don't seem to be
searched.
====================================================================== 

---------------------------------------------------------------------- 
 thraxisp - 11-03-05 10:10  
---------------------------------------------------------------------- 
This may be a false alarm. There appear to be two sets (of mismatched)
libraries in my build. 

---------------------------------------------------------------------- 
 bernhardf - 12-28-06 01:09  
---------------------------------------------------------------------- 
Works for me with the fixes i just installed (revision 17099) for gcc-4.2
on i386. Please try 4.2 with the current uClibc snapshot and report back. 

---------------------------------------------------------------------- 
 bernhardf - 07-08-07 04:30  
---------------------------------------------------------------------- 
this was a local hickup. Closing upon reporter's request 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-03-05 09:02  thraxisp       New Issue                                    
11-03-05 09:02  thraxisp       Status                   new => assigned     
11-03-05 09:02  thraxisp       Assigned To               => uClibc          
11-03-05 10:10  thraxisp       Note Added: 0000651                          
12-28-06 01:09  bernhardf      Note Added: 0001946                          
12-28-06 01:09  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
07-08-07 04:30  bernhardf      Status                   assigned => closed  
07-08-07 04:30  bernhardf      Note Added: 0002572                          
======================================================================
