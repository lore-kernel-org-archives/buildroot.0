From: Thomas Huth <huth@tuxfamily.org>
Date: Wed, 29 May 2019 11:00:47 +0200
Subject: [Buildroot] [PATCH v2] package/dropbear: rework license
 information
In-Reply-To: <20190529070701.8913-1-yegorslists@googlemail.com>
References: <20190529070701.8913-1-yegorslists@googlemail.com>
Message-ID: <20190529110047.19e54599@thl530.multi.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 29 May 2019 09:07:01 +0200
schrieb yegorslists at googlemail.com:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> According to the LICENSE file curve25519-donna is licensed under
> BSD-3-Clause license.
> 
> There is only BSD-2-Clause license mentioned so remove
> BSD-2-Clause-like.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
>   - remove BSD-2-Clause-like license (suggested by Arnout
> Vandecappelle)
> 
>  package/dropbear/dropbear.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dropbear/dropbear.mk
> b/package/dropbear/dropbear.mk index e10c851606..9c995c3894 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -7,7 +7,7 @@
>  DROPBEAR_VERSION = 2019.78
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
> -DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
> +DROPBEAR_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause
>  DROPBEAR_LICENSE_FILES = LICENSE
>  DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
>  DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)

Ok, that makes even more sense than v1, indeed.

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
