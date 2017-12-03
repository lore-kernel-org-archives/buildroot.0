From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 4 Dec 2017 00:21:02 +0300
Subject: [Buildroot] [git commit] DEVELOPERS: fix alphabetic ordering
 for Sergey Matyukevich
In-Reply-To: <20171203202617.20560815F7@busybox.osuosl.org>
References: <20171203202617.20560815F7@busybox.osuosl.org>
Message-ID: <20171203212102.gtzvyn5h6rzxd6on@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> commit: https://git.buildroot.net/buildroot/commit/?id=c5129c849a7dd78e56ce4cfc5fbd8ddfe49cd81d
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  DEVELOPERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d96884b..08f6e96 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1508,14 +1508,14 @@ F:	package/lua-resty-http/
>  F:	package/mpir/
>  
>  N:	Sergey Matyukevich <geomatsi@gmail.com>
> -F:	package/xr819-xradio/
> -F:	package/armbian-firmware/
>  F:	board/orangepi/orangepi-zero
>  F:	board/orangepi/orangepi-one
>  F:	board/linksprite/pcduino
>  F:	configs/orangepi_one_defconfig
>  F:	configs/orangepi_zero_defconfig
>  F:	configs/linksprite_pcduino_defconfig
> +F:	package/armbian-firmware/
> +F:	package/xr819-xradio/
>  
>  N:	Sergio Prado <sergio.prado@e-labworks.com>
>  F:	package/libgdiplus/

Thanks for doing this. This fix was is a part of my today's
v3 MacchiatoBin series. So it looks like the time has come for v4 :)

Regards,
Sergey
