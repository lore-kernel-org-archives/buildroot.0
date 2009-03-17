From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2009 08:55:35 +0100
Subject: [Buildroot] svn commit: [25683] trunk/buildroot: package project
In-Reply-To: <87fxhdp8u4.fsf@macbook.be.48ers.dk>
References: <20090316154844.13B657643C@busybox.osuosl.org>
	<20090316200849.2beaada3@surf> <87fxhdp8u4.fsf@macbook.be.48ers.dk>
Message-ID: <20090317085535.28fe4e4d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Mar 2009 20:26:59 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Yes, but I didn't want to move pkgconfig just yet. The PKG_CONFIG_PATH
> is correct though, as this is HOST_CONFIGURE_OPTS, E.G. the options to
> configure where you're compiling for the host.

Ok, got it.

> I'll move over the existing host tools (pkgconfig, auto*, libtool)
> soonish.

Great. What about the toolchain itself ? It is a host tool after all,
isn't it ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
