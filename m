From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Apr 2021 11:48:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-web2py: add CPE variables
In-Reply-To: <20210405093849.3531546-1-fontaine.fabrice@gmail.com>
References: <20210405093849.3531546-1-fontaine.fabrice@gmail.com>
Message-ID: <20210405094854.GO2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-05 11:38 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:web2py:web2py is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aweb2py%3Aweb2py
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-web2py/python-web2py.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
> index 07251ba53c..26214a8110 100644
> --- a/package/python-web2py/python-web2py.mk
> +++ b/package/python-web2py/python-web2py.mk
> @@ -8,6 +8,8 @@ PYTHON_WEB2PY_VERSION = 2.20.4
>  PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
>  PYTHON_WEB2PY_LICENSE = LGPL-3.0
>  PYTHON_WEB2PY_LICENSE_FILES = LICENSE
> +PYTHON_WEB2PY_CPE_ID_VENDOR = web2py
> +PYTHON_WEB2PY_CPE_ID_PRODUCT = web2py
>  PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
>  	host-python-pydal host-python-yatl
>  
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
