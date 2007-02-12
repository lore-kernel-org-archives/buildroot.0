From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:06 -0800
Subject: [Buildroot] [buildroot 0000451]: OpenSSL 0.9.7e
Message-ID: <83f36e31f6ad22850015b595f64902f1@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=451 
====================================================================== 
Reported By:                gnat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   451
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-29-2005 15:45 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    OpenSSL 0.9.7e
Description: 
Configure fails when $(ARCH) == i686. Apparently there is no linux-i686
target for OpenSSL.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-29-05 16:06  
---------------------------------------------------------------------- 
dupe of bug 450 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-29-05 15:45  gnat           New Issue                                    
09-29-05 15:45  gnat           Status                   new => assigned     
09-29-05 15:45  gnat           Assigned To               => uClibc          
09-29-05 16:06  vapier         Note Added: 0000589                          
09-29-05 16:06  vapier         Status                   assigned => closed  
09-29-05 16:06  vapier         Resolution               open => duplicate   
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
