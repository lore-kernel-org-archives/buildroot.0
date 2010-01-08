From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jan 2010 08:57:16 +0100
Subject: [Buildroot] MTD build failing: undefined ref's  to bcopy, bcmp
In-Reply-To: <hi5na6$ngt$2@ger.gmane.org>
References: <hi377d$1i5$1@ger.gmane.org> <hi5437$id4$1@ger.gmane.org>
	<20100107183709.74ba1341@surf> <hi57as$vp6$1@ger.gmane.org>
	<hi5na6$ngt$2@ger.gmane.org>
Message-ID: <20100108085716.088d1140@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 7 Jan 2010 22:30:30 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> The problem is that buildroot expects to find libgcc,
> libstdc++, et al in $(SYSROOT)/lib

Yes. I have a fix in one of my branches that fixes this. But it's part
of a set of fixes designed to get Codesourcery toolchains to work in
Buildroot, which doesn't work yet (see my mail on this topic a few days
ago).

See
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=toolchain-fixes&id=27bd3ec803202f52c336254b276cbab3c6999a35

(but it's not ready for inclusion yet)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
