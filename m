From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 14:55:53 +0100
Subject: [Buildroot] [PATCH] genimage: bump to version 8
In-Reply-To: <1443015293-16426-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1443015293-16426-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <5602AF69.8080909@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

thanks a lot for your contribution.

When you bump a version, you also need to provide a new hash for the new
tarball. Please modify package/genimage/genimage.hash accordingly and
send a v2 of your patch. Also, don't forget to mark this one as
deprecated in Patchwork.

Regards,

Vincent.

On 09/23/2015 02:34 PM, Vivien Didelot wrote:
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  package/genimage/genimage.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
> index 07d95a4..2dffbc5 100644
> --- a/package/genimage/genimage.mk
> +++ b/package/genimage/genimage.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GENIMAGE_VERSION = 7
> +GENIMAGE_VERSION = 8
>  GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
>  GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
>  GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
> 
