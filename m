From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 20:35:25 +0200
Subject: [Buildroot] Site down or just me?
In-Reply-To: <CA+T6QPmaqHaWru-3BtqCEQ5fmn-dXxV0w_6x_ZLx23BzEgWsKA@mail.gmail.com>
 (Jason Kridner's message of "Wed, 9 Oct 2013 14:18:14 -0400")
References: <CA+T6QPmaqHaWru-3BtqCEQ5fmn-dXxV0w_6x_ZLx23BzEgWsKA@mail.gmail.com>
Message-ID: <87siwa1edu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Jason Kridner <jkridner@beagleboard.org> writes:

 Jason> The below from two different machines makes it looks like the site is
 Jason> down. Didn't see any info on the list so far. Any ETA on it coming
 Jason> back up?

Yes, apache apparently died and I don't have sudo :/ I will try to get
hold of somebody who does..

 Jason> ubuntu at ip-10-115-119-199:/mnt/build/buildroot$ make
 >>>> uclibc 0.9.33.2 Downloading
 Jason> --2013-10-09 18:14:55--  http://www.uclibc.org/downloads/uClibc-0.9.33.2.tar.xz
 Jason> Resolving www.uclibc.org (www.uclibc.org)... 140.211.167.224
 Jason> Connecting to www.uclibc.org (www.uclibc.org)|140.211.167.224|:80...
 Jason> failed: Connection refused.
 Jason> --2013-10-09 18:14:56--  http://sources.buildroot.net//uClibc-0.9.33.2.tar.xz

 Jason> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
 Jason> Connecting to sources.buildroot.net
 Jason> (sources.buildroot.net)|176.9.16.109|:80... connected.
 Jason> HTTP request sent, awaiting response... 404 Not Found
 Jason> 2013-10-09 18:14:56 ERROR 404: Not Found.

But that I can fix - Done.

 Jason> (chroot) test at domU-12-31-38-01-BD-05 ~/validation-scripts/ec2-build $
 Jason> wget http://buildroot.uclibc.org/
 Jason> --2013-10-09 18:16:52--  http://buildroot.uclibc.org/
 Jason> Resolving buildroot.uclibc.org... 140.211.167.224
 Jason> Connecting to buildroot.uclibc.org|140.211.167.224|:80... failed:
 Jason> Connection refused.

Yes, buildroot.uclibc.org / busybox.net / uclibc.org is the same
machine.

-- 
Bye, Peter Korsgaard
