From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 19 Feb 2017 20:31:37 +0100
Subject: [Buildroot] [PATCH 08/58] python-crossbar: bump to version
	16.10.1
In-Reply-To: <20170219191255.1503-9-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219191255.1503-9-Adamduskett@outlook.com>
Message-ID: <CAGm1_ktu7k0ifVkzMAGPjJCzpxN5uEfgoZHvhEx2Pod6fv4=gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Sun, Feb 19, 2017 at 8:12 PM, Adam Duskett <aduskett@gmail.com> wrote:
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

This package changes its dependencies very often, so it is very
important to run it before bumping. I'm already working to bump it and
there are some obstacles, that I have to fix.

Regards,
Yegor

> ---
>  package/python-crossbar/python-crossbar.hash | 6 +++---
>  package/python-crossbar/python-crossbar.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
> index a500bcf..13e9e25 100644
> --- a/package/python-crossbar/python-crossbar.hash
> +++ b/package/python-crossbar/python-crossbar.hash
> @@ -1,3 +1,3 @@
> -# md5 from https://pypi.python.org/pypi/crossbar/json, sha256 locally computed.
> -md5    516478cc368503a0a0babc1dc28c5085  crossbar-0.14.0.tar.gz
> -sha256 6242ef34c56061850743d750d042993590ca7ec8ebe7b28c21ed05bb0904d71b  crossbar-0.14.0.tar.gz
> +# md5 from https://pypi.python.org/pypi/crossbar/json, sha256 locally computed
> +md5 0ab714a502566c18f2f0dd896df87d80 crossbar-16.10.1.tar.gz
> +sha256 b7984066c8e3437a3ba7c3373d16294b07a9f9332b051269a106a39cdaff2031 crossbar-16.10.1.tar.gz
> diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
> index 3d82d77..5b4fb0c 100644
> --- a/package/python-crossbar/python-crossbar.mk
> +++ b/package/python-crossbar/python-crossbar.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_CROSSBAR_VERSION = 0.14.0
> +PYTHON_CROSSBAR_VERSION = 16.10.1
>  PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
> -PYTHON_CROSSBAR_SITE = https://pypi.python.org/packages/f0/9a/e0b77e15698c47b6293655bc0e1996dd8e87bd8af7bc7434a5c8281a024e
> +PYTHON_CROSSBAR_SITE = https://pypi.python.org/packages/6e/81/60eb1dd623219fc211eeea985773b305535daeaad78efdc00448a075ae13
>  PYTHON_CROSSBAR_LICENSE = AGPLv3
>  PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
>  PYTHON_CROSSBAR_SETUP_TYPE = setuptools
> --
> 2.9.3
>
