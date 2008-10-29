From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 29 Oct 2008 13:06:26 -0700
Subject: [Buildroot] [buildroot 0005844]: tslib package: Utilities programs
	cannot handle 24bpp framebuffers
Message-ID: <496364223a254ab9fc6985e661436414@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5844 
====================================================================== 
Reported By:                pma
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5844
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-29-2008 13:06 PDT
Last Modified:              10-29-2008 13:06 PDT
====================================================================== 
Summary:                    tslib package:  Utilities programs cannot handle
24bpp framebuffers
Description: 
The tslib utilities (ts_calibrate, ts_test, etc) do not handle
24bits-per-pixel framebuffers, and thus do not display anything while
running.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-29-08 13:06  pma            New Issue                                    
10-29-08 13:06  pma            Status                   new => assigned     
10-29-08 13:06  pma            Assigned To               => buildroot       
10-29-08 13:06  pma            File Added: tslib_24bpp.patch                    
======================================================================
