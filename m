From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:52:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/nettle: set NETTLE_CPE_ID_VALID
In-Reply-To: <20210125224525.1358685-1-fontaine.fabrice@gmail.com>
References: <20210125224525.1358685-1-fontaine.fabrice@gmail.com>
Message-ID: <20210126185237.GD2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-25 23:45 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:nettle_project:nettle is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anettle_project%3Anettle
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nettle/nettle.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
> index 50ebdc706b..68844976ea 100644
> --- a/package/nettle/nettle.mk
> +++ b/package/nettle/nettle.mk
> @@ -10,6 +10,7 @@ NETTLE_DEPENDENCIES = gmp
>  NETTLE_INSTALL_STAGING = YES
>  NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
>  NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
> +NETTLE_CPE_ID_VALID = YES
>  # don't include openssl support for (unused) examples as it has problems
>  # with static linking
>  NETTLE_CONF_OPTS = --disable-openssl
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
