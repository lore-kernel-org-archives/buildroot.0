From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Mar 2012 21:33:37 +0100
Subject: [Buildroot] add option to enable AI_ADDRCONFIG support
In-Reply-To: <87wr6q26x5.fsf@macbook.be.48ers.dk>
References: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
 <20120308091714.5d60b715@skate>
 <87wr6q26x5.fsf@macbook.be.48ers.dk>
Message-ID: <20120315213337.448d1bfd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 11 Mar 2012 21:56:22 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> I believe it's a fairly small impact, but the problem is external uClibc
> toolchains (made by BR, ct-NG or elsewhere) which most likely won't have
> AI_ADDRCONFIG enabled, so mrouted (and gupnp) will fail at build time.

Is it common to have AI_ADDRCONFIG disabled in external toolchains?
Notice that we have a similar problem with ltp-testsuite at the moment.

Do we really want to add one more toolchain option just for this small
feature? Sounds like a big hammer, no?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
