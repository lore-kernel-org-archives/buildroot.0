From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 20:00:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/minissdpd: add
 MINISSDPD_CPE_ID_VENDOR
In-Reply-To: <20210523142717.1523687-1-fontaine.fabrice@gmail.com>
References: <20210523142717.1523687-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523180042.GC3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 16:27 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:miniupnp_project:minissdpd is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminiupnp_project%3Aminissdpd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/minissdpd/minissdpd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
> index 4560919baa..214af76387 100644
> --- a/package/minissdpd/minissdpd.mk
> +++ b/package/minissdpd/minissdpd.mk
> @@ -8,6 +8,7 @@ MINISSDPD_VERSION = 1.5.20200928
>  MINISSDPD_SITE = http://miniupnp.free.fr/files
>  MINISSDPD_LICENSE = BSD-3-Clause
>  MINISSDPD_LICENSE_FILES = LICENSE
> +MINISSDPD_CPE_ID_VENDOR = miniupnp_project
>  MINISSDPD_DEPENDENCIES = libnfnetlink
>  
>  define MINISSDPD_BUILD_CMDS
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
