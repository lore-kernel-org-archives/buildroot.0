From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:11 -0800
Subject: [Buildroot] [buildroot 0001207]: configure script in ed_2.0 does
	not properly find the the ANSI C headers in gumstix toolchain
Message-ID: <fa10764e368f9c61723e22f0cd4b24c0@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1207 
====================================================================== 
Reported By:                codehero
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1207
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-11-2007 08:05 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    configure script in ed_2.0 does not properly find
the the ANSI C headers in gumstix toolchain
Description: 
It seems that the configure script in ed does not find ANSI C headers when
I use the gumstix toolchain. Thus it ends up using implicit definitions
for functions like malloc and not properly linking when the executable is
built.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-11-07 10:05  
---------------------------------------------------------------------- 
What's your
$ grep EXTERN .config 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-11-07 08:05  codehero       New Issue                                    
02-11-07 08:05  codehero       Status                   new => assigned     
02-11-07 08:05  codehero       Assigned To               => uClibc          
02-11-07 10:05  bernhardf      Note Added: 0002148                          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
