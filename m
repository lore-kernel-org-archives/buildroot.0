From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:04 -0800
Subject: [Buildroot] [buildroot 0000236]: uClibc not being built with LFS
Message-ID: <82c0ded11fd08b0067faa54921ca6035@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=236 
====================================================================== 
Reported By:                cac
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   236
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-25-2005 12:10 PDT
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    uClibc not being built with LFS
Description: 
In my buildroot config, BR2_LARGEFILE=y, but in the built system,
sizeof(off_t) is 4.

Target is i386, Pentium III

buildroot committed-date="2004-10-09T01:06:03.000000Z"


====================================================================== 

---------------------------------------------------------------------- 
 cac - 04-26-05 12:58  
---------------------------------------------------------------------- 
Apparently a bit of confusion on my part. Delete this puppy. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-25-05 12:10  cac            New Issue                                    
04-26-05 12:58  cac            Note Added: 0000195                          
05-16-05 10:24  andersen       Status                   assigned => closed  
05-16-05 10:24  andersen       Resolution               open => no change
required
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
