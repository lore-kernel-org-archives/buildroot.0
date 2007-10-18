From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 17 Oct 2007 21:43:31 -0700
Subject: [Buildroot] [buildroot 0001537]: kexec doesn't build for arm/armeb
Message-ID: <b9207dd0e1bdd1199b33c460cf40f8b3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              10-17-2007 21:43 PDT
====================================================================== 
Summary:                    kexec doesn't build for arm/armeb
Description: 
kexec doesn't build on arm or armeb.

Problems are:
1. armeb not a supported architecture;
2. arm support patch needs to be updated due to an internal API change.

Fix is trivial - attached.
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 10-17-07 21:43  
---------------------------------------------------------------------- 
Use kexec-arm-fix2 instead. It fixes the incorrect syscall number in the
original source. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 22:32  hmoffatt       New Issue                                    
10-16-07 22:32  hmoffatt       Status                   new => assigned     
10-16-07 22:32  hmoffatt       Assigned To               => buildroot       
10-16-07 22:33  hmoffatt       File Added: kexec-arm-fix                    
10-17-07 21:42  hmoffatt       File Added: kexec-arm-fix2                    
10-17-07 21:43  hmoffatt       Note Added: 0002831                          
======================================================================
