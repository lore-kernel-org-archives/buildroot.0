From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:10 -0800
Subject: [Buildroot] [buildroot 0001208]: sqllite cannot link to
	/lib/libc.so when building for gumstix
Message-ID: <0f804b54a6119daa3f2b51bec175217e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
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
Last Modified:              02-12-2007 05:33 PST
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
======================================================================
