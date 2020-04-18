From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 14:54:26 +0200
Subject: [Buildroot] [PATCH] package/environment-setup: new package
In-Reply-To: <20200418124525.GR5853@scaer>
References: <20200418103108.1877-1-angelo@amarulasolutions.com>
 <20200418124525.GR5853@scaer>
Message-ID: <20200418145426.7ce8e43d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Apr 2020 14:45:25 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +For your convenience, by selecting the package BR2_PACKAGE_ENVIRONMENT_SETUP,
> > +you can have a +setup-environment.sh+ script installed in +output/host/+.
> > +This script can be sourced with +. environment-setup.sh+ to launch
> > +the buildroot shell. Inside this shell, you will find an environment already
> > +set up with the correct PATH, the complete list of +target configure+
> > +variables and some useful commands like the +configure+ alias.  
> 
> I don't think this should warrant a blurb in the manual. Otherwise, you
> would have to add the same for the meson cross-compilation file that we
> provide. And the ones for cmake as well...

I actually think the meson cross-compilation, the cmake toolchain file
and al. should be documented in the manual. I'm not sure where exactly.
In fact we should probably a section "Application development" in
Buildroot, where we cover how to manually build stuff against the
Buildroot toolchain, how to use the SDK, how to use the local site
method or <pkg>_OVERRIDE_SRCDIR, etc.

Besides that aspect, I agree with Yann's review.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
