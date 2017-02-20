From: Lionel Flandrin <lionel@svkt.org>
Date: Mon, 20 Feb 2017 12:49:05 +0100
Subject: [Buildroot] [PATCH 55/58] python-werkzeug: bump to version
 0.11.15
In-Reply-To: <20170219191255.1503-56-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219191255.1503-56-Adamduskett@outlook.com>
Message-ID: <20170220114905.n3c4dyllqc2msfye@ed>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 19, 2017 at 02:12:52PM -0500, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

Tested-by: Lionel Flandrin <lionel@svkt.org>

Tested with python 3 on ARM

> ---
>  package/python-werkzeug/python-werkzeug.hash | 4 ++--
>  package/python-werkzeug/python-werkzeug.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
> index 3f23352..a1c44f4 100644
> --- a/package/python-werkzeug/python-werkzeug.hash
> +++ b/package/python-werkzeug/python-werkzeug.hash
> @@ -1,3 +1,3 @@
>  # md5 from https://pypi.python.org/pypi/werkzeug/json, sha256 locally computed
> -md5	1d34afa1f19abcef4c0da51ebc2c4ea7  Werkzeug-0.11.11.tar.gz
> -sha256	e72c46bc14405cba7a26bd2ce28df734471bc9016bc8b4cb69466c2c14c2f7e5  Werkzeug-0.11.11.tar.gz
> +md5 cb4010478dd33905f95920e4880204a2 Werkzeug-0.11.15.tar.gz
> +sha256 455d7798ac263266dbd38d4841f7534dd35ca9c3da4a8df303f8488f38f3bcc0 Werkzeug-0.11.15.tar.gz
> diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
> index 072937f..b4dc3cd 100644
> --- a/package/python-werkzeug/python-werkzeug.mk
> +++ b/package/python-werkzeug/python-werkzeug.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_WERKZEUG_VERSION = 0.11.11
> +PYTHON_WERKZEUG_VERSION = 0.11.15
>  PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
> -PYTHON_WERKZEUG_SITE = https://pypi.python.org/packages/43/2e/d822b4a4216804519ace92e0368dcfc4b0b2887462d852fdd476b253ecc9
> +PYTHON_WERKZEUG_SITE = https://pypi.python.org/packages/fe/7f/6d70f765ce5484e07576313897793cb49333dd34e462488ee818d17244af
>  PYTHON_WERKZEUG_SETUP_TYPE = setuptools
>  PYTHON_WERKZEUG_LICENSE = BSD-3c
>  PYTHON_WERKZEUG_LICENSE_FILES = LICENSE
> -- 
> 2.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Lionel Flandrin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170220/01122b93/attachment.asc>
