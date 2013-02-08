From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Feb 2013 18:44:04 +0100
Subject: [Buildroot] [PATCH 6/6] package/mtools: new host-package
In-Reply-To: <3103c5fb4a737edda5e8fc0dbd7d5dc20dda572e.1360344619.git.yann.morin.1998@free.fr>
References: <cover.1360344619.git.yann.morin.1998@free.fr>
 <3103c5fb4a737edda5e8fc0dbd7d5dc20dda572e.1360344619.git.yann.morin.1998@free.fr>
Message-ID: <20130208184404.7f1cda67@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  8 Feb 2013 18:33:00 +0100, Yann E. MORIN wrote:

> diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
> new file mode 100644
> index 0000000..95cc73e
> --- /dev/null
> +++ b/package/mtools/mtools.mk
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# dosfstools
> +#
> +#############################################################
> +
> +MTOOLS_VERSION          = 4.0.18
> +MTOOLS_SOURCE           = mtools-$(MTOOLS_VERSION).tar.bz2

Why so many spaces ? :-)

> +MTOOLS_SITE             = http://ftp.gnu.org/gnu/mtools/

BR2_GNU_MIRROR

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
