From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:41 -0800
Subject: [Buildroot] [buildroot 0001162]: libglib12 not built as shared
	library
Message-ID: <79a7433cdc1167e11e6ed967ea78eb3b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1162 
====================================================================== 
Reported By:                Doc SoLo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1162
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-14-2007 15:10 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    libglib12 not built as shared library
Description: 
Revision 17287 by andersen introduced some errors for me.

libglib12 is only built as a static library for some reason. I switched
back to libglib12.mk before 17287 and it is build shared as intended.

I fixed a few other minor glitches, see the patch below. This is just what
I use from buildroot, so it's probably not complete. 
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 09:29  
---------------------------------------------------------------------- 
libmagic should really live in /usr/lib, can you fix this, please?
Also, can you provide a patch to enable libglib to be built as a .so?

I think that the sed errors were already fixed.

TIA, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-14-07 15:10  Doc SoLo       New Issue                                    
01-14-07 15:10  Doc SoLo       Status                   new => assigned     
01-14-07 15:10  Doc SoLo       Assigned To               => uClibc          
01-14-07 15:10  Doc SoLo       File Added: 17287_small_fixes.patch              
     
01-14-07 15:12  Doc SoLo       Issue Monitored: Doc SoLo                    
01-21-07 09:29  bernhardf      Note Added: 0002025                          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
