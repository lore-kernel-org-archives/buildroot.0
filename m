From: daggs <daggs@gmx.com>
Date: Thu, 26 May 2016 08:02:00 +0200
Subject: [Buildroot] [PATCH v2 resend 1/3] add odroid mali GL support.
In-Reply-To: <20160525224731.3731e26b@itchy>
References: <20160525174632.7086-1-daggs@gmx.com>,
 <20160525224731.3731e26b@itchy>
Message-ID: <trinity-a7e8c525-ac22-4f8d-a6ba-5e9443f5fa66-1464242520166@3capp-mailcom-bs10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Sent: Wednesday, May 25, 2016 at 11:47 PM
> From: "Eric Le Bihan" <eric.le.bihan.dev@free.fr>
> To: Dagg <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH v2 resend 1/3] add odroid mali GL support.
>
> Hi!
> 
> Le Wed, 25 May 2016 20:46:30 +0300,
> Dagg <daggs@gmx.com> a ?crit :
> 
> <snip>
> > +################################################################################
> > +#
> > +# odroid-mali
> > +#
> > +################################################################################
> > +
> > +ODROID_MALI_VERSION = $(ODROID_DRIVER_VERSION)
> > +ODROID_MALI_TARBALL = opengl-meson-gxbb-r5p1-01rel0.tar.xz
> > +ODROID_MALI_SITE = http://sources.openelec.tv/devel
> > +ODROID_MALI_SOURCE = opengl-meson-gxbb-r5p1-01rel0.tar.xz
> <snip>
> 
> I've just received an odroidc2 and I am very interested by this patch.
> However, why is the binary userspace driver hijacked from another FOSS
> project (OpenELEC)? 
> 
> Is'nt there an official repository for the MALI 450 userspace driver? I
> looked at the MALI developer site [1], but could not find anything for it...
> 
> [1] https://malideveloper.arm.com/resources/drivers/arm-mali-midgard-gpu-user-space-drivers/	
> 
> -- 
> ELB

that is the only place I could find it without the need to find a place to store it.

it can be taken from the official buildroot of hardkernel but it will need a place to store it as it needs to be taken from https://github.com/hardkernel/buildroot/tree/master/package/opengl/src/lib

I can try and modify the file to download the files from the git repo if it is the right way to do this.

Dagg.
