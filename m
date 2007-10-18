From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 17 Oct 2007 22:27:31 -0700
Subject: [Buildroot] [buildroot 0001537]: kexec doesn't build for arm/armeb
Message-ID: <a1a26c05871e60062b21dcb76a88bbe1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
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
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             10-16-2007 22:32 PDT
Last Modified:              10-17-2007 22:27 PDT
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

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-17-07 22:27  
---------------------------------------------------------------------- 
kexec-arm-fix2 has been applied in revision 20278 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 22:32  hmoffatt       New Issue                                    
10-16-07 22:32  hmoffatt       Status                   new => assigned     
10-16-07 22:32  hmoffatt       Assigned To               => buildroot       
10-16-07 22:33  hmoffatt       File Added: kexec-arm-fix                    
10-17-07 21:42  hmoffatt       File Added: kexec-arm-fix2                    
10-17-07 21:43  hmoffatt       Note Added: 0002831                          
10-17-07 22:27  UlfSamuelsson  Status                   assigned => resolved
10-17-07 22:27  UlfSamuelsson  Resolution               open => fixed       
10-17-07 22:27  UlfSamuelsson  Note Added: 0002832                          
======================================================================
