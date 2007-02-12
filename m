From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:14 -0800
Subject: [Buildroot] [buildroot 0000928]: buildroot doesnt download gcc-4.1.1
Message-ID: <185e8cad5450d32e29014e5edf127e60@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=928 
====================================================================== 
Reported By:                drave
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   928
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-29-2006 03:36 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    buildroot  doesnt download gcc-4.1.1
Description: 
buildroot-snapshot.tar.bz2 downloaded on 27/6/2006

wget --passive-ftp -P /home/dave/buildroot/dl
ftp://ftp.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2
--11:26:25-- 
ftp://ftp.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2
           => `/home/dave/buildroot/dl/gcc-4.1.1.tar.bz2'
Resolving ftp.ibiblio.org... 152.2.210.80
Connecting to ftp.ibiblio.org|152.2.210.80|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /pub/mirrors/gnu/ftp/gnu/gcc/gcc-4.1.1 ... 
No such directory `pub/mirrors/gnu/ftp/gnu/gcc/gcc-4.1.1'.

make: *** [/home/dave/buildroot/dl/gcc-4.1.1.tar.bz2] Error 1
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 06-29-06 17:26  
---------------------------------------------------------------------- 
dupe of 913 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-29-06 03:36  drave          New Issue                                    
06-29-06 03:36  drave          Status                   new => assigned     
06-29-06 03:36  drave          Assigned To               => uClibc          
06-29-06 17:26  vapier         Note Added: 0001478                          
06-29-06 17:26  vapier         Status                   assigned => closed  
06-29-06 17:26  vapier         Resolution               open => duplicate   
06-29-06 17:26  vapier         Summary                  buildroot  doesnt =>
buildroot  doesnt download gcc-4.1.1
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
