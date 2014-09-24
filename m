From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 24 Sep 2014 16:09:12 +0200
Subject: [Buildroot] [PATCH 1/1] Unexports MACHINE variable. Fixes bug
 7448
In-Reply-To: <1411533438-1415-1-git-send-email-risto.avila@digia.com>
References: <1411533438-1415-1-git-send-email-risto.avila@digia.com>
Message-ID: <5422D088.9010903@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Avila Risto,

Avila Risto wrote:
> Signed-off-by: Risto Avila <risto.avila@digia.com>
> ---
>   Makefile | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index e788f1b..53f8ad5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -292,6 +292,7 @@ unexport TAR_OPTIONS
>   unexport CONFIG_SITE
>   unexport QMAKESPEC
>   unexport TERMINFO
> +unexport MACHINE
>
>   GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>
>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
[Build-tested with nitrogen6x_defconfig]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
