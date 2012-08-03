From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 03 Aug 2012 10:41:09 +0200
Subject: [Buildroot] [PATCH 2/6] expat: Add license info
In-Reply-To: <1343962432-2772-2-git-send-email-danomimanchego123@gmail.com>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
 <1343962432-2772-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <501B8EA5.4010600@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>   package/expat/expat.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 663abcd..7fa3126 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -10,6 +10,8 @@ EXPAT_INSTALL_STAGING = YES
>   EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
>   EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
>   EXPAT_DEPENDENCIES = host-pkg-config
> +EXPAT_LICENSE = MIT
> +EXPAT_LICENSE_FILES = COPYING
>   
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
