From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 20 Oct 2008 01:59:08 -0700
Subject: [Buildroot] [buildroot 0005584]: Makefiles for mdadm needs to be
	updated
Message-ID: <a43d3f43d2f3193f24d0ea85402a048e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5584 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5584
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-20-2008 00:56 PDT
Last Modified:              10-20-2008 01:59 PDT
====================================================================== 
Summary:                    Makefiles for mdadm needs to be updated
Description: 
The mdadm version used by buildroot svn 23730 is no longer available at the
debian repositories, the file mdadm_2.6.4-2.diff.gz can't be found at the
debian repositories.
Reproduce by configuring any version of buildroot using mdadm and then run

make source after clearing the dl directory.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 10-20-08 01:59  
---------------------------------------------------------------------- 
There is absolutely no need to wipe your DL_DIR. Just run make
source-check. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-20-08 00:56  KHAksnes       New Issue                                    
10-20-08 00:56  KHAksnes       Status                   new => assigned     
10-20-08 00:56  KHAksnes       Assigned To               => buildroot       
10-20-08 01:59  bernhardf      Note Added: 0013884                          
======================================================================
