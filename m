From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:50:26 +0200
Subject: [Buildroot] [PATCH] package/bwm-ng: license is GPL-2.0+
In-Reply-To: <20190920072343.4807-1-peter@korsgaard.com>
References: <20190920072343.4807-1-peter@korsgaard.com>
Message-ID: <ce467278-1b2a-a9a7-08de-9c0f0da71e13@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/09/2019 09:23, Peter Korsgaard wrote:
> The source files contain the "(at your option) any later version" text, so
> change the licese to GPL-2.0+.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/bwm-ng/bwm-ng.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
> index 5e663dafea..4a34559e3c 100644
> --- a/package/bwm-ng/bwm-ng.mk
> +++ b/package/bwm-ng/bwm-ng.mk
> @@ -7,7 +7,7 @@
>  BWM_NG_VERSION = 0.6.2
>  BWM_NG_SITE = $(call github,vgropp,bwm-ng,v$(BWM_NG_VERSION))
>  BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
> -BWM_NG_LICENSE = GPL-2.0
> +BWM_NG_LICENSE = GPL-2.0+
>  BWM_NG_LICENSE_FILES = COPYING
>  BWM_NG_AUTORECONF = YES
>  
> 
