From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 11:54:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/trinity: add
 TRINITY_CPE_ID_VENDOR
In-Reply-To: <20210717090037.670285-1-fontaine.fabrice@gmail.com>
References: <20210717090037.670285-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717095452.GN12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

On 2021-07-17 11:00 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:trinity_project:trinity is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atrinity_project%3Atrinity
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/trinity/trinity.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
> index adf7d1455c..befb8de826 100644
> --- a/package/trinity/trinity.mk
> +++ b/package/trinity/trinity.mk
> @@ -9,6 +9,7 @@ TRINITY_SITE = http://codemonkey.org.uk/projects/trinity
>  TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
>  TRINITY_LICENSE = GPL-2.0
>  TRINITY_LICENSE_FILES = COPYING
> +TRINITY_CPE_ID_VENDOR = trinity_project
>  
>  define TRINITY_CONFIGURE_CMDS
>  	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
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
