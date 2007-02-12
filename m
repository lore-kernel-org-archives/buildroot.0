From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:55 -0800
Subject: [Buildroot] [buildroot 0001002]: Wrong BINUTILS_SITE for
	binutils-2.17
Message-ID: <b8599b492f1deb37849c4a5f9c32a3c1@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1002 
====================================================================== 
Reported By:                bdelagoutte
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1002
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-18-2006 02:52 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    Wrong BINUTILS_SITE for binutils-2.17
Description: 
Binutils-2.17 isn't available on kernel.org, causing error when trying to
fetch tarball. Therefore we have to tell wget to download it from GNU.

Also removed trailing slashes in binutils.mk.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-23-06 20:40  
---------------------------------------------------------------------- 
merged, cheers 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-18-06 02:52  bdelagoutte    New Issue                                    
08-18-06 02:52  bdelagoutte    Status                   new => assigned     
08-18-06 02:52  bdelagoutte    Assigned To               => uClibc          
08-18-06 02:52  bdelagoutte    File Added: binutils.mk-binutils-2.17.patch      
             
08-21-06 02:10  bdelagoutte    Issue Monitored: bdelagoutte                    
08-23-06 20:40  vapier         Note Added: 0001583                          
08-23-06 20:40  vapier         Status                   assigned => closed  
08-23-06 20:40  vapier         Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
