From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 14 Feb 2007 18:59:27 -0800
Subject: [Buildroot] [buildroot 0001208]: sqllite cannot link to
	/lib/libc.so when building for gumstix
Message-ID: <2f8fc1c9e67c80387d2e6cb63168483f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1208 
====================================================================== 
Reported By:                codehero
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1208
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-11-2007 08:08 PST
Last Modified:              02-14-2007 18:59 PST
====================================================================== 
Summary:                    sqllite cannot link to /lib/libc.so when building
for gumstix
Description: 
No idea why this is happening, there don't seem to be any problems in
compilation
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-11-07 10:05  
---------------------------------------------------------------------- 
What's your
$ grep EXTERN .config 

---------------------------------------------------------------------- 
 codehero - 02-11-07 10:23  
---------------------------------------------------------------------- 
grep EXTERN .config yields nothing 

---------------------------------------------------------------------- 
 codehero - 02-11-07 10:23  
---------------------------------------------------------------------- 
grep EXTERN .config yields nothing 

---------------------------------------------------------------------- 
 codehero - 02-14-07 18:59  
---------------------------------------------------------------------- 
this is my configure/compile output 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-11-07 08:08  codehero       New Issue                                    
02-11-07 08:08  codehero       Status                   new => assigned     
02-11-07 08:08  codehero       Assigned To               => uClibc          
02-11-07 10:05  bernhardf      Note Added: 0002147                          
02-11-07 10:23  codehero       Note Added: 0002150                          
02-11-07 10:23  codehero       Note Added: 0002151                          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
02-14-07 18:59  codehero       Note Added: 0002165                          
======================================================================
