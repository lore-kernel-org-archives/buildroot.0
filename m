From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 07:53:21 -0800
Subject: [Buildroot] [buildroot 0001614]: Kernel headers unavailable for
	external toolchain-based builds
Message-ID: <ee5dac9a7e2c3bea71781423e8e00a0c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1614 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1614
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 06:41 PST
Last Modified:              11-27-2007 07:53 PST
====================================================================== 
Summary:                    Kernel headers unavailable for external
toolchain-based builds
Description: 
Kernel headers are part of the "buildroot toolchain" option, and therefore
won't be offered at all for external toolchains, even though external
toolchains may come without kernel headers.

Attached is a patch to decouple kernel header selection from the toolchain
selection.
====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 11-27-07 07:53  
---------------------------------------------------------------------- 
This patch is against an old version of buildroot, and won't apply
cleanly. 
It should depend on BR2_TOOLCHAIN_EXTERNAL 
and be within the "Toolchain" menu. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 06:41  ikonst         New Issue                                    
11-27-07 06:41  ikonst         Status                   new => assigned     
11-27-07 06:41  ikonst         Assigned To               => buildroot       
11-27-07 06:41  ikonst         File Added:
kernel-headers-for-external-toolchain.patch                    
11-27-07 07:53  UlfSamuelsson  Note Added: 0002974                          
======================================================================
