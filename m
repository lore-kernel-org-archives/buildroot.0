From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Mar 2015 12:25:26 +0200
Subject: [Buildroot] [PATCH v6] package/sysdig: New package
In-Reply-To: <1427278819-9444-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1427278819-9444-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150325102526.GX2825@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

On Wed, Mar 25, 2015 at 11:20:19AM +0100, Angelo Compagnucci wrote:
> Sysdig is open source, system-level exploration:
> capture system state and activity from a running Linux
> instance, then save, filter and analyze.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

[...]

> diff --git a/package/Config.in b/package/Config.in
> index e4ee95d..f3937e9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -94,7 +94,8 @@ endif
>  	source "package/spidev_test/Config.in"
>  	source "package/strace/Config.in"
>  	source "package/stress/Config.in"
> -	source "package/sysprof/Config.in"
> +	source "package/sysprof/Config.in
> +	source "package/sysdig/Config.in""

Are you sure?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
