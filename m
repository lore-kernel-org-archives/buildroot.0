From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 30 Oct 2007 14:44:31 -0700
Subject: [Buildroot] [buildroot 0001537]: kexec doesn't build for arm/armeb
Message-ID: <f4878ebdb2a6ab47b83afbeec30410da@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             10-16-2007 22:32 PDT
Last Modified:              10-30-2007 14:44 PDT
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

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-30-07 14:44  
---------------------------------------------------------------------- 
FIxed 

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
10-30-07 14:44  UlfSamuelsson  Status                   resolved => closed  
10-30-07 14:44  UlfSamuelsson  Note Added: 0002881                          
======================================================================
