From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 21:40:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-py: bump to version 1.9.0
In-Reply-To: <20200629172711.127573-2-asafka7@gmail.com>
References: <20200629172711.127573-1-asafka7@gmail.com>
 <20200629172711.127573-2-asafka7@gmail.com>
Message-ID: <20200629194001.GG20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2020-06-29 20:27 +0300, Asaf Kahlon spake thusly:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-py/python-py.hash | 4 ++--
>  package/python-py/python-py.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-py/python-py.hash b/package/python-py/python-py.hash
> index 150428b606..98e16fd97b 100644
> --- a/package/python-py/python-py.hash
> +++ b/package/python-py/python-py.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/py/json
> -md5  42c67de84b07ac9cc867b8b70843a45b  py-1.8.1.tar.gz
> -sha256  5e27081401262157467ad6e7f851b7aa402c5852dbcb3dae06768434de5752aa  py-1.8.1.tar.gz
> +md5  b80db4e61eef724f49feb4d20b649e62  py-1.9.0.tar.gz
> +sha256  9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342  py-1.9.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
> diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
> index 42171a6785..c753183933 100644
> --- a/package/python-py/python-py.mk
> +++ b/package/python-py/python-py.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PY_VERSION = 1.8.1
> +PYTHON_PY_VERSION = 1.9.0
>  PYTHON_PY_SOURCE = py-$(PYTHON_PY_VERSION).tar.gz
> -PYTHON_PY_SITE = https://files.pythonhosted.org/packages/bd/8f/169d08dcac7d6e311333c96b63cbe92e7947778475e1a619b674989ba1ed
> +PYTHON_PY_SITE = https://files.pythonhosted.org/packages/97/a6/ab9183fe08f69a53d06ac0ee8432bc0ffbb3989c575cc69b73a0229a9a99
>  PYTHON_PY_DEPENDENCIES = host-python-setuptools-scm
>  PYTHON_PY_SETUP_TYPE = setuptools
>  PYTHON_PY_LICENSE = MIT
> -- 
> 2.26.2
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
