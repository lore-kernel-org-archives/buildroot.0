From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 06:48:58 -0700
Subject: [Buildroot] [buildroot 0001503]: lighttpd with wrong download
	version
Message-ID: <f25bd20ed7c9ff366027c5eb35023ce5@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1503 
====================================================================== 
Reported By:                MikeGerth
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1503
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-19-2007 06:48 PDT
Last Modified:              09-19-2007 06:48 PDT
====================================================================== 
Summary:                    lighttpd with wrong download version
Description: 
package/lighttpd/lighttpd.mk has wrong LIGHTTPD_VERSION
is 1.4.16
must be 1.4.18

1.4.16 is not availlable there
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-19-07 06:48  MikeGerth      New Issue                                    
09-19-07 06:48  MikeGerth      Status                   new => assigned     
09-19-07 06:48  MikeGerth      Assigned To               => buildroot       
======================================================================
