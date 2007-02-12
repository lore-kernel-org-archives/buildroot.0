From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:38 -0800
Subject: [Buildroot] [buildroot 0000596]: Package m4 fails to build
Message-ID: <fbcba279b9d2444d54fa2fa01f8a5cb8@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=596 
====================================================================== 
Reported By:                crafterm
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   596
Category:                   Other
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-11-2005 13:10 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Package m4 fails to build
Description: 
/home/crafterm/workspace/new/buildroot/build_i386/staging_dir/bin/i386-linux-uclibc-gcc
-c -DHAVE_CONFIG_H -I.. -I. -I./../lib  -Os -pipe  m4.c
In file included from
/home/crafterm/workspace/new/buildroot/build_i386/staging_dir/i386-linux-uclibc/sys-include/signal.h:324,
                 from
/home/crafterm/workspace/new/buildroot/build_i386/staging_dir/i386-linux-uclibc/sys-include/sys/signal.h:1,
                 from m4.c:22:
/home/crafterm/workspace/new/buildroot/build_i386/staging_dir/i386-linux-uclibc/sys-include/bits/sigstack.h:55:
error: two types specified in one empty declaration
make[2]: *** [m4.o] Error 1
make[2]: Leaving directory
`/home/crafterm/workspace/new/buildroot/build_i386/m4-1.4/src'
make[1]: *** [all] Error 1
make[1]: Leaving directory
`/home/crafterm/workspace/new/buildroot/build_i386/m4-1.4'
make: ***
[/home/crafterm/workspace/new/buildroot/build_i386/m4-1.4/src/m4] Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-11-05 13:10  crafterm       New Issue                                    
12-11-05 13:10  crafterm       Status                   new => assigned     
12-11-05 13:10  crafterm       Assigned To               => uClibc          
12-29-05 03:22  vapier         Status                   assigned => closed  
12-29-05 03:22  vapier         Resolution               open => unable to
reproduce
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
