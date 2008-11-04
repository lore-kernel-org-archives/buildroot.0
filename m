From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 4 Nov 2008 15:28:38 -0800
Subject: [Buildroot] [buildroot 0005984]: make menuconfig pollute the stderr
Message-ID: <81acb1f23e3ad8a5612effb90c31cc67@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5984 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5984
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-04-2008 15:28 PST
Last Modified:              11-04-2008 15:28 PST
====================================================================== 
Summary:                    make menuconfig pollute the stderr
Description: 
roberto at rafbook:~/gles/buildroot$ make menuconfig
Usage: grep [OPTION]... PATTERN [FILE]...
Try `grep --help' for more information.
dirname: missing operand
Try `dirname --help' for more information.
dirname: missing operand
Try `dirname --help' for more information.
make: *** [menuconfig] Interrupt

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-04-08 15:28  robang74       New Issue                                    
11-04-08 15:28  robang74       Status                   new => assigned     
11-04-08 15:28  robang74       Assigned To               => buildroot       
11-04-08 15:28  robang74       File Added: Makefile.patch                    
======================================================================
