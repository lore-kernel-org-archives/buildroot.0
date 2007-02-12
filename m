From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:37 -0800
Subject: [Buildroot] [buildroot 0000501]: device-mapper: rm $@ -> rm -r $@
Message-ID: <e31caa409917b6cd242df6bbecd92b6a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=501 
====================================================================== 
Reported By:                deac
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   501
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-24-2005 09:14 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    device-mapper: rm $@ -> rm -r $@
Description: 
line78: rm $@
this is a compile-blocker, if this file doesn't exists, it must be: rm -f
$@
(see also next bug of me)
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-24-05 09:14  deac           New Issue                                    
10-24-05 09:14  deac           Status                   new => assigned     
10-24-05 09:14  deac           Assigned To               => uClibc          
01-24-06 13:09  prpplague      Status                   assigned => resolved
01-24-06 13:09  prpplague      Resolution               open => fixed       
01-24-06 13:09  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
