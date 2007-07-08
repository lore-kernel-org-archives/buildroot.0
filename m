From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 04:35:49 -0700
Subject: [Buildroot] [buildroot 0001087]: Followup to #904 - Problem
	building libstdc++ - patch not present in buildroot
Message-ID: <1bfd581ed80624d5d9e867b9d39894c6@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1087 
====================================================================== 
Reported By:                mikewhit
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1087
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-08-2006 01:38 PST
Last Modified:              07-08-2007 04:35 PDT
====================================================================== 
Summary:                    Followup to http://busybox.net/bugs/view.php?id=904
- Problem building libstdc++ - patch not present in buildroot
Description: 
Further to the issue raised in http://busybox.net/bugs/view.php?id=904.

The problem persists (buildroot snapshot 2006-10-31).
Judging by the Note in http://busybox.net/bugs/view.php?id=904, it is expected
that a buildroot patch
addresses this problem.
This does not appear to be the case.

The only gcc libstdc++ patches are 300 and 602, neither of which addresses
this point.

http://busybox.net/bugs/view.php?id=904 should not have been closed until this
issue had been properly
resolved (IMHO ;-)
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-28-06 01:06  
---------------------------------------------------------------------- 
This report is too convoluted by references for me to follow..

Works for me with the fixes i just installed for gcc-4.2 on i386. Please
try 4.2 and report back. 

---------------------------------------------------------------------- 
 bernhardf - 07-08-07 04:35  
---------------------------------------------------------------------- 
no response within a couple of months. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-06 01:38  mikewhit       New Issue                                    
11-08-06 01:38  mikewhit       Status                   new => assigned     
11-08-06 01:38  mikewhit       Assigned To               => uClibc          
11-08-06 01:38  mikewhit       File Added: bldcpp.config                    
12-28-06 01:06  bernhardf      Note Added: 0001942                          
12-28-06 01:06  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
07-08-07 04:35  bernhardf      Status                   assigned => closed  
07-08-07 04:35  bernhardf      Note Added: 0002575                          
======================================================================
