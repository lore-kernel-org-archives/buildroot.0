From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:34:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/openldap: add
 OPENLDAP_CPE_ID_VENDOR
In-Reply-To: <20210112180448.10093-1-fontaine.fabrice@gmail.com>
References: <20210112180448.10093-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114223458.4e95c1fb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2021 19:04:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:openldap:openldap is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenldap%3Aopenldap
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openldap/openldap.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
> index e44c958c41..17128910e1 100644
> --- a/package/openldap/openldap.mk
> +++ b/package/openldap/openldap.mk
> @@ -9,6 +9,7 @@ OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
>  OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
>  OPENLDAP_LICENSE = OpenLDAP Public License
>  OPENLDAP_LICENSE_FILES = LICENSE
> +OPENLDAP_CPE_ID_VENDOR = $(OPENLDAP_NAME)

I think Peter didn't really like to use $(OPENLDAP_NAME) and preferred
using just "openldap". So I changed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
