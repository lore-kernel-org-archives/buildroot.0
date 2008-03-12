From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 12 Mar 2008 01:32:37 -0700
Subject: [Buildroot] [buildroot 0002504]: buildroot fails: directory
	"kernel-patches-2.6.24" does not exist
Message-ID: <e2d8bb846810c67d33d7710bc0f8c190@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2504 
====================================================================== 
Reported By:                chris_k
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2504
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-10-2008 04:42 PDT
Last Modified:              03-12-2008 01:32 PDT
====================================================================== 
Summary:                    buildroot fails: directory "kernel-patches-2.6.24"
does not exist
Description: 
building buildroot aborts, since directory
target/device/x86/i386/kernel-patches-2.6.24 does not exist.

toolchain/patch-kernel.sh
/home/cklaiber/buildroot/project_build_i486/uclibc/linux-2.6.24
target/device/x86/i386/kernel-patches-2.6.24/ linux-2.6.24-\*.patch ; 
Aborting.  'target/device/x86/i386/kernel-patches-2.6.24/' is not a
directory.
make: ***
[/home/cklaiber/buildroot/project_build_i486/uclibc/linux-2.6.24/.patched]
Fehler 1

====================================================================== 

---------------------------------------------------------------------- 
 KHAksnes - 03-12-08 01:32  
---------------------------------------------------------------------- 
The obvious workaround:
mkdir target/device/x86/i36/kernel-patches-2.6.24 
works well. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-10-08 04:42  chris_k        New Issue                                    
03-10-08 04:42  chris_k        Status                   new => assigned     
03-10-08 04:42  chris_k        Assigned To               => buildroot       
03-10-08 07:23  grindars       Issue Monitored: grindars                    
03-11-08 15:46  KHAksnes       Issue Monitored: KHAksnes                    
03-12-08 01:32  KHAksnes       Note Added: 0005654                          
======================================================================
