From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 21 Jan 2008 01:04:34 -0800
Subject: [Buildroot] [buildroot 0001954]: fakeroot 1.8.10 no longer
	available form debain ftp
Message-ID: <9bd22e781212d79e9fdd78b8dd27cb9d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1954 
====================================================================== 
Reported By:                sharkconi
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1954
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-21-2008 01:04 PST
Last Modified:              01-21-2008 01:04 PST
====================================================================== 
Summary:                    fakeroot 1.8.10 no longer available form debain ftp
Description: 
Today, when I try to build another toolchain using buildroot, it reports:"
wget --passive-ftp  -P /home/sharkconi/project/buildroot/dl
"http://ftp.debian.org"/debian/pool/main/f/fakeroot/fakeroot_1.8.10.tar.gz
--16:37:49-- 
http://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.8.10.tar.gz
           =>
`/home/sharkconi/project/buildroot/dl/fakeroot_1.8.10.tar.gz'
Connecting to ftp.debian.org|128.101.240.212|:80...
connected&http://busybox.net/bugs/view.php?id=12290;
Please wait... 404 Not Found
16:37:50 error 404&http://busybox.net/bugs/view.php?id=65306;Not
Found&http://busybox.net/bugs/view.php?id=12290;

make: *** [/home/sharkconi/project/buildroot/dl/fakeroot_1.8.10.tar.gz]
error 1

I go to the ftp site to check what's going on.
Then I found that Debian has remove all of the 1.8.x version's fakeroot.
So can anyone help me?

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-21-08 01:04  sharkconi      New Issue                                    
01-21-08 01:04  sharkconi      Status                   new => assigned     
01-21-08 01:04  sharkconi      Assigned To               => buildroot       
======================================================================
