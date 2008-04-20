From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 20 Apr 2008 02:06:57 -0700
Subject: [Buildroot] [buildroot 0002964]: package libosip2,
	source and build fails
Message-ID: <935dfb036e0a12f272915d04285c961d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2964 
====================================================================== 
Reported By:                Jean-Baptiste Maillet
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2964
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-20-2008 02:06 PDT
Last Modified:              04-20-2008 02:06 PDT
====================================================================== 
Summary:                    package libosip2, source and build fails
Description: 
make libosip2
wget --passive-ftp -nd  -P /var/p2p/jbm/sandbox/buildroot/../download
http://www.antisip.com/download//libosip2-3.0.1.tar.gz
--2008-04-20 11:00:08-- 
http://www.antisip.com/download//libosip2-3.0.1.tar.gz
Resolving www.antisip.com... 91.121.81.212
Connecting to www.antisip.com|91.121.81.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2008-04-20 11:00:08 ERROR 404: Not Found.

make: ***
[/var/p2p/jbm/sandbox/buildroot/../download/libosip2-3.0.1.tar.gz] Error
1


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-20-08 02:06  Jean-Baptiste MailletNew Issue                                  
 
04-20-08 02:06  Jean-Baptiste MailletStatus                   new => assigned   
 
04-20-08 02:06  Jean-Baptiste MailletAssigned To               => buildroot     
 
04-20-08 02:06  Jean-Baptiste MailletFile Added: libosip2.patch                 
  
======================================================================
