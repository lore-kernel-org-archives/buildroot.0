From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2009 22:08:23 +0200
Subject: [Buildroot] buildroot openssl compile error
In-Reply-To: <87fxgcbfcp.fsf@macbook.be.48ers.dk>
References: <49E16433.9010707@comcast.net> <87fxgcbfcp.fsf@macbook.be.48ers.dk>
Message-ID: <20090413220823.210225fe@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 13 Apr 2009 20:03:50 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> There's no -I$(STAGING_DIR)/usr/include in the gcc invocation, so that
> probably fails with an external toolchain.

There's no need for -I$(STAGING_DIR)/usr/include with an external
toolchain if --sysroot $(STAGING_DIR) is passed (at least my
experiments confirm this). See r25879.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
