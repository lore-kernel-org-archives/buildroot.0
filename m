From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:43 -0800
Subject: [Buildroot] [buildroot 0000510]: New Package: popt
Message-ID: <29f9f1b06ac4c094b1d3380198f5873d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=510 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   510
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:22 PDT
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    New Package: popt
Description: 
Popt was heavily influenced by the getopt() and getopt_long() functions,
but it allows more powerful argument expansion. It can parse arbitrary
argv[] style arrays and automatically set variables based on command
line arguments. It also allows command line arguments to be aliased via
configuration files and includes utility functions for parsing arbitrary
strings into argv[] arrays using shell-like rules.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:22  akvadrako      New Issue                                    
10-28-05 09:22  akvadrako      Status                   new => assigned     
10-28-05 09:22  akvadrako      Assigned To               => uClibc          
10-28-05 09:22  akvadrako      File Added: br-popt-package.patch                
   
01-25-06 13:00  prpplague      Status                   assigned => closed  
01-25-06 13:00  prpplague      Resolution               open => fixed       
01-25-06 13:00  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
