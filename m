From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 24 Sep 2007 00:53:46 -0700
Subject: [Buildroot] [buildroot 0001258]: Packages with "self-written"
	configure scripts fail with non-Linux hosts
Message-ID: <c98ad37fcb4478e04d590843ecbbd89f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1258 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1258
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             03-04-2007 07:29 PST
Last Modified:              09-24-2007 00:53 PDT
====================================================================== 
Summary:                    Packages with "self-written" configure scripts fail
with non-Linux hosts
Description: 
Non-autoconf packages seem to be unfriendly towards cross-building. Few
examples are zlib and jpeg. On Mac OS X host, they cannot link shared
libraries correctly, because they identify the host system as the target
system and try to pass OS X linker flags to, for example,
i686-linux-uclibc-gcc. Autoconfed packages, such as gmp, seem to work
fine.


====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-24-07 00:53  
---------------------------------------------------------------------- 
Please report this to the affected upstream-packages. Such packages are
supposed to be fixed upstream, we will add new upstream releases that
contain such fixes ASAP (upon notice).

thanks. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-04-07 07:29  holin          New Issue                                    
03-04-07 07:29  holin          Status                   new => assigned     
03-04-07 07:29  holin          Assigned To               => buildroot       
03-31-07 09:42  bendiken       Issue Monitored: bendiken                    
09-24-07 00:53  bernhardf      Status                   assigned => closed  
09-24-07 00:53  bernhardf      Note Added: 0002779                          
======================================================================
