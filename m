From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Apr 2021 11:48:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-validators: add CPE
 variables
In-Reply-To: <20210405093111.3530780-1-fontaine.fabrice@gmail.com>
References: <20210405093111.3530780-1-fontaine.fabrice@gmail.com>
Message-ID: <20210405094810.GM2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-05 11:31 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:validators_project:validators is a valid CPE identifier for
> this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avalidators_project%3Avalidators
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-validators/python-validators.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
> index 7268b1013b..5bed051911 100644
> --- a/package/python-validators/python-validators.mk
> +++ b/package/python-validators/python-validators.mk
> @@ -10,5 +10,7 @@ PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/c4/4a/4f9c892f9
>  PYTHON_VALIDATORS_SETUP_TYPE = setuptools
>  PYTHON_VALIDATORS_LICENSE = MIT
>  PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
> +PYTHON_VALIDATORS_CPE_ID_VENDOR = validators_project
> +PYTHON_VALIDATORS_CPE_ID_PRODUCT = validators
>  
>  $(eval $(python-package))
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
