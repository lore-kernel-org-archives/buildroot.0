From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 26 Oct 2008 14:49:13 -0700
Subject: [Buildroot] [buildroot 0005744]: fb.modes example copied from
	kernel docs
Message-ID: <e440326ff077c24f32b24844d1d3d7d4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5744 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5744
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-26-2008 03:59 PDT
Last Modified:              10-26-2008 14:49 PDT
====================================================================== 
Summary:                    fb.modes example copied from kernel docs
Description: 
When fbset is compiled and installed in the rootfs an example of
/etc/fb.modes from kernel docs should be installed too (if it does not
exist yet).
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 10-26-08 04:44  
---------------------------------------------------------------------- 
Wouldn't it make more sense to install one of the fb.modes shipped with
fbset instead? (etc/fb.modes.*)

Is the cyberblade stuff representable for other gfx chips? 

---------------------------------------------------------------------- 
 robang74 - 10-26-08 14:49  
---------------------------------------------------------------------- 
I tought one example would be enought and I put in the first I found.
Following patch will put in all I have found. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-26-08 03:59  robang74       New Issue                                    
10-26-08 03:59  robang74       Status                   new => assigned     
10-26-08 03:59  robang74       Assigned To               => buildroot       
10-26-08 03:59  robang74       File Added: fbset.mk.patch                    
10-26-08 04:04  robang74       Issue Monitored: robang74                    
10-26-08 04:44  jacmet         Note Added: 0014254                          
10-26-08 14:49  robang74       Note Added: 0014274                          
======================================================================
