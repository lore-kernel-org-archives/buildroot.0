From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:07 -0800
Subject: [Buildroot] [buildroot 0000587]: when I compile buildroot with SDL
	enabled I have an error
Message-ID: <e8e0dab36bfcced659b748d3b0a195ed@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=587 
====================================================================== 
Reported By:                invaugen
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   587
Category:                   New Features
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-07-2005 16:36 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    when I compile buildroot with SDL enabled I have an
error
Description: 
I download buildroot from svn. When I try to compile I have an error:
/mnt/encinta/builroot/buildroot/build_i686/staging_dir/bin-ccache/../lib/gcc/i686-linux-uclibc/4.0.2/../../../../i686-linux-uclibc/bin/ld:
cannot find -laudio
collect2: ld returned 1 exit status
make[3]: *** [libSDL.la] Error 1

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-07-05 16:36  invaugen       New Issue                                    
12-07-05 16:36  invaugen       Status                   new => assigned     
12-07-05 16:36  invaugen       Assigned To               => uClibc          
12-07-05 16:36  invaugen       File Added: sdl.txt                          
01-23-06 12:16  prpplague      Status                   assigned => closed  
01-23-06 12:16  prpplague      Resolution               open => unable to
reproduce
01-23-06 12:16  prpplague      Additional Information Updated                   

02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
