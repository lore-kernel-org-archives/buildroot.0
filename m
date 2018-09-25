From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 16:17:43 +0200
Subject: [Buildroot] [PATCH 1/1] libesmtp: update/fix site URL
In-Reply-To: <20180925133521.2934-1-m.patzlaff@pilz.de>
References: <20180925133521.2934-1-m.patzlaff@pilz.de>
Message-ID: <20180925161743.190dc487@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

On Tue, 25 Sep 2018 15:35:21 +0200, Marcel Patzlaff wrote:
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> ---
>  package/libesmtp/libesmtp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
> index b0f88c7a3b..9c336793a4 100644
> --- a/package/libesmtp/libesmtp.mk
> +++ b/package/libesmtp/libesmtp.mk
> @@ -6,7 +6,7 @@
>  
>  LIBESMTP_VERSION = 1.0.6
>  LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
> -LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
> +LIBESMTP_SITE = http://brianstafford.info/libesmtp

Probably the Config.in file should be updated as well.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
