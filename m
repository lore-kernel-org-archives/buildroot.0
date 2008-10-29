From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 28 Oct 2008 19:23:03 -0700
Subject: [Buildroot] [buildroot 0005804]: libpcap-0.9.8 build failure (.rej
	files)
Message-ID: <7b0481cf60a1a149b6d40246d6b9cc2b@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5804 
====================================================================== 
Reported By:                pananix
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5804
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2008 19:23 PDT
Last Modified:              10-28-2008 19:23 PDT
====================================================================== 
Summary:                    libpcap-0.9.8 build failure (.rej files)
Description: 
libpcap in svn has a .patch file inside that patches gencode.c, but is an
old patch (apparently) which creates a gencode.c.rej file.  Once
wlan*.patch is removed and all but good gencode.c removed and
libpcap-0.9.8.tar.gz is repackaged, build continues.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-08 19:23  pananix        New Issue                                    
10-28-08 19:23  pananix        Status                   new => assigned     
10-28-08 19:23  pananix        Assigned To               => buildroot       
======================================================================
