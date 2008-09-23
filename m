From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 23 Sep 2008 03:36:17 -0700
Subject: [Buildroot] [buildroot 0005114]: Version of asterisk in package
	(1.6) does not compile out of the box
Message-ID: <2dd7c85a2f24af0c66ce08ce0088ec7b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5114 
====================================================================== 
Reported By:                nickpeirson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5114
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-23-2008 03:36 PDT
Last Modified:              09-23-2008 03:36 PDT
====================================================================== 
Summary:                    Version of asterisk in package (1.6) does not
compile out of the box
Description: 
The asterisk package within buildroot tries to compile asterisk 1.6-beta6
since revision 21494
(http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/package/asterisk/asterisk.mk?rev=21494&view=diff&r1=21494&r2=21493&p1=trunk/buildroot/package/asterisk/asterisk.mk&p2=/trunk/buildroot/package/asterisk/asterisk.mk),
however the build proccess hasn't been updated along side it. The asterisk
project has major changes between 1.2, 1.4 and 1.6, including the way it
compiles.

As the package hasn't been updated to take this into account, the package
no longer compiles out of the box. Would it be possible to look at making
this package work again? Either with the current stable release, 1.4, or
the 1.6 branch (currently on -rc6) which is about to be released? I'm
happy to provide any help I can with this.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-23-08 03:36  nickpeirson    New Issue                                    
09-23-08 03:36  nickpeirson    Status                   new => assigned     
09-23-08 03:36  nickpeirson    Assigned To               => buildroot       
======================================================================
