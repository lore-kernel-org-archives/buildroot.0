From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 27 Dec 2007 00:35:06 -0800
Subject: [Buildroot] [buildroot 0001819]: buildroot 20071226 tries to fetch
	non-existant fakeroot
Message-ID: <e50c5e7384d81283b7d42e51151872bf@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1819 
====================================================================== 
Reported By:                alexking
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1819
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-27-2007 00:35 PST
Last Modified:              12-27-2007 00:35 PST
====================================================================== 
Summary:                    buildroot 20071226 tries to fetch non-existant
fakeroot
Description: 
While trying to build a system with buildroot, it tries to fetch fakeroot
1.8.2, which is not a current version and isn't available in the Debian
mirrors.

1.5.10 is in etch, and 1.8.10 is current in testing/unstable.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-27-07 00:35  alexking       New Issue                                    
12-27-07 00:35  alexking       Status                   new => assigned     
12-27-07 00:35  alexking       Assigned To               => buildroot       
======================================================================
