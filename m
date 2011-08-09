From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Aug 2011 21:25:02 +0200
Subject: [Buildroot] linphone package
In-Reply-To: <201108092056.40244.yann.morin.1998@anciens.enib.fr> (Yann
 E. MORIN's message of "Tue, 9 Aug 2011 20:56:40 +0200")
References: <4E413EB9.6040504@fosstel.com> <4E417DC0.3060406@fosstel.com>
 <87vcu6ig4c.fsf@macbook.be.48ers.dk>
 <201108092056.40244.yann.morin.1998@anciens.enib.fr>
Message-ID: <87r54uie0h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Peter, Pedro,
 Yann> On Tuesday 09 August 2011 20:39:31 Peter Korsgaard wrote:
 >> >>>>> "Pedro" == Pedro Sanchez <psanchez@fosstel.com> writes:
 Pedro> I am cross-compiling linphone for ARM and the final executable
 Pedro> created by buildroot in my target directory is
 Pedro> /usr/bin/arm-linux-linphonec. No other binaries in the build
 Pedro> have this "arm-linux' prefix. I's like the binary to be named
 Pedro> /usr/bin/linphonec instead? Any suggestions?
 >> 
 >> Typically you can pass --program-prefix="" to configure to disable it.

 Yann> Maybe it would make sense to add this to the auto-target infrastructure?
 Yann> Either it is unconditionally added, or the package can set a variable to
 Yann> use it, eg. PKG_CONF_PROG_PREFIX = YES

Unconditional should be ok, similar to how we do the ipv6 / nls stuff.

 Yann> I'll take a shot at it.

Thanks!

-- 
Bye, Peter Korsgaard
