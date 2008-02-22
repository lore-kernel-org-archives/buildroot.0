From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 22 Feb 2008 04:37:37 -0800
Subject: [Buildroot] [buildroot 0002294]: Using Snapshot (21/02/08) of
	buildroot,
	con't compile uclibc 's stdlic.c 'strtol_l' was here error
Message-ID: <052c470505325cfc53534d37179c02df@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2294 
====================================================================== 
Reported By:                kickinz1
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2294
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-22-2008 04:37 PST
Last Modified:              02-22-2008 04:37 PST
====================================================================== 
Summary:                    Using Snapshot (21/02/08) of buildroot, con't
compile uclibc 's stdlic.c 'strtol_l' was here error
Description: 
Hi, 

First use of buildroot, I've read the doc, searched into mailing list
(buildroot and uclibc). I've tried with gcc-4.2.x gcc-4.1, gcc-3.4.6

can't achieve compiling uclibc:

  CC libc/stdlib/strtol_l.os
In file included from ../../libc/stdlib/strtol_l.c:8:
../../libc/stdlib/stdlib.c:346: error: conflicting types for 'strtoll_l'
../../include/stdlib.h:266: error: previous declaration of 'strtoll_l' was
here
../../libc/stdlib/stdlib.c:347: error: conflicting types for 'strtoll_l'
../../include/stdlib.h:266: error: previous declaration of 'strtoll_l' was
here
../../libc/stdlib/stdlib.c:348: error: conflicting types for 'strtoll_l'
../../include/stdlib.h:266: error: previous declaration of 'strtoll_l' was
here
make: *** [../../libc/stdlib/strtol_l.os
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-22-08 04:37  kickinz1       New Issue                                    
02-22-08 04:37  kickinz1       Status                   new => assigned     
02-22-08 04:37  kickinz1       Assigned To               => buildroot       
======================================================================
