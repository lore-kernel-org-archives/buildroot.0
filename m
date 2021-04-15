From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Apr 2021 21:17:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgis: add
 POSTGIS_CPE_ID_VENDOR
In-Reply-To: <20210414210047.1370726-1-fontaine.fabrice@gmail.com>
References: <20210414210047.1370726-1-fontaine.fabrice@gmail.com>
Message-ID: <f273ff52-331c-8151-3d8b-15d45ea94308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/04/2021 23:00, Fabrice Fontaine wrote:
> cpe:2.3:a:postgis:postgis is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apostgis%3Apostgis
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 I'll try to remember in the future to check CPE ID for new packages.

 Regards,
 Arnout

> ---
>  package/postgis/postgis.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> index 1661f48ff2..4bfcc2ee84 100644
> --- a/package/postgis/postgis.mk
> +++ b/package/postgis/postgis.mk
> @@ -10,6 +10,7 @@ POSTGIS_SITE = https://download.osgeo.org/postgis/source
>  POSTGIS_MAKE = $(MAKE1)
>  POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-2-Clause, MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
>  POSTGIS_LICENSE_FILES = LICENSE.TXT
> +POSTGIS_CPE_ID_VENDOR = postgis
>  # configure.ac is patched so need to run autoreconf
>  POSTGIS_AUTORECONF = YES
>  
> 
