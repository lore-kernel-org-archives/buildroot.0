From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Oct 2020 20:20:23 +0200
Subject: [Buildroot] [PATCH] package/libubootenv: bump to version 0.3.1
In-Reply-To: <20201020162120.1022548-1-francois.perrad@gadz.org>
References: <20201020162120.1022548-1-francois.perrad@gadz.org>
Message-ID: <20201021202023.1056e356@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Tue, 20 Oct 2020 18:21:20 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
> index 65260b70e..4c7607ac8 100644
> --- a/package/libubootenv/libubootenv.mk
> +++ b/package/libubootenv/libubootenv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUBOOTENV_VERSION = 86bd30a14e153a18f670b25708795253d8736f0f
> +LIBUBOOTENV_VERSION = v0.3.1

Thanks for the patch. However, we try to avoid having the "v" prefix in
the version variable. Could you adjust your patch accordingly ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
