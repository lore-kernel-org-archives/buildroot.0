From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Jun 2021 20:16:24 +0300
Subject: [Buildroot] [PATCH 1/5] package/nginx: bump version to 1.20.1
In-Reply-To: <20210628161610.3197763-2-aduskett@gmail.com>
References: <20210628161610.3197763-1-aduskett@gmail.com>
 <20210628161610.3197763-2-aduskett@gmail.com>
Message-ID: <87y2atnc47.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, Jun 28 2021, Adam Duskett wrote:
> diff --git a/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch b/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
> deleted file mode 100644
> index ba47768fe5..0000000000
> --- a/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 9f1dcb0c0473641730b871dee984016ff19d2c53 Mon Sep 17 00:00:00 2001
> -From: Maxim Dounin <mdounin@mdounin.ru>
> -Date: Tue, 25 May 2021 15:17:36 +0300
> -Subject: [PATCH] Resolver: fixed off-by-one write in ngx_resolver_copy().
> -
> -Reported by Luis Merino, Markus Vervier, Eric Sesterhenn, X41 D-Sec GmbH.
> -
> -[peter at korsgaard.com: backport from upstream]
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I think you can also drop NGINX_IGNORE_CVES.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
