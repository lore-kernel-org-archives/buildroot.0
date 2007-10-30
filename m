From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 30 Oct 2007 09:30:53 -0700
Subject: [Buildroot] [buildroot 0001564]: Don't build toolchain in build
	20330
Message-ID: <6ef746057e54ebb24c505ada8d315be7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1564 
====================================================================== 
Reported By:                sushisan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1564
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-30-2007 09:30 PDT
Last Modified:              10-30-2007 09:30 PDT
====================================================================== 
Summary:                    Don't build toolchain in build 20330
Description: 
After a make menuconfig a simple make try to compile the selected packages
BUT the toolchains are not compile!! (Don't start compiling gcc neither
others tools)
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-30-07 09:30  sushisan       New Issue                                    
10-30-07 09:30  sushisan       Status                   new => assigned     
10-30-07 09:30  sushisan       Assigned To               => buildroot       
======================================================================
