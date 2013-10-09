From: Jason Kridner <jkridner@beagleboard.org>
Date: Wed, 9 Oct 2013 14:18:14 -0400
Subject: [Buildroot] Site down or just me?
Message-ID: <CA+T6QPmaqHaWru-3BtqCEQ5fmn-dXxV0w_6x_ZLx23BzEgWsKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The below from two different machines makes it looks like the site is
down. Didn't see any info on the list so far. Any ETA on it coming
back up?

ubuntu at ip-10-115-119-199:/mnt/build/buildroot$ make
>>> uclibc 0.9.33.2 Downloading
--2013-10-09 18:14:55--  http://www.uclibc.org/downloads/uClibc-0.9.33.2.tar.xz
Resolving www.uclibc.org (www.uclibc.org)... 140.211.167.224
Connecting to www.uclibc.org (www.uclibc.org)|140.211.167.224|:80...
failed: Connection refused.
--2013-10-09 18:14:56--  http://sources.buildroot.net//uClibc-0.9.33.2.tar.xz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net
(sources.buildroot.net)|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-10-09 18:14:56 ERROR 404: Not Found.

make: *** [/mnt/build/buildroot/output/build/uclibc-0.9.33.2/.stamp_downloaded]
Error 1


(chroot) test at domU-12-31-38-01-BD-05 ~/validation-scripts/ec2-build $
wget http://buildroot.uclibc.org/
--2013-10-09 18:16:52--  http://buildroot.uclibc.org/
Resolving buildroot.uclibc.org... 140.211.167.224
Connecting to buildroot.uclibc.org|140.211.167.224|:80... failed:
Connection refused.
