From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 25 May 2016 22:47:31 +0200
Subject: [Buildroot] [PATCH v2 resend 1/3] add odroid mali GL support.
In-Reply-To: <20160525174632.7086-1-daggs@gmx.com>
References: <20160525174632.7086-1-daggs@gmx.com>
Message-ID: <20160525224731.3731e26b@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Wed, 25 May 2016 20:46:30 +0300,
Dagg <daggs@gmx.com> a ?crit :

<snip>
> +################################################################################
> +#
> +# odroid-mali
> +#
> +################################################################################
> +
> +ODROID_MALI_VERSION = $(ODROID_DRIVER_VERSION)
> +ODROID_MALI_TARBALL = opengl-meson-gxbb-r5p1-01rel0.tar.xz
> +ODROID_MALI_SITE = http://sources.openelec.tv/devel
> +ODROID_MALI_SOURCE = opengl-meson-gxbb-r5p1-01rel0.tar.xz
<snip>

I've just received an odroidc2 and I am very interested by this patch.
However, why is the binary userspace driver hijacked from another FOSS
project (OpenELEC)? 

Is'nt there an official repository for the MALI 450 userspace driver? I
looked at the MALI developer site [1], but could not find anything for it...

[1] https://malideveloper.arm.com/resources/drivers/arm-mali-midgard-gpu-user-space-drivers/	

-- 
ELB
