From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 7 Nov 2018 09:36:53 +0100
Subject: [Buildroot] [PATCH 1/1] python-crossbar: bump to version 18.11.1
In-Reply-To: <20181106200615.27766-1-asafka7@gmail.com>
References: <20181106200615.27766-1-asafka7@gmail.com>
Message-ID: <CAGm1_ks4YhyuGUzY7DxX8d3ueOYtdqSJPpmZRtSZdhNcSshH=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 6, 2018 at 9:06 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Adjust patch to fit the new version.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  .../0002-Remove-idna-requirement.patch              | 13 ++++++++-----
>  package/python-crossbar/python-crossbar.hash        |  4 ++--
>  package/python-crossbar/python-crossbar.mk          |  4 ++--
>  3 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/package/python-crossbar/0002-Remove-idna-requirement.patch b/package/python-crossbar/0002-Remove-idna-requirement.patch
> index b4bbe3b5a5..4948b91b05 100644
> --- a/package/python-crossbar/0002-Remove-idna-requirement.patch
> +++ b/package/python-crossbar/0002-Remove-idna-requirement.patch
> @@ -13,14 +13,17 @@ Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/requirements-min.txt b/requirements-min.txt
> -index d7c2a562..84bf1878 100644
> +index 92fb0f8f..13cdac87 100644
>  --- a/requirements-min.txt
>  +++ b/requirements-min.txt
> -@@ -1,4 +1,3 @@
> +@@ -6,7 +6,6 @@ click>=6.7
> + constantly>=15.1.0
> + cryptography>=1.9
> + h2>=3.0,<4.0
>  -idna<2.6,>=2.5
> - click>=6.7
> - setuptools>=36.0.1
> - zope.interface>=4.4.2
> + incremental>=17.5.0
> + jinja2>=2.9.6
> + lmdb>=0.92
>  --
>  2.17.1
>
> diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
> index a9c40c91e6..aee07a7382 100644
> --- a/package/python-crossbar/python-crossbar.hash
> +++ b/package/python-crossbar/python-crossbar.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/crossbar/json
> -md5    6c684c9613091d7ba8adadb6bff5c1cd  crossbar-18.9.2.tar.gz
> -sha256 8486f2daa73c45475633baa9d21dcaf74d635781939df6ab6748cc2958aa9d75  crossbar-18.9.2.tar.gz
> +md5    e3f0c51c6c496a3d7f1c62d7f64f23db  crossbar-18.11.1.tar.gz
> +sha256 ab24031f40077ee283469aab5f270bdc223b29b1e6f45d69cf38bf4cad80df2a  crossbar-18.11.1.tar.gz
>  # Locally computed
>  sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  LICENSE
> diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
> index ee7d2a6a32..de5dcea931 100644
> --- a/package/python-crossbar/python-crossbar.mk
> +++ b/package/python-crossbar/python-crossbar.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_CROSSBAR_VERSION = 18.9.2
> +PYTHON_CROSSBAR_VERSION = 18.11.1
>  PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
> -PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/1c/71/27e6b5ba1e557d28d155badee90022f73f4216b752d063221edbe2b188f0
> +PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/99/02/7f7f7dee3e8787e44d9452cc1d712183e5903d8a76455693b15a900385eb
>  PYTHON_CROSSBAR_LICENSE = AGPL-3.0
>  PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
>  PYTHON_CROSSBAR_SETUP_TYPE = setuptools
> --
> 2.19.1
>
