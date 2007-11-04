From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 4 Nov 2007 03:21:50 -0800
Subject: [Buildroot] [buildroot 0001572]: libmad $(MAKE) should be run with
	full configure environment
Message-ID: <037d4091f0e3fab2322f31523a0581af@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1572 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1572
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-04-2007 03:21 PST
Last Modified:              11-04-2007 03:21 PST
====================================================================== 
Summary:                    libmad $(MAKE) should be run with full configure
environment
Description: 
libmad's Makefile (like any autoconf-based Makefile) may wish to re-run
'configure'. We should provide it with the same environment as we provide
'configure' with.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-04-07 03:21  ikonst         New Issue                                    
11-04-07 03:21  ikonst         Status                   new => assigned     
11-04-07 03:21  ikonst         Assigned To               => buildroot       
11-04-07 03:21  ikonst         File Added: libmad-make-with-target-opts.patch   
                
======================================================================
