From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 14:23:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: add CPE
 variables
In-Reply-To: <20210515100848.2365418-1-fontaine.fabrice@gmail.com>
References: <20210515100848.2365418-1-fontaine.fabrice@gmail.com>
Message-ID: <20210515122309.GJ2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-15 12:08 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:python:keyring is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Akeyring
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

The 5 python related patches: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-keyring/python-keyring.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
> index 2f6ee8497f..0e05738605 100644
> --- a/package/python-keyring/python-keyring.mk
> +++ b/package/python-keyring/python-keyring.mk
> @@ -10,6 +10,8 @@ PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/ee/46/77fdb7cd2b0f
>  PYTHON_KEYRING_SETUP_TYPE = setuptools
>  PYTHON_KEYRING_LICENSE = MIT
>  PYTHON_KEYRING_LICENSE_FILES = LICENSE
> +PYTHON_KEYRING_CPE_ID_VENDOR = python
> +PYTHON_KEYRING_CPE_ID_PRODUCT = keyring
>  PYTHON_KEYRING_DEPENDENCIES = host-python-setuptools-scm
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
