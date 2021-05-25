From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 25 May 2021 10:59:15 +0200
Subject: [Buildroot] [PATCH] package/python-pysmb: bump to version 1.2.6
In-Reply-To: <20210429102918.14930-1-yegorslists@googlemail.com>
References: <20210429102918.14930-1-yegorslists@googlemail.com>
Message-ID: <CAGm1_kvzG9FuHr_mUpCaLkT_TBoXcVFYusXrkggt482GA-jkXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Apr 29, 2021 at 12:29 PM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Change download location to the project's page so that
> we still can get *.tar.gz file instead of *.zip.
>
> The LICENSE file has changed the copyright year from 2015
> to 2020.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---

ping.

Thanks.

Regards,
Yegor



>  package/python-pysmb/python-pysmb.hash | 6 ++----
>  package/python-pysmb/python-pysmb.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
> index 94ff33ea31..c2d7a49ceb 100644
> --- a/package/python-pysmb/python-pysmb.hash
> +++ b/package/python-pysmb/python-pysmb.hash
> @@ -1,5 +1,3 @@
> -# md5 from https://pypi.python.org/pypi/pysmb/json
> -md5 e6f9ce0032db528aae060f7019bd409c pysmb-1.1.19.tar.gz
>  # Locally computed
> -sha256  fa4e6b4a4f2afbfbd71e9179c491f8c77bc2ad19e0bc866d7c6cbfa9ae272602  pysmb-1.1.19.tar.gz
> -sha256  2b1a0a56543c1bda07f5583dddaf544442c139d3f46747d4700c7031ef354c14  LICENSE
> +sha256  f204c34a4b9a03e6959ba3b12c65b9d9111555944b1568d4fcc0e74998b528a3  pysmb-1.2.6.tar.gz
> +sha256  8c487d5c10f024e44a9cf1df21d1fd28a80bd2dfddd9f1dcd109a47d721f497f  LICENSE
> diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
> index 1b4c18797a..eb0ef5400f 100644
> --- a/package/python-pysmb/python-pysmb.mk
> +++ b/package/python-pysmb/python-pysmb.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_PYSMB_VERSION = 1.1.19
> +PYTHON_PYSMB_VERSION = 1.2.6
>  PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
> -PYTHON_PYSMB_SITE = https://pypi.python.org/packages/f9/e7/1fd7faaa946cc6b43ce85bb7a177b75a4718d9c5e291201fec00112b497c
> +PYTHON_PYSMB_SITE = https://miketeo.net/files/Projects/pysmb
>  PYTHON_PYSMB_LICENSE = Libpng
>  PYTHON_PYSMB_LICENSE_FILES = LICENSE
>  PYTHON_PYSMB_SETUP_TYPE = setuptools
> --
> 2.17.0
>
