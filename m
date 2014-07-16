From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 19:40:22 +0200
Subject: [Buildroot] Patch to add Tilera tilegx platform support
In-Reply-To: <20140608172241.24672d2b@free-electrons.com>
References: <53906ED8.90500@arni.lv>
 <20140608172241.24672d2b@free-electrons.com>
Message-ID: <20140716194022.77649022@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arni,

On Sun, 8 Jun 2014 17:22:41 +0200, Thomas Petazzoni wrote:

> On Thu, 05 Jun 2014 14:21:28 +0100, Arni wrote:
> 
> > I'm working on porting Tilera tilegx platform to OpenWRT project, but
> > I'm sure you are also interested in it.
> > Patch is very simple, hope someone will find it usefull. Here is the patch :
> 
> Thanks for this patch!
> 
> However, adding an architecture to Buildroot is a bit more than just
> adding those few definitions. I'm mainly thinking:
> 
>  * Toolchain: did you test the internal toolchain backend? Or are
>    external toolchains available?
> 
>  * Packages: how much user-space packages that have
>    architecture-specific code support the tilegx platform? For example,
>    libffi, or strace are such packages.
> 
>  * Support: if we start supporting a new architecture in Buildroot, we
>    try to do it well. One aspect of this is that we would add this
>    architecture to our automated build infrastructure, which tests
>    random combinations of packages. Would you be willing to help fixing
>    the issues that arise through this testing effort? It would be a bit
>    annoying for us to add the support for an architecture, and then
>    have nobody actively interested in it and therefore nobody fixing
>    the various issues.

Since the patch is incomplete, that adding the support for a new
architecture in Buildroot involves quite some work beyond just adding a
Config.in entry, and that you never replied to my original feedback,
I'll mark the patch as Rejected in our patch tracking system for the
moment.

Should you be interested in seeing the Tilera architecture support
merged in Buildroot, please do not hesitate to get back to us. However,
we'll have to be convinced that some person will be around to help
fixing the Tilera related issues when they show up.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
