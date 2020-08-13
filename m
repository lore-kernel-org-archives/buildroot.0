From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Aug 2020 22:03:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-spidev: switch to
 setuptools
In-Reply-To: <20200813182141.3332301-1-fontaine.fabrice@gmail.com>
References: <20200813182141.3332301-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813200340.GI13263@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-08-13 20:21 +0200, Fabrice Fontaine spake thusly:
> spidev uses setuptools since version 3.5 and
> https://github.com/doceme/py-spidev/commit/3bb2f3b4061f62f283ec2a525e2de60d7f572b41
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/619b9e9844e33fa8e111d6db09eee8450fedb660
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-spidev/python-spidev.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
> index a3da332926..e1065610a7 100644
> --- a/package/python-spidev/python-spidev.mk
> +++ b/package/python-spidev/python-spidev.mk
> @@ -7,7 +7,7 @@
>  PYTHON_SPIDEV_VERSION = 3.5
>  PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
>  PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/62/56/de649e7d95f9fcfaf965a6eb937b4a46bc77ef21487c99cde1a7a0546040
> -PYTHON_SPIDEV_SETUP_TYPE = distutils
> +PYTHON_SPIDEV_SETUP_TYPE = setuptools
>  PYTHON_SPIDEV_LICENSE = MIT
>  PYTHON_SPIDEV_LICENSE_FILES = README.md
>  
> -- 
> 2.27.0
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
