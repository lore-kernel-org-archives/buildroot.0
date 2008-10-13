From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Oct 2008 09:13:36 -0700
Subject: [Buildroot] [buildroot 0003554]: Make libgtk2 visible with DirectFB
	and not just XORG
Message-ID: <625d1a265ce744295fe4e5226051eef5@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3554 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3554
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-03-2008 05:00 PDT
Last Modified:              10-13-2008 09:13 PDT
====================================================================== 
Summary:                    Make libgtk2 visible with DirectFB and not just XORG
Description: 
libgtk2 is currently dependent on XORG being selected in some form or
another.  You may only have DirectFB is which case gtk is currently not
selectable.
====================================================================== 

---------------------------------------------------------------------- 
 tpetazzoni - 10-13-08 09:13  
---------------------------------------------------------------------- 
Fixed by r23204, please close this bug. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:00  daniellaird    New Issue                                    
06-03-08 05:00  daniellaird    Status                   new => assigned     
06-03-08 05:00  daniellaird    Assigned To               => buildroot       
06-03-08 05:00  daniellaird    File Added: gtk_and_directfb_support.patch       
            
10-13-08 09:13  tpetazzoni     Note Added: 0013484                          
======================================================================
