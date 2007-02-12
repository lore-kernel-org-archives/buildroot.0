From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:41 -0800
Subject: [Buildroot] [buildroot 0000481]: cross compiling openntpd fails due
	to strip on install
Message-ID: <5723f919a4dc087181e3c28648d6be73@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=481 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   481
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-11-2005 09:21 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    cross compiling openntpd fails due to strip on
install
Description: 
The install phase of openntpd is failing as it is trying to
use the host architecture's strip during the install.

Attached is a patch to use the $(STRIP) specified stripper.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-11-05 09:21  bjdooks        New Issue                                    
10-11-05 09:21  bjdooks        Status                   new => assigned     
10-11-05 09:21  bjdooks        Assigned To               => uClibc          
10-11-05 09:21  bjdooks        File Added: openntd-strip-bug                    
01-24-06 13:13  prpplague      Status                   assigned => resolved
01-24-06 13:13  prpplague      Resolution               open => fixed       
01-24-06 13:13  prpplague      Additional Information Updated                   

03-08-06 16:53  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
