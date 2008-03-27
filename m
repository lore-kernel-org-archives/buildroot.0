From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 26 Mar 2008 17:07:02 -0700
Subject: [Buildroot] [buildroot 0002694]: busybox generates illegal
	instruction error on ARM platform
Message-ID: <a7b7533c001839146cf389c646b86c02@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2694 
====================================================================== 
Reported By:                ychuang
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2694
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-26-2008 04:30 PDT
Last Modified:              03-26-2008 17:07 PDT
====================================================================== 
Summary:                    busybox generates illegal instruction error on ARM
platform
Description: 
After applying current new patchs (using svn) for buildroot, busybox
commands: insmod, rmmod, and ping generate illegal instruction error after
rebuilding the whole toolchain and recompiling busybox 1.9 (or 1.10).

busybox 1.9.0 was working with old toolchain back on 2007/11/02.
====================================================================== 

---------------------------------------------------------------------- 
 hbr_in - 03-26-08 17:07  
---------------------------------------------------------------------- 
Hi,

I also had the same issue with busybox and buildroot. Then i updated my
buildroot and busybox config and its working fine now. I have tested it
against Busybox-1.9.1 version. Attached is the buildroot and busybox
config files.
Let me know if this has helped you any way.

Regards
Gururaja 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-26-08 04:30  ychuang        New Issue                                    
03-26-08 04:30  ychuang        Status                   new => assigned     
03-26-08 04:30  ychuang        Assigned To               => buildroot       
03-26-08 04:30  ychuang        File Added: .config                          
03-26-08 17:00  hbr_in         File Added: myboard_defconfig                    
03-26-08 17:00  hbr_in         File Added: busybox-1.9.1-full_opti.config       
            
03-26-08 17:07  hbr_in         Note Added: 0006094                          
======================================================================
