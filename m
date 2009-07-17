From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Jul 2009 00:19:31 +0200
Subject: [Buildroot] 64bit build error Mesa
In-Reply-To: <56852.172.16.221.250.1247695631.squirrel@cvs.xtale.biz>
	(nfrench@xtale.biz's message of "Wed\,
	15 Jul 2009 22\:07\:11 -0000 \(Europe\/London\)")
References: <56852.172.16.221.250.1247695631.squirrel@cvs.xtale.biz>
Message-ID: <87bpnjhs0c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nfrench" == nfrench  <nfrench@xtale.biz> writes:

 nfrench> Have a 64 bit build system and have now added XORG but get the following
 nfrench> /bin/sh: makedepend: command not found
 nfrench> make[4]: *** No rule to make target `depend', needed by `default'.  Stop.
 nfrench> make[4]: Leaving directory `/mnt/wd/buildroot-2009.05/build_x86_64/Mesa-7.2/src
 nfrench> /glx/x11'

 nfrench> any pointers please.

Could you try updating your git tree (you'll need d0f902e82) and try
again without having makedepend installed on the host?

-- 
Bye, Peter Korsgaard
