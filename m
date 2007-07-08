From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 04:19:12 -0700
Subject: [Buildroot] [buildroot 0001207]: configure script in ed_2.0 does
	not properly find the the ANSI C headers in gumstix toolchain
Message-ID: <29d93d2d2c8249f39a38e2f0fae21e59@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-11-2007 08:05 PST
Last Modified:              07-08-2007 04:19 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 07-08-07 04:19  
---------------------------------------------------------------------- 
By now we switched to ed-0.6. If there still are some includes missing,
then please fix upstream. Closing 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-11-07 08:05  codehero       New Issue                                    
02-11-07 08:05  codehero       Status                   new => assigned     
02-11-07 08:05  codehero       Assigned To               => uClibc          
02-11-07 10:05  bernhardf      Note Added: 0002148                          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
07-08-07 04:19  bernhardf      Status                   assigned => closed  
07-08-07 04:19  bernhardf      Note Added: 0002569                          
======================================================================
