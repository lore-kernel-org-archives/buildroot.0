From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 22 Nov 2007 08:45:39 -0800
Subject: [Buildroot] [buildroot 0001602]: [PATCH] nios2: Updated toolchain
	patches
Message-ID: <1da4e1a70bcabb79ebfc4c3d2f6c4cb3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1602 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1602
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-22-2007 08:16 PST
Last Modified:              11-22-2007 08:45 PST
====================================================================== 
Summary:                    [PATCH] nios2: Updated toolchain patches
Description: 
Updates the nios2-patches for binutils-2.15 and gcc-3.4.6 with the latest
sources from Altera, and removes obsolete patches.

====================================================================== 

---------------------------------------------------------------------- 
 atle - 11-22-07 08:45  
---------------------------------------------------------------------- 
Added patch for elf2flt (elf2flt-nios2-dwarf_error-fix.diff) which fixes
gdb DWARF errors. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-22-07 08:16  atle           New Issue                                    
11-22-07 08:16  atle           Status                   new => assigned     
11-22-07 08:16  atle           Assigned To               => buildroot       
11-22-07 08:16  atle           File Added: binutils-nios2-svn20471.diff.gz      
             
11-22-07 08:16  atle           File Added: gcc-3.4.6-nios2-svn20471.diff.gz     
              
11-22-07 08:17  atle           File Added: gcc-3.x-makefile-svn20471.diff.gz    
               
11-22-07 08:42  atle           File Added: elf2flt-nios2-dwarf_error-fix.diff   
                
11-22-07 08:45  atle           Note Added: 0002948                          
======================================================================
