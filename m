From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:31:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: add
 PULSEAUDIO_CPE_ID_VENDOR
In-Reply-To: <20210522202156.282991-1-fontaine.fabrice@gmail.com>
References: <20210522202156.282991-1-fontaine.fabrice@gmail.com>
Message-ID: <20210522203116.GI3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 22:21 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:pulseaudio:pulseaudio is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apulseaudio%3Apulseaudio
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pulseaudio/pulseaudio.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index 6dfb1f8647..19e08f55ae 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -10,6 +10,7 @@ PULSEAUDIO_SITE = https://freedesktop.org/software/pulseaudio/releases
>  PULSEAUDIO_INSTALL_STAGING = YES
>  PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
>  PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
> +PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
>  PULSEAUDIO_CONF_OPTS = \
>  	--disable-default-build-tests \
>  	--disable-legacy-database-entry-format \
> -- 
> 2.30.2
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
