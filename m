From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 8 Nov 2007 05:29:35 -0800
Subject: [Buildroot] [buildroot 0001580]: [PATCH] Updated nios2 support for
	buildroot
Message-ID: <364b5025193101871480204522c10844@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1580 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1580
Category:                   Architecture Specific
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-08-2007 05:06 PST
Last Modified:              11-08-2007 05:29 PST
====================================================================== 
Summary:                    [PATCH] Updated nios2 support for buildroot
Description: 
The attached patches fixes toolchain build for nios2 with the recent
buildroot, and adds some new features:

* Support for c++
* Support for using 2.6.23 kernel headers

====================================================================== 

---------------------------------------------------------------------- 
 atle - 11-08-07 05:14  
---------------------------------------------------------------------- 
C++ support depends on the patch in
http://bugs.uclibc.org/view.php?id=1579.

 

---------------------------------------------------------------------- 
 atle - 11-08-07 05:29  
---------------------------------------------------------------------- 
The uClibc build insists on installing ldd/ldconfig even though their not
built. Suggested solution attached (uclibc-hostutils-install.diff). 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-07 05:06  atle           New Issue                                    
11-08-07 05:06  atle           Status                   new => assigned     
11-08-07 05:06  atle           Assigned To               => buildroot       
11-08-07 05:06  atle           File Added: binutils-nios2.diff.gz               
    
11-08-07 05:07  atle           File Added: elf2flt-nios2.diff.gz                
   
11-08-07 05:07  atle           File Added: gcc-nios2.diff.gz                    
11-08-07 05:07  atle           File Added: kernel-headers-nios2.diff.gz         
          
11-08-07 05:12  atle           Note Added: 0002897                          
11-08-07 05:14  atle           Note Edited: 0002897                         
11-08-07 05:27  atle           File Added: uclibc-hostutils-install.diff        
           
11-08-07 05:29  atle           Note Added: 0002898                          
======================================================================
