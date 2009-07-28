From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2009 12:10:39 +0200
Subject: [Buildroot] [PATCH 4/4] xorg: add a new cross-compile fix for
 libXt 1.0.6
In-Reply-To: <90a459ce4d27fc6a2527ae29f0a07f24f0993a02.1248774911.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248774911.git.thomas.petazzoni@free-electrons.com>
	<90a459ce4d27fc6a2527ae29f0a07f24f0993a02.1248774911.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20090728121039.14d378c0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Jul 2009 11:55:15 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> The cross-compile fix included in mainline of libXt between 1.0.5 and
> 1.0.6 is not sufficient. It allows to pass a different compiler for
> the host tools, but still uses the TARGET_CFLAGS/TARGET_LDFLAGS to
> compile the host tools, which obviously isn't correct.
> 
> The new patch allows to use the CFLAGS_FOR_BUILD/LDFLAGS_FOR_BUILD
> variables as the CFLAGS/LDFLAGS to build the host tools.

Patch submitted upstream, at
https://bugs.freedesktop.org/show_bug.cgi?id=23001

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
