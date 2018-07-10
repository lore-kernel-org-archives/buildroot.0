From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jul 2018 00:14:23 +0200
Subject: [Buildroot] [PATCH 1/1] python-django: bump to version 1.11.14
In-Reply-To: <20180704225734.18136-1-joseph.kogut@gmail.com>
References: <20180704225734.18136-1-joseph.kogut@gmail.com>
Message-ID: <fef2a622-c3c8-bef5-763c-82da419a4750@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-18 00:57, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/python-django/python-django.hash | 6 ++++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 09be18440b..f846658909 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,3 +1,5 @@
>  # md5 from https://pypi.python.org/pypi/django/json, sha256 locally computed

 Actually, https://www.djangoproject.com/m/pgp/Django-1.11.14.checksum.txt has
much better hashes. It also has all of them. They're actually the same :-)

> -md5	693dfeabad62c561cb205900d32c2a98  Django-1.10.7.tar.gz
> -sha256	593d779dbc2350a245c4f76d26bdcad58a39895e87304fe6d725bbdf84b5b0b8  Django-1.10.7.tar.gz
> +md5	38e82b59a1c27bbf98ccf0564ead7426  Django-1.11.14.tar.gz
> +sha256  eb9271f0874f53106a2719c0c35ce67631f6cc27cf81a60c6f8c9817b35a3f6e  Django-1.11.14.tar.gz
> +# sha256 locally computed
> +sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 9056f00cf0..b39e82e737 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 1.10.7
> +PYTHON_DJANGO_VERSION = 1.11.14
>  PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL

 Note sure what is wrong with

PYTHON_DJANGO_SITE =
https://www.djangoproject.com/m/releases/$(PYTHON_DJANGO_VERSION_MAJOR)

 Regards,
 Arnout

> -PYTHON_DJANGO_SITE = https://pypi.python.org/packages/15/b4/d4bb7313e02386bd23a60e1eb5670321313fb67289c6f36ec43bce747aff
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/dc/35/273514b5eb2201d5183dd138c240b12e1d822d2358b1e9436545b66d2d76
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE
>  PYTHON_DJANGO_SETUP_TYPE = setuptools
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
