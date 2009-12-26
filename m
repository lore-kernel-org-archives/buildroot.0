From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 26 Dec 2009 09:16:48 -0600
Subject: [Buildroot] gcc-error with latest buildroot
In-Reply-To: <200912261558.18888.marco-glatz@web.de>
References: <200912261427.53159.marco-glatz@web.de>
	<200912260829.56765.minimod@morethan.org>
	<200912261558.18888.marco-glatz@web.de>
Message-ID: <200912260916.50648.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat December 26 2009, Marco Glatz wrote:
> > Try enabling Fortran compiler in the build, it might "just work".
> > 
> > The Buildroot project uses a "tag-it, forget-it and move-on" release cycle;
> > they aren't staffed to support anything like a mission-critical,
> > stable release, version of Buildroot.
> 
> 
> hi,
> 
> with fortran enabled, the --with-mpfr and --with-gmp get set, but still 
> doesn'nt work.
> 
> i found this:
> 
> http://dvb-community.de/wiki/index.php/GCC-uClibC_Toolchain_erstellen
> 
> and this:
> 
> http://downloads.openwrt.org/docs/buildroot-documentation.html
> 

Been following OpenWRT (and OpenEmbedded) for several years;
I may have to switch to OpenWRT's build system myself.

I really don't need something that can build an entire distribution -
But at least those projects do have more people on the maintenance staff.

Will be postponing my own decision until I finish putting full MIPS support
into 2009.11 - I don't think I want to tackle the Makefile code churn here
to also put that support into dev-head.

Mike
> 
> 
> i will give it a try. also tried scratchbox, but that din't work either.
> 
> 
> marco
> 
> 
