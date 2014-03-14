From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Mar 2014 23:56:44 +0100
Subject: [Buildroot] [PATCH 1/2] Create new section "Mail" in menuconfig
 and collect mail packages
In-Reply-To: <BLU0-SMTP15284A38FE42BDBF236D49BD9700@phx.gbl>
References: <1394835693-32232-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP15284A38FE42BDBF236D49BD9700@phx.gbl>
Message-ID: <20140314225644.GB16649@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-03-14 23:21 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/Config.in |   13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 70e5a7f..70d7023 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -230,7 +230,6 @@ source "package/leafpad/Config.in"
>  source "package/midori/Config.in"
>  source "package/pcmanfm/Config.in"
>  source "package/rdesktop/Config.in"
> -source "package/sylpheed/Config.in"
>  source "package/synergy/Config.in"
>  source "package/torsmo/Config.in"
>  source "package/wmctrl/Config.in"
> @@ -696,7 +695,6 @@ source "package/libcgi/Config.in"
>  source "package/libcgicc/Config.in"
>  source "package/libcurl/Config.in"
>  source "package/libdnet/Config.in"
> -source "package/libesmtp/Config.in"
>  source "package/libeXosip2/Config.in"
>  source "package/libfcgi/Config.in"
>  source "package/libgsasl/Config.in"
> @@ -842,6 +840,14 @@ source "package/sound-theme-borealis/Config.in"
>  source "package/sound-theme-freedesktop/Config.in"
>  endmenu
>  
> +menu "Mail"
> +source "package/heirloom-mailx/Config.in"
> +source "package/libesmtp/Config.in"
> +source "package/msmtp/Config.in"
> +source "package/mutt/Config.in"
> +source "package/sylpheed/Config.in"
> +endmenu
> +
>  menu "Networking applications"
>  source "package/aiccu/Config.in"
>  source "package/aircrack-ng/Config.in"
> @@ -878,7 +884,6 @@ source "package/foomatic-filters/Config.in"
>  source "package/fping/Config.in"
>  source "package/gesftpserver/Config.in"
>  source "package/gutenprint/Config.in"
> -source "package/heirloom-mailx/Config.in"
>  source "package/hiawatha/Config.in"
>  source "package/hostapd/Config.in"
>  source "package/hplip/Config.in"
> @@ -912,9 +917,7 @@ source "package/modem-manager/Config.in"
>  source "package/mongoose/Config.in"
>  source "package/mongrel2/Config.in"
>  source "package/mrouted/Config.in"
> -source "package/msmtp/Config.in"
>  source "package/mtr/Config.in"
> -source "package/mutt/Config.in"
>  source "package/nbd/Config.in"
>  source "package/ncftp/Config.in"
>  source "package/ndisc6/Config.in"
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
