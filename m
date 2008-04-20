From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 20 Apr 2008 04:33:00 -0700
Subject: [Buildroot] [buildroot 0002974]: package lighttpd source fails
Message-ID: <fcb4d762c5c3ed510b279c51e922d3d2@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2974 
====================================================================== 
Reported By:                Jean-Baptiste Maillet
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2974
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-20-2008 04:32 PDT
Last Modified:              04-20-2008 04:32 PDT
====================================================================== 
Summary:                    package lighttpd source fails
Description: 
$ make lighttpd
wget --passive-ftp -nd  -P /var/p2p/jbm/sandbox/buildroot/../download
"http://ftp.debian.org"/debian/pool/main/l/lighttpd/lighttpd_1.4.18.orig.tar.gz
--2008-04-20 13:25:21-- 
http://ftp.debian.org/debian/pool/main/l/lighttpd/lighttpd_1.4.18.orig.tar.gz
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2008-04-20 13:25:21 ERROR 404: Not Found.

make: ***
[/var/p2p/jbm/sandbox/buildroot/../download/lighttpd_1.4.18.orig.tar.gz]
Error 1

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-20-08 04:32  Jean-Baptiste MailletNew Issue                                  
 
04-20-08 04:32  Jean-Baptiste MailletStatus                   new => assigned   
 
04-20-08 04:32  Jean-Baptiste MailletAssigned To               => buildroot     
 
04-20-08 04:32  Jean-Baptiste MailletFile Added: lighttpd.patch                 
  
======================================================================
