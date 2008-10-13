From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Oct 2008 09:11:06 -0700
Subject: [Buildroot] [buildroot 0003564]: libgtk.mk redefines
	PKG_CONFIG_PATH, not necessary
Message-ID: <07ae83d9872baebec2c99e4acf848cbf@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3564 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3564
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-03-2008 05:03 PDT
Last Modified:              10-13-2008 09:11 PDT
====================================================================== 
Summary:                    libgtk.mk redefines PKG_CONFIG_PATH, not necessary
Description: 
libgtk.mk currently redefines PKG_CONFIG_PATH.  This is not necessary as
specified in configure enviroment.  In my case I have added
usr/local/lib/pkgconfig as well and without this fix I need to edit
multiple makefiles not just package/Makefile.in.  
====================================================================== 

---------------------------------------------------------------------- 
 tpetazzoni - 10-13-08 09:11  
---------------------------------------------------------------------- 
Fixed by r23204, please close this bug. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:03  daniellaird    New Issue                                    
06-03-08 05:03  daniellaird    Status                   new => assigned     
06-03-08 05:03  daniellaird    Assigned To               => buildroot       
06-03-08 05:03  daniellaird    File Added: libgtk_build_fix.patch               
    
10-13-08 09:11  tpetazzoni     Note Added: 0013474                          
======================================================================
