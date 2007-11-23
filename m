From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 23 Nov 2007 02:37:59 -0800
Subject: [Buildroot] [buildroot 0001602]: [PATCH] nios2: Updated toolchain
	patches
Message-ID: <6865d3de868cb4800d23d00e3b3b7e69@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-22-2007 08:16 PST
Last Modified:              11-23-2007 02:37 PST
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

---------------------------------------------------------------------- 
 vanokuten - 11-23-07 02:37  
---------------------------------------------------------------------- 
patches applied in rev 20492 

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
11-23-07 02:37  vanokuten      Status                   assigned => closed  
11-23-07 02:37  vanokuten      Note Added: 0002952                          
======================================================================
