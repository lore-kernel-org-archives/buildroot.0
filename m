From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jan 2016 16:09:20 +0100
Subject: [Buildroot] [PATCH v4 1/4] Add yp-tools and ypbind-mt to
 packages menu
In-Reply-To: <1453647303-3965-2-git-send-email-yba@tkos.co.il>
References: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
 <1453647303-3965-2-git-send-email-yba@tkos.co.il>
Message-ID: <20160124160920.0fb91f86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Sun, 24 Jan 2016 16:55:00 +0200, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  package/Config.in |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 09c2b40..af9656b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1482,6 +1482,8 @@ endif
>  	source "package/xinetd/Config.in"
>  	source "package/xl2tp/Config.in"
>  	source "package/xtables-addons/Config.in"
> +	source "package/yp-tools/Config.in"
> +	source "package/ypbind-mt/Config.in"

This should not be a separate patch. Instead, adding yp-tools to the
menu should be part of the patch adding the yp-tools package, and
adding ypbind-mt to the menu should be part of the patch adding the
ypbind-mt package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
