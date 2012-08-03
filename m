From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 03 Aug 2012 10:18:56 +0200
Subject: [Buildroot] [PATCH 6/6] xinetd: Add license info
In-Reply-To: <1343962432-2772-6-git-send-email-danomimanchego123@gmail.com>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
 <1343962432-2772-6-git-send-email-danomimanchego123@gmail.com>
Message-ID: <501B8970.1080206@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>   package/xinetd/xinetd.mk |    8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
> index a209d12..c2f891b 100644
> --- a/package/xinetd/xinetd.mk
> +++ b/package/xinetd/xinetd.mk
> @@ -3,9 +3,11 @@
>   # xinetd
>   #
>   #############################################################
> -XINETD_VERSION = 2.3.15
> -XINETD_SOURCE  = xinetd-$(XINETD_VERSION).tar.gz
> -XINETD_SITE    = http://www.xinetd.org
> +XINETD_VERSION       = 2.3.15
> +XINETD_SOURCE        = xinetd-$(XINETD_VERSION).tar.gz
> +XINETD_SITE          = http://www.xinetd.org
> +XINETD_LICENSE       = Custom

To keep it consistent with similar cases (currently only bzip2 and
berkeleydb) I would better like to use "xinetd license" instead of
"Custom".
Or is there any reason that I didn't notice?

Thanks,
Luca
