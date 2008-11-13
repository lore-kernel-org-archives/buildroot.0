From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 13 Nov 2008 06:34:43 -0800
Subject: [Buildroot] [buildroot 0006104]: midori libtool patch fails to apply
Message-ID: <71a2e7b4f2ac4fe7d789acb065460a49@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6104 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6104
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-10-2008 09:48 PST
Last Modified:              11-13-2008 06:34 PST
====================================================================== 
Summary:                    midori libtool patch fails to apply
Description: 
>>> midori 0.0.18 Extracting
>>> midori 0.0.18 Patching libtool

Applying buildroot-libtool.patch using plaintext: 
patching file ltmain.sh
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 273.
Hunk http://busybox.net/bugs/view.php?id=2 succeeded at 4811 (offset 2403
lines).
Hunk http://busybox.net/bugs/view.php?id=3 FAILED at 4955.
Hunk http://busybox.net/bugs/view.php?id=4 FAILED at 5299.
Hunk http://busybox.net/bugs/view.php?id=5 succeeded at 7415 with fuzz 1 (offset
1792 lines).
Hunk http://busybox.net/bugs/view.php?id=6 FAILED at 7740.
4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool.patch!
make: ***
[/home/roberto/gles/buildroot/build_i586/midori-0.0.18/.stamp_libtool_patch]
Error 1

====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-13-08 06:34  
---------------------------------------------------------------------- 
Please apply this patch, it allows to compile midori into buildroot 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-10-08 09:48  robang74       New Issue                                    
11-10-08 09:48  robang74       Status                   new => assigned     
11-10-08 09:48  robang74       Assigned To               => buildroot       
11-10-08 09:48  robang74       Issue Monitored: robang74                    
11-13-08 06:34  robang74       File Added: buildroot-midori.patch               
    
11-13-08 06:34  robang74       Note Added: 0015754                          
======================================================================
