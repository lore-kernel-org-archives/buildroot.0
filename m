From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 4 Nov 2007 03:22:32 -0800
Subject: [Buildroot] [buildroot 0001572]: libmad $(MAKE) should be run with
	full configure environment
Message-ID: <fb952e22276217d94f755458188f80c5@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              11-04-2007 03:22 PST
====================================================================== 
Summary:                    libmad $(MAKE) should be run with full configure
environment
Description: 
libmad's Makefile (like any autoconf-based Makefile) may wish to re-run
'configure'. We should provide it with the same environment as we provide
'configure' with.
====================================================================== 

---------------------------------------------------------------------- 
 ikonst - 11-04-07 03:22  
---------------------------------------------------------------------- 
This patch should be applied only after issue 0001560 is reverted. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-04-07 03:21  ikonst         New Issue                                    
11-04-07 03:21  ikonst         Status                   new => assigned     
11-04-07 03:21  ikonst         Assigned To               => buildroot       
11-04-07 03:21  ikonst         File Added: libmad-make-with-target-opts.patch   
                
11-04-07 03:22  ikonst         Note Added: 0002887                          
======================================================================
