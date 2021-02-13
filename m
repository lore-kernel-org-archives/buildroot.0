From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 22:35:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/fail2ban: add
 FAIL2BAN_CPE_ID_VENDOR
In-Reply-To: <20210212213902.12139-1-fontaine.fabrice@gmail.com>
References: <20210212213902.12139-1-fontaine.fabrice@gmail.com>
Message-ID: <20210213223529.2e09d596@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Feb 2021 22:39:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:fail2ban:fail2ban is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afail2ban%3Afail2ban
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fail2ban/fail2ban.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
> index a4ee0852cc..d2fe19d11e 100644
> --- a/package/fail2ban/fail2ban.mk
> +++ b/package/fail2ban/fail2ban.mk
> @@ -8,6 +8,7 @@ FAIL2BAN_VERSION = 0.11.1
>  FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
>  FAIL2BAN_LICENSE = GPL-2.0+
>  FAIL2BAN_LICENSE_FILES = COPYING
> +FAIL2BAN_CPE_ID_VENDOR = fail2ban
>  FAIL2BAN_SETUP_TYPE = distutils
>  
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
