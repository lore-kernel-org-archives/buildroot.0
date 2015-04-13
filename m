From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2015 06:50:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/kodi: Fix path to binary in
	service
References: <1428875137-16284-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <XnsA47B458B781B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian <maxime.hadjinlian@gmail.com> 
wrote in news:1428875137-16284-1-git-send-email-maxime.hadjinlian at gmail.com:

> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian-
Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  package/kodi/kodi.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kodi/kodi.service b/package/kodi/kodi.service
> index acd3b8e..f30741c 100644
> --- a/package/kodi/kodi.service
> +++ b/package/kodi/kodi.service
> @@ -4,7 +4,7 @@ After = network.target
>  
>  [Service]
>  Type = simple
> -ExecStart = /usr/lib/xbmc/xbmc.bin --standalone -fs -n
> +ExecStart = /usr/lib/kodi/kodi.bin --standalone -fs -n
>  Restart = on-failure
>  
>  [Install]

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
