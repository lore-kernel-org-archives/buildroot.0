From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 22:36:19 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/python-validators: fix
 license
In-Reply-To: <20200621194842.25539-1-peter@korsgaard.com>
References: <20200621194842.25539-1-peter@korsgaard.com>
Message-ID: <20200621203619.GI2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-06-21 21:48 +0200, Peter Korsgaard spake thusly:
> The LICENSE file is MIT, not BSD.  The confusion comes from the license info
> in setup.py, which stated BSD until (post-0.14.2):
> 
> https://github.com/kvesteri/validators/commit/669129a3d3eb106e1b2d82bd9911faebb3287db6
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

You can cherry-pick to the LTS and latest branches now. ;-)

Regards,
Yann E. MORIN.

> ---
>  package/python-validators/python-validators.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
> index e24ce35fdd..594c1d26e5 100644
> --- a/package/python-validators/python-validators.mk
> +++ b/package/python-validators/python-validators.mk
> @@ -8,7 +8,7 @@ PYTHON_VALIDATORS_VERSION = 0.14.2
>  PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
>  PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/4d/56/9b48c918ef118ea12b90f227c4498ed4703b418bdd8fb49479dfcbeae4ef
>  PYTHON_VALIDATORS_SETUP_TYPE = setuptools
> -PYTHON_VALIDATORS_LICENSE = BSD
> +PYTHON_VALIDATORS_LICENSE = MIT
>  PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
>  
>  $(eval $(python-package))
> -- 
> 2.20.1
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
