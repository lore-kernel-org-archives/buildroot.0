From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:59 -0800
Subject: [Buildroot] [buildroot 0000519]: gettext: seperate build and target
	files
Message-ID: <5cf70b3acc0eddb248aecb0bcde98a54@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=519 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   519
Category:                   Other
Reproducibility:            N/A
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:49 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    gettext: seperate build and target files
Description: 
Currently it's only possible to install the complete gettext on the target.
 this patch allows that with a new configure option, but it changes the
LIBINTL option to only install that needed at runtime for gettext
programs.  This is probably what most people want, not usually doing
development on a buildroot target.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:49  akvadrako      New Issue                                    
10-28-05 09:49  akvadrako      Status                   new => assigned     
10-28-05 09:49  akvadrako      Assigned To               => uClibc          
10-28-05 09:52  akvadrako      File Added:
br-gettext-seperate-host-and-target.patch                    
10-28-05 23:54  vapier         Summary                  gettext: seperate host
and target installs => gettext: seperate build and target files
01-25-06 09:51  prpplague      Status                   assigned => resolved
01-25-06 09:51  prpplague      Resolution               open => fixed       
01-25-06 09:51  prpplague      Additional Information Updated                   

03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
