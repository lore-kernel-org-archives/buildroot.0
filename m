From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 16 Oct 2007 22:33:00 -0700
Subject: [Buildroot] [buildroot 0001537]: kexec doesn't build for arm/armeb
Message-ID: <9e896385eff33f3870e5581612e438ff@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1537 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1537
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-16-2007 22:32 PDT
Last Modified:              10-16-2007 22:33 PDT
====================================================================== 
Summary:                    kexec doesn't build for arm/armeb
Description: 
kexec doesn't build on arm or armeb.

Problems are:
1. armeb not a supported architecture;
2. arm support patch needs to be updated due to an internal API change.

Fix is trivial - attached.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 22:32  hmoffatt       New Issue                                    
10-16-07 22:32  hmoffatt       Status                   new => assigned     
10-16-07 22:32  hmoffatt       Assigned To               => buildroot       
10-16-07 22:33  hmoffatt       File Added: kexec-arm-fix                    
======================================================================
