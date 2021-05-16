From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 13:48:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/jquery-validation: add CPE
 variables
In-Reply-To: <20210516093422.3768746-1-fontaine.fabrice@gmail.com>
References: <20210516093422.3768746-1-fontaine.fabrice@gmail.com>
Message-ID: <20210516114838.GB2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-16 11:34 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:jqueryvalidation:jquery_validation is a valid CPE identifier
> for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajqueryvalidation%3Ajquery_validation
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/jquery-validation/jquery-validation.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
> index a8c2897983..43e57a9fc9 100644
> --- a/package/jquery-validation/jquery-validation.mk
> +++ b/package/jquery-validation/jquery-validation.mk
> @@ -9,6 +9,8 @@ JQUERY_VALIDATION_SITE = http://jqueryvalidation.org/files
>  JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
>  JQUERY_VALIDATION_LICENSE = MIT
>  JQUERY_VALIDATION_LICENSE_FILES = README.md
> +JQUERY_VALIDATION_CPE_ID_VENDOR = jqueryvalidation
> +JQUERY_VALIDATION_CPE_ID_PRODUCT = jquery_validation
>  
>  define JQUERY_VALIDATION_EXTRACT_CMDS
>  	$(UNZIP) -d $(@D) $(JQUERY_VALIDATION_DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
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
