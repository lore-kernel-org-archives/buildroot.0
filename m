From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 23:37:43 +0200
Subject: [Buildroot] [PATCH] libosmesa: New package
In-Reply-To: <560C50B6.3050409@dawncrow.de>
References: <560C50B6.3050409@dawncrow.de>
Message-ID: <20150930233743.6835979e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Wed, 30 Sep 2015 23:14:30 +0200, Andr? Hentschel wrote:

> diff --git a/package/libosmesa/libosmesa.hash b/package/libosmesa/libosmesa.hash
> new file mode 100644
> index 0000000..0501314
> --- /dev/null
> +++ b/package/libosmesa/libosmesa.hash
> @@ -0,0 +1,2 @@
> +# From http://lists.freedesktop.org/archives/mesa-announce/2015-September/000175.html
> +sha256	e36ee5ceeadb3966fb5ce5b4cf18322dbb76a4f075558ae49c3bba94f57d58fd	mesa-10.6.8.tar.xz
> diff --git a/package/libosmesa/libosmesa.mk b/package/libosmesa/libosmesa.mk
> new file mode 100644
> index 0000000..f70fd2a
> --- /dev/null
> +++ b/package/libosmesa/libosmesa.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# libosmesa
> +#
> +################################################################################
> +
> +# When updating the version, please also update mesa3d
> +LIBOSMESA_VERSION = 10.6.8
> +LIBOSMESA_SOURCE = mesa-$(LIBOSMESA_VERSION).tar.xz
> +LIBOSMESA_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(LIBOSMESA_VERSION)

Why are you creating a new package, instead of simply adding a new
option to the existing mesa3d package?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
