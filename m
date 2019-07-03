From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:51:06 +0200
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 2.1.10
In-Reply-To: <20190703181508.18600-1-peter@korsgaard.com>
References: <20190703181508.18600-1-peter@korsgaard.com>
Message-ID: <cc6e2a9e-8f11-5201-ce6d-07293b83c793@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/07/2019 20:15, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> CVE-2019-12781: Incorrect HTTP detection with reverse-proxy connecting via
> HTTPS
> 
> For more details, see the announcement:
> https://www.djangoproject.com/weblog/2019/jul/01/security-releases/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index c325116779..8cb60adf0c 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5	909c2e7761893a922dcf721521d9239e  Django-2.1.9.tar.gz
> -sha256	5052def4ff0a84bdf669827fdbd7b7cc1ac058f10232be6b21f37c6824f578da  Django-2.1.9.tar.gz
> +md5	2162aed4111da837433f41a9eed5c8bd  Django-2.1.10.tar.gz
> +sha256	65e2a548a52fca560cdd4e35f4fa1a79140f405af48950e59702a37e4227e958  Django-2.1.10.tar.gz
>  # Locally computed sha256 checksums
>  sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 041822ea13..09c178288c 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 2.1.9
> +PYTHON_DJANGO_VERSION = 2.1.10
>  PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c1/b3/3cdc60dc2e3c11236539f9470e42c5075a2e9c9f4885f5b4b912e9f19992
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/be/1b/009ec818adf51c7641f3bd9dae778e8b28291b3ceedb352317b0eeafd7ff
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE
>  PYTHON_DJANGO_SETUP_TYPE = setuptools
> 
