From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 11:52:23 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/docker
In-Reply-To: <4873328E.5050001@atmel.com> (Ulf Samuelsson's message of "Tue\,
	08 Jul 2008 11\:25\:34 +0200")
References: <20080708054144.507E03C67C@busybox.net>
	<877ibwvpxk.fsf@macbook.be.48ers.dk> <4873328E.5050001@atmel.com>
Message-ID: <877ibwr9d4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> Is all of this needed? And shouldn't it be PKG_CONFIG_SYSROOT_DIR
 >> instead? We don't use the pkgconfig wrapper anymore.
 >> 
 Ulf> I tried building both ARM and AVR32 and without this,
 Ulf> and both are broken.
 Ulf> docker will use host pkgconfigs instead of target pkgconfigs.

And with PKG_CONFIG_SYSROOT_DIR?

-- 
Bye, Peter Korsgaard
