From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 19 Oct 2007 01:19:12 -0700
Subject: [Buildroot] [buildroot 0001542]: arm gcc-4.1.2 + oabi + soft floats
	fails to build
Message-ID: <90e28420e271f11d8ba34a6bf88df8e2@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1542 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1542
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-19-2007 01:19 PDT
Last Modified:              10-19-2007 01:19 PDT
====================================================================== 
Summary:                    arm gcc-4.1.2 + oabi + soft floats fails to build
Description: 
gcc 4.1.2 fails to build for OABI with soft floats enabled, with references
to missing float functions.

The patch I supplied for gcc-4.2.1 works as-is for 4.1.2 also.
So copying toolchain/gcc/4.2.1/910-soft-float.patch to toolchain/gcc/4.1.2
will fix this.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-19-07 01:19  hmoffatt       New Issue                                    
10-19-07 01:19  hmoffatt       Status                   new => assigned     
10-19-07 01:19  hmoffatt       Assigned To               => buildroot       
======================================================================
