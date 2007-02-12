From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:39 -0800
Subject: [Buildroot] [buildroot 0000264]: utmpx.h - header missing in
	staging_dir/include/
Message-ID: <637626a2344fcedc436f6ecb63d3575b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=264 
====================================================================== 
Reported By:                bruma
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   264
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-19-2005 15:12 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    utmpx.h - header missing in staging_dir/include/
Description: 
I try to compile lcdproc with i386-linux-uclibc-gcc toolchain.
http://lcdproc.omnipotent.net/download/lcdproc-0.4.5.tar.gz

Steps
1. tar xjvf lcdproc-0.4.5.tar.gz
2. cd lcdproc-0.4.5
3. ./configure --enable-drivers=hd44780
4. make CC=i386-linux-uclibc-gcc

and I got error:
chrono.c:30:19: utmpx.h: No such file or directory

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 05-19-05 15:19  
---------------------------------------------------------------------- 
uclibc doesnt support utmpx.h at the moment 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-19-05 15:12  bruma          New Issue                                    
05-19-05 15:19  vapier         Status                   assigned => resolved
05-19-05 15:19  vapier         Resolution               open => no change
required
05-19-05 15:19  vapier         Note Added: 0000207                          
08-02-05 20:15  andersen       Status                   resolved => closed  
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
