From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:42 -0800
Subject: [Buildroot] [buildroot 0000234]: mksquashfs always rebuilt before
	generating rfs image
Message-ID: <5fed28e149ff0dc55b020d70688ac2e5@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=234 
====================================================================== 
Reported By:                samrobb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   234
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-22-2005 19:54 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    mksquashfs always rebuilt before generating rfs
image
Description: 
The attached patch avoids this issue, by creating a .unpacked file in the
squashfs directory after the source tarball is unpacked, and making the
mksquashfs target depend on the .unpacked file.
====================================================================== 

---------------------------------------------------------------------- 
 samrobb - 04-22-05 19:57  
---------------------------------------------------------------------- 
Sorry - this isn't (and shouldn't be marked as) arch-specific. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-22-05 19:54  samrobb        New Issue                                    
04-22-05 19:54  samrobb        File Added: squashfs-unpack.patch                
   
04-22-05 19:57  samrobb        Note Added: 0000184                          
06-23-05 21:22  andersen       Status                   assigned => closed  
06-23-05 21:22  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
