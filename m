From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 18 May 2007 14:53:12 -0700
Subject: [Buildroot] [buildroot 0001356]: Cannot compile busybox under
	buldroot with SPARC target
Message-ID: <8b1aba9f1ab79e3991d96e3bce42fb5a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1356 
====================================================================== 
Reported By:                marvin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1356
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-18-2007 14:53 PDT
Last Modified:              05-18-2007 14:53 PDT
====================================================================== 
Summary:                    Cannot compile busybox under buldroot with SPARC
target
Description: 
If I compile buidroot on i386 with SPARC target I gate this
 LINK    busybox_unstripped
miscutils/lib.a(taskset.o): In function `taskset_main':
taskset.c:(.text.taskset_main+0x128): undefined reference to
`sched_getaffinity'
taskset.c:(.text.taskset_main+0x20c): undefined reference to
`sched_setaffinity'
collect2: ld returned 1 exit status
/home/marvin/tmp/SPARC/buildroot/build_sparc/staging_dir/bin/sparc-linux-uclibc-strip:
'busybox_unstripped': No such file
make[1]: Leaving directory
`/home/marvin/tmp/SPARC/buildroot/build_sparc/busybox'

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-18-07 14:53  marvin         New Issue                                    
05-18-07 14:53  marvin         Status                   new => assigned     
05-18-07 14:53  marvin         Assigned To               => buildroot       
======================================================================
