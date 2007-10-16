From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 16 Oct 2007 14:20:24 -0700
Subject: [Buildroot] [buildroot 0001533]: lockfile-progs 0.1.10 breaks in
	compilation - PATCH
Message-ID: <ee0cf29f38637b66c62cf5a77c4842f3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1533 
====================================================================== 
Reported By:                sushisan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1533
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-16-2007 14:20 PDT
Last Modified:              10-16-2007 14:20 PDT
====================================================================== 
Summary:                    lockfile-progs 0.1.10 breaks in compilation - PATCH
Description: 
lockfile-progs 0.1.10 breaks with this error:

undefined reference to `*rindex*'

This patch update the package to 0.1.11 and add a patch to solve this. 
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 14:20  sushisan       New Issue                                    
10-16-07 14:20  sushisan       Status                   new => assigned     
10-16-07 14:20  sushisan       Assigned To               => buildroot       
10-16-07 14:20  sushisan       File Added: br2-lockfile-progs.patch             
      
======================================================================
