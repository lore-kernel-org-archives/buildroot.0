From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:09 -0800
Subject: [Buildroot] [buildroot 0001035]: Powerpc c++ compiler unresolved
	symbols
Message-ID: <a72d5147d3fc43b679248937b4c027a8@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1035 
====================================================================== 
Reported By:                GJanak
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1035
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-19-2006 10:08 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    Powerpc c++ compiler unresolved symbols
Description: 
A c++ compiler bould with current Snapshot Version of buildroot produce a
not working stdc++ library.

When I enable the C++  buidlroot enables Large File Support automaticaly.

All build together, the c++ compiler always fails linking a executable by
missing the symbols fstat64 fopen54 ftello64 and so on in libstdc++.so

Is this broken ?
====================================================================== 

---------------------------------------------------------------------- 
 GJanak - 09-19-06 11:18  
---------------------------------------------------------------------- 
6 hours later. fresh checkout, build on another Host.
And it works....

D'oh. 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 15:24  
---------------------------------------------------------------------- 
Closing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-19-06 10:08  GJanak         New Issue                                    
09-19-06 10:08  GJanak         Status                   new => assigned     
09-19-06 10:08  GJanak         Assigned To               => uClibc          
09-19-06 11:18  GJanak         Note Added: 0001637                          
11-22-06 15:24  bernhardf      Status                   assigned => closed  
11-22-06 15:24  bernhardf      Note Added: 0001785                          
11-22-06 15:24  bernhardf      Resolution               open => no change
required
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
