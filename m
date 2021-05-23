From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 20:00:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: add CPE variables
In-Reply-To: <20210523142411.1523429-1-fontaine.fabrice@gmail.com>
References: <20210523142411.1523429-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523180029.GB3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 16:24 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:readymedia_project:readymedia is a valid CPE identifier for
> this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Areadymedia_project%3Areadymedia
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/minidlna/minidlna.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
> index 0bb3dd3502..86a2bb368d 100644
> --- a/package/minidlna/minidlna.mk
> +++ b/package/minidlna/minidlna.mk
> @@ -8,6 +8,8 @@ MINIDLNA_VERSION = 1.3.0
>  MINIDLNA_SITE = https://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
>  MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
>  MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
> +MINIDLNA_CPE_ID_VENDOR = readymedia_project
> +MINIDLNA_CPE_ID_PRODUCT = readymedia
>  
>  MINIDLNA_DEPENDENCIES = \
>  	$(TARGET_NLS_DEPENDENCIES) \
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
