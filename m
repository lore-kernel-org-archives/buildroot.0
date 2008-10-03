From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 3 Oct 2008 09:40:57 -0700
Subject: [Buildroot] [buildroot 0005234]: Selecting MTD utils from git
	doesn't give you the HEAD
Message-ID: <31eb737dfb7873e86651b0e6187c1a96@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5234 
====================================================================== 
Reported By:                mjd
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5234
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-03-2008 09:40 PDT
Last Modified:              10-03-2008 09:40 PDT
====================================================================== 
Summary:                    Selecting MTD utils from git doesn't give you the
HEAD
Description: 
If you turn on BR2_PACKAGE_MTD_UTILS_GIT, you can get the mtd-utils
source code from the Linux MTD project's GIT server, rather than use
source that is 1 or 2 years old.

I would have thought that the whole point of this is so that you can
get the latest-and-greatest mtd-utils source.  But
package/mtd/mtd-utils.git/mtd.mk hard-codes a particular (now
out-of-date)
version of mtd-utils.

This patch ensures that getting mtd-utils source from git gets the head
from Linux MTD.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-03-08 09:40  mjd            New Issue                                    
10-03-08 09:40  mjd            Status                   new => assigned     
10-03-08 09:40  mjd            Assigned To               => buildroot       
10-03-08 09:40  mjd            File Added: mtd-utils-git-from-head-1.diff       
            
======================================================================
