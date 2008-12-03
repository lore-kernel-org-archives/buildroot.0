From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Dec 2008 16:34:22 +0100
Subject: [Buildroot] start compiling autoconf for the host as well (was:
 svn commit: trunk/buildroot/package/autoconf)
In-Reply-To: <49368D09.6060703@atmel.com>
References: <20081203133645.EBECF3C83E@busybox.net>
	<49368D09.6060703@atmel.com>
Message-ID: <20081203163422.225b9cca@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 03 Dec 2008 14:43:37 +0100,
Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> a ?crit :

> > Fix comment about autoconf configuration/compilation/installation
> > for the target (and not the host).
> > 
> 
> off-topic: perhaps we should consider building autoconf, libtools,
> etc. which now quite heavily depend on when cross-compiling. I.e. not
> all distributions ship 2.13 and 2.61. AFAIK Gentoo uses 2.63.

Hum, sorry, I'm not sure to get what you mean. We already build
autoconf/automake/libtool for the host as soon as a package says
FOOBAR_AUTORECONF=YES. Do you mean that we should always build them ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
