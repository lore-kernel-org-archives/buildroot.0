From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:46 -0800
Subject: [Buildroot] [buildroot 0000721]: updated package: target/x86/grub
Message-ID: <d6ddf291268559be6849ffcff2c44fa0@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=721 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   721
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-16-2006 02:01 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    updated package: target/x86/grub
Description: 
added diskless/net support and new patches (mainly network drivers).
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 09:16  
---------------------------------------------------------------------- 
Sounds nice. Can you please respin the patch against current trunk?
TIA, 

---------------------------------------------------------------------- 
 janlana - 01-29-07 07:52  
---------------------------------------------------------------------- 
patch updated, runtime interactions between net and splash patches were not
tested. 

---------------------------------------------------------------------- 
 bernhardf - 01-29-07 13:19  
---------------------------------------------------------------------- 
Applied to svn. Thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-16-06 02:01  janlana        New Issue                                    
02-16-06 02:01  janlana        Status                   new => assigned     
02-16-06 02:01  janlana        Assigned To               => uClibc          
02-16-06 02:01  janlana        File Added: grub.diff                        
01-21-07 09:16  bernhardf      Note Added: 0002023                          
01-21-07 09:16  bernhardf      Status                   assigned => feedback
01-29-07 07:52  janlana        Note Added: 0002066                          
01-29-07 07:52  janlana        File Added: grub_070129.patch                    
01-29-07 13:19  bernhardf      Status                   feedback => closed  
01-29-07 13:19  bernhardf      Note Added: 0002068                          
01-29-07 13:19  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
