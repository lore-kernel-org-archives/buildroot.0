From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 15 Jun 2008 13:00:38 -0700
Subject: [Buildroot] [buildroot 0003764]: elf2flt doesn't support powerpc
Message-ID: <abba5b468871b82b8bef2c3183fb3f98@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3764 
====================================================================== 
Reported By:                fabo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3764
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             06-15-2008 03:55 PDT
Last Modified:              06-15-2008 13:00 PDT
====================================================================== 
Summary:                    elf2flt doesn't support powerpc
Description: 
elf2flt doesn't support powerpc:

buildroot/toolchain_build_powerpc/elf2flt/elf2flt.c:115:2: error: #error
"Don't know how to support your CPU architecture??"

I guess elf2flt must be disabled if powerpc architecture is used.
However, I've seen some patches on internet that add powerpc support.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 06-15-08 13:00  
---------------------------------------------------------------------- 
There's afaik no uclinux (E.G. mmu-less Linux) support for powerpc. Why
would you want that? What processor are you using? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-15-08 03:55  fabo           New Issue                                    
06-15-08 03:55  fabo           Status                   new => assigned     
06-15-08 03:55  fabo           Assigned To               => buildroot       
06-15-08 13:00  jacmet         Status                   assigned => resolved
06-15-08 13:00  jacmet         Resolution               open => fixed       
06-15-08 13:00  jacmet         Note Added: 0008254                          
======================================================================
