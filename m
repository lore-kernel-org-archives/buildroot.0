From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:48 -0800
Subject: [Buildroot] [buildroot 0000526]: Missing header files when building
	libstdc++
Message-ID: <5b69999f80479ba2f7874b4e14488b0c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             11-03-2005 09:02 PST
Last Modified:              02-12-2007 05:33 PST
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
======================================================================
