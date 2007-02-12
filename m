From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:57 -0800
Subject: [Buildroot] [buildroot 0000593]: No TARGET_CXX for packages which
	need a c++ compiler
Message-ID: <49bd8a4166890748cc92b311b321a5c6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=593 
====================================================================== 
Reported By:                mjc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   593
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-09-2005 20:12 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    No TARGET_CXX for packages which need a c++ compiler
Description: 
If a package has c++ files to compile, there is no TARGET_CXX. I'm
appending a patch.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-09-05 20:12  mjc            New Issue                                    
12-09-05 20:12  mjc            Status                   new => assigned     
12-09-05 20:12  mjc            Assigned To               => uClibc          
12-09-05 20:12  mjc            File Added: cxx.patch                        
01-25-06 09:28  prpplague      Status                   assigned => resolved
01-25-06 09:28  prpplague      Resolution               open => fixed       
01-25-06 09:28  prpplague      Additional Information Updated                   

03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
