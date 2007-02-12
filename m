From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:33 -0800
Subject: [Buildroot] [buildroot 0000533]: Forgotten changes from
	BR2_PACKAGE_DROPBEAR_SSHD to BR2_PACKAGE_DROPBEAR
Message-ID: <e66a472e8c3b3a63a780492f6a23eb87@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=533 
====================================================================== 
Reported By:                vlad
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   533
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-05-2005 09:47 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Forgotten changes from BR2_PACKAGE_DROPBEAR_SSHD to
BR2_PACKAGE_DROPBEAR
Description: 
buildroot-orig/package/dropbear/dropbear.mk:
--- buildroot-orig/package/dropbear/dropbear.mk.orig    2005-11-05
19:39:38.862322520 +0200
+++ buildroot-orig/package/dropbear/dropbear.mk 2005-11-05
19:39:51.869345152 +0200
@@ -88,6 +88,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_DROPBEAR_SSHD)),y)
+ifeq ($(strip $(BR2_PACKAGE_DROPBEAR)),y)
 TARGETS+=dropbear
 endif

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-05-05 12:56  
---------------------------------------------------------------------- 
thanks, fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-05-05 09:47  vlad           New Issue                                    
11-05-05 09:47  vlad           Status                   new => assigned     
11-05-05 09:47  vlad           Assigned To               => uClibc          
11-05-05 12:56  vapier         Note Added: 0000667                          
12-29-05 03:30  vapier         Status                   assigned => closed  
12-29-05 03:30  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
