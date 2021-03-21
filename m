From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 11:27:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/gpsd: add GPSD_CPE_ID_VENDOR
In-Reply-To: <20210321091537.532664-1-fontaine.fabrice@gmail.com>
References: <20210321091537.532664-1-fontaine.fabrice@gmail.com>
Message-ID: <20210321102700.GA3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-21 10:15 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:gpsd_project:gpsd is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agpsd_project%3Agpsd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gpsd/gpsd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 57955b7895..be7327ac95 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -8,6 +8,7 @@ GPSD_VERSION = 3.20
>  GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
>  GPSD_LICENSE = BSD-2-Clause
>  GPSD_LICENSE_FILES = COPYING
> +GPSD_CPE_ID_VENDOR = gpsd_project
>  GPSD_INSTALL_STAGING = YES
>  
>  GPSD_DEPENDENCIES = host-python3 host-scons host-pkgconf
> -- 
> 2.30.1
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
