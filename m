From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Apr 2012 08:53:28 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-04-07
In-Reply-To: <87lim6u2an.fsf@macbook.be.48ers.dk>
References: <20120408063022.2FA8252CA55@lolut.humanoidz.org>
 <87lim6u2an.fsf@macbook.be.48ers.dk>
Message-ID: <20120410085328.21507bc2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 08 Apr 2012 09:10:24 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> What toolchain is this? Gustavoz added uClibc patches for unshare
> support, so if this is uClibc you'll need to rebuild the toolchain.

Well, according to the defconfig, the toolchain is:

BR2_TOOLCHAIN_CTNG=y
BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE=y
BR2_TOOLCHAIN_CTNG_uClibc_INET_IPV6=y
BR2_TOOLCHAIN_CTNG_uClibc_INET_RPC=y
BR2_TOOLCHAIN_CTNG_uClibc_LOCALE=y
BR2_TOOLCHAIN_CTNG_CXX=y

So it's a toolchain generated with our crosstool-NG backend, which
apparently does not use the uClibc patches we have added for the
internal backend.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
