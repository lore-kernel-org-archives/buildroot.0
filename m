From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Mar 2018 20:52:27 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add odroidc2 defconfig to my
 list
In-Reply-To: <20180305174323.5629-1-daggs@gmx.com>
References: <20180305174323.5629-1-daggs@gmx.com>
Message-ID: <20180305205227.0ea0835d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Mar 2018 19:43:23 +0200, Dagg Stompler wrote:
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 73c0231bc0..fffc646973 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -458,6 +458,7 @@ N:	Dagg Stompler <daggs@gmx.com>
>  F:	package/libamcodec/
>  F:	package/odroid-mali/
>  F:	package/odroid-scripts/
> +F:	configs/odroidc2_defconfig

Thanks! However, alphabetic ordering is not respected here, and you
should also add an entry for board/hardkernel/odroidc2/.

This can be fixed when we apply, unless you want to send a v2 for
this :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
