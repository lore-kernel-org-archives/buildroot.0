From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:21 -0800
Subject: [Buildroot] [buildroot 0000372]: Xorg fails to compile with
	freetype2 support (patch included)
Message-ID: <2834f73d5d0643936df39767120ddc10@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=372 
====================================================================== 
Reported By:                pnoffke
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   372
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-09-2005 18:08 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Xorg fails to compile with freetype2 support (patch
included)
Description: 
This patch allows Xorg to properly compile with FreeType2 support if
freetype is selected as a package for the target.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-07-05 17:25  
---------------------------------------------------------------------- 
thanks, added to svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-09-05 18:08  pnoffke        New Issue                                    
08-09-05 18:08  pnoffke        Status                   new => assigned     
08-09-05 18:08  pnoffke        Assigned To               => uClibc          
08-09-05 18:08  pnoffke        File Added: br_xorg.patch                    
08-09-05 19:20  pnoffke        Issue Monitored: pnoffke                     
09-07-05 17:25  vapier         Note Added: 0000500                          
09-07-05 17:25  vapier         Status                   assigned => closed  
09-07-05 17:25  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
