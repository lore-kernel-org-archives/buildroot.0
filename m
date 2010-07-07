From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jul 2010 07:52:33 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <4C33AB4E.9050604@gmx.net> (Ossy's message of "Wed, 07 Jul 2010
	00:16:46 +0200")
References: <4C33AB4E.9050604@gmx.net>
Message-ID: <87pqyz6dpa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ossy" == Ossy  <ossy1980@gmx.net> writes:

 Ossy> Hi buildroot mailinglist,
 Ossy> After successfully compiling a whole rootfs and mounting it via loop
 Ossy> on some nfs export I started my arm ebedded device and ran into tho
 Ossy> following error after booting the image via tftp.

 Ossy> "init: I won't write compressed data to a terminal."

What .config are you using? That string doesn't exist in the busybox
init (or anywhere in busybox).

-- 
Bye, Peter Korsgaard
