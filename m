From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 28 Jun 2007 12:55:42 -0700
Subject: [Buildroot] [buildroot 0001408]: Fail to build glib 2.12.9 (No
	iconv() implementation found in C library or libiconv)
Message-ID: <bbc9ff2920e0ac66179a91d9f50307f2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1408 
====================================================================== 
Reported By:                pavko
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1408
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-28-2007 12:55 PDT
Last Modified:              06-28-2007 12:55 PDT
====================================================================== 
Summary:                    Fail to build glib 2.12.9 (No iconv() implementation
found in C library or libiconv)
Description: 
uClibc has been build with locale suport, gcc 4.2.0, arch i686
also tried to compile newest 2.12.12 glib but without success
(error dump is for 2.12.12 but 2.12.9 is behaving exactly the same)
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-28-07 12:55  pavko          New Issue                                    
06-28-07 12:55  pavko          Status                   new => assigned     
06-28-07 12:55  pavko          Assigned To               => buildroot       
======================================================================
