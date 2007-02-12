From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:16 -0800
Subject: [Buildroot] [buildroot 0000641]: Link outdated: SGI xfsprogs
Message-ID: <6e9ac5cbe8c797f71a77c2647efcaf3e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=641 
====================================================================== 
Reported By:                jamesie
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   641
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-13-2006 09:28 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    Link outdated: SGI xfsprogs
Description: 
SGI released a new version of their xfsprogs recently. They also removed
the old tarball. Because of that it is necessary to include the new URL

ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs-2.7.10.src.tar.gz

in the scripts and check for changes.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-13-06 09:28  jamesie        New Issue                                    
01-13-06 09:28  jamesie        Status                   new => assigned     
01-13-06 09:28  jamesie        Assigned To               => uClibc          
02-10-06 12:31  prpplague      Additional Information Updated                   

02-10-06 12:31  prpplague      Status                   assigned => resolved
02-10-06 12:31  prpplague      Resolution               open => fixed       
03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
