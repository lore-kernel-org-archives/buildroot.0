From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 21 Apr 2010 14:06:18 +0000 (UTC)
Subject: [Buildroot] Still can't build working rootfs
	with	crosstool-NGtoolchain
References: <hqhq8e$uau$1@dough.gmane.org>
	<8D63FCBEC4B04D56B92C74260683A038@development>
	<028801cae0e3$3ebe5720$bc3b0560$@com>
	<5D7DDABC417D46CFACF64003BB0EBC2F@development>
Message-ID: <hqn0op$14i$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-21, Microbit_P43000 <microbit@virginbroadband.com.au> wrote:

> It's a while ago I've been through this - but the common denominator
> of course is the fact that the lib is dynamically linked. The config
> of float/lib is just fine - it compiles on a fresh install - or
> consequent builds for my rootfs, Nano runs perfect - no problemo.
>
> I just couldn't pin down _what_ exactly triggers BR2 to "remake"
> itself completely. It mostly would happen *after* I change a simple
> option in Busybox - of all things. How exactly does that warrant
> RE-building the whole install (incl internal toolchain) ???

I never do anything with buildroot other than complete ground-up
builds from scratch.  Despite the documented ways to do partial
rebuilds, I was never able to reliably do a parial rebuild.  After
several instances of spending hours or days chasing problems that went
away after a complete re-build, I simply gave up on doing anything
other than building from zero.

-- 
Grant Edwards               grant.b.edwards        Yow! Where do your SOCKS
                                  at               go when you lose them in
                              gmail.com            th' WASHER?
