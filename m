From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:01:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: add FFMPEG_CPE_ID_VENDOR
In-Reply-To: <20210116230932.212050-1-fontaine.fabrice@gmail.com>
References: <20210116230932.212050-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117090128.GV2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-17 00:09 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:ffmpeg:ffmpeg is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Affmpeg%3Affmpeg
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ffmpeg/ffmpeg.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index fd4a8ab1c4..6d28bfbed7 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -16,6 +16,8 @@ FFMPEG_LICENSE += and GPL-2.0+
>  FFMPEG_LICENSE_FILES += COPYING.GPLv2
>  endif
>  
> +FFMPEG_CPE_ID_VENDOR = ffmpeg
> +
>  FFMPEG_CONF_OPTS = \
>  	--prefix=/usr \
>  	--enable-avfilter \
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
