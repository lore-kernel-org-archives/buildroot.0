From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 10 Nov 2008 09:48:28 -0800
Subject: [Buildroot] [buildroot 0006104]: midori libtool patch fails to apply
Message-ID: <b004640077fb58ca7ca36d5b085a6576@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Last Modified:              11-10-2008 09:48 PST
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-10-08 09:48  robang74       New Issue                                    
11-10-08 09:48  robang74       Status                   new => assigned     
11-10-08 09:48  robang74       Assigned To               => buildroot       
======================================================================
