From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 31 Jan 2018 15:24:47 +0000
Subject: [Buildroot] [PATCH] Updated Liberation fonts source site
In-Reply-To: <CALoEJ8yDeSfTKw1=GYr_vCUGn7h7fD8VgxD6vjKZLJyk-sy=WA@mail.gmail.com>
References: <CALoEJ8yDeSfTKw1=GYr_vCUGn7h7fD8VgxD6vjKZLJyk-sy=WA@mail.gmail.com>
Message-ID: <20180131152447.GB19300@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 31 Jan 2018 17:02:30 +0200, Biser Milanov <bmilanov11@gmail.com> wrote:
> From 26efe7cec55ff310445ee7778e30de6d21e38d3e Mon Sep 17 00:00:00 2001
> From: Biser Milanov
> Date: Wed, 31 Jan 2018 16:51:22 +0200
> Subject: [PATCH] Updated Liberation fonts source site
> To: buildroot at busybox.org
> 
> Old location no longer reachable via wget even with
> "--no-check-certificate":
>     ERROR 404: Not Found.
> 
> Replaced old site with Wikipedia-cited official site pagure.org.
> ---
>  package/liberation/liberation.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/liberation/liberation.mk b/package/liberation/
> liberation.mk
> index dfed086..a77c014 100644
> --- a/package/liberation/liberation.mk
> +++ b/package/liberation/liberation.mk
> @@ -5,7 +5,7 @@
> ################################################################################
> 
> LIBERATION_VERSION = 2.00.1
> -LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
> +LIBERATION_SITE = https://releases.pagure.org/liberation-fonts
> LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
> LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
> LIBERATION_LICENSE = OFLv1.1
> --
> 1.8.3.1

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180131/52ca98e0/attachment.asc>
