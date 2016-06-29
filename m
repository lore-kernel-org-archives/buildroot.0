From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 29 Jun 2016 08:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/tegrarcm: fix license typo
In-Reply-To: <1467182149-7654-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1467182149-7654-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <CAGm1_kvMGKZ6EGZxtmzqRFU36WyokA0QcipK2XnarqWSpNjrSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 29, 2016 at 8:35 AM, Jerzy Grzegorek
<jerzy.grzegorek@trzebnica.net> wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/tegrarcm/tegrarcm.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
> index 6f03b57..06fd039 100644
> --- a/package/tegrarcm/tegrarcm.mk
> +++ b/package/tegrarcm/tegrarcm.mk
> @@ -7,7 +7,7 @@
>  TEGRARCM_VERSION = v1.7
>  TEGRARCM_SITE = $(call github,NVIDIA,tegrarcm,$(TEGRARCM_VERSION))
>  TEGRARCM_LICENSE = BSD-3c / NVIDIA Software License (src/miniloader)
> -TEGRARCM_LICENSE_FILE = LICENSE
> +TEGRARCM_LICENSE_FILES = LICENSE
>  TEGRARCM_AUTORECONF = YES
>  HOST_TEGRARCM_DEPENDENCIES = host-libusb host-pkgconf host-cryptopp
>
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
