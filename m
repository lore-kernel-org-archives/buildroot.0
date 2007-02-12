From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:26 -0800
Subject: [Buildroot] [buildroot 0000482]: socat tries to install into / on
	the build machine
Message-ID: <30565acabdd19a49735fce6d2a3786a8@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=482 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   482
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-11-2005 10:59 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    socat tries to install into / on the build machine
Description: 
The install tries to install socat into /usr/bin instead of
/usr/bin in the $TARGET_DIR

It seems that socat-1.4 needs DESTDIR= passing to the install
part of the makefile to move where it installs to
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-11-05 10:59  bjdooks        New Issue                                    
10-11-05 10:59  bjdooks        Status                   new => assigned     
10-11-05 10:59  bjdooks        Assigned To               => uClibc          
10-11-05 10:59  bjdooks        File Added: socat-fix-install.patch              
     
01-24-06 07:15  prpplague      Status                   assigned => resolved
01-24-06 07:15  prpplague      Resolution               open => fixed       
01-24-06 07:15  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
