From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Oct 2019 17:08:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-m2r: bump to version
 0.2.1
In-Reply-To: <20191004183132.15564-3-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
 <20191004183132.15564-3-asafka7@gmail.com>
Message-ID: <9ac9e6f7-ccce-f9c6-f19e-53ac65262242@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/10/2019 20:31, Asaf Kahlon wrote:
> Also add hash for license file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-m2r/python-m2r.hash | 9 +++++----
>  package/python-m2r/python-m2r.mk   | 4 ++--
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-m2r/python-m2r.hash b/package/python-m2r/python-m2r.hash
> index 50de2b4f17..3c22e9707a 100644
> --- a/package/python-m2r/python-m2r.hash
> +++ b/package/python-m2r/python-m2r.hash
> @@ -1,4 +1,5 @@
> -# md5 from https://pypi.python.org/pypi/m2r/json, sha256 locally computed
> -md5	906eb6dabb0295c93881f32d0a1c0919  m2r-0.1.12.tar.gz
> -sha256	adfb86ebb7ff3fcd3ebb27ce8cd6f795c409a13f0c03363e265f17419ce5b9ab  m2r-0.1.12.tar.gz
> -sha256  28728ec0ecbd8c171ebaeccebf69e3961282fd81f06abc7424c65546b6ae6f27  LICENSE

 The license file was already there, you just removed a space from it.

 Regards,
 Arnout

> +# md5, sha256 from https://pypi.org/pypi/m2r/json
> +md5	8bdb45c19e2b59bb5ffb9a0348e81ad8  m2r-0.2.1.tar.gz
> +sha256	bf90bad66cda1164b17e5ba4a037806d2443f2a4d5ddc9f6a5554a0322aaed99  m2r-0.2.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256	28728ec0ecbd8c171ebaeccebf69e3961282fd81f06abc7424c65546b6ae6f27  LICENSE
> diff --git a/package/python-m2r/python-m2r.mk b/package/python-m2r/python-m2r.mk
> index 7c8ed28800..47fb154c68 100644
> --- a/package/python-m2r/python-m2r.mk
> +++ b/package/python-m2r/python-m2r.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_M2R_VERSION = 0.1.12
> +PYTHON_M2R_VERSION = 0.2.1
>  PYTHON_M2R_SOURCE = m2r-$(PYTHON_M2R_VERSION).tar.gz
> -PYTHON_M2R_SITE = https://pypi.python.org/packages/a0/95/7273d54664e74c3100d07206fe6b30247be046b39676972fc90ae04376a1
> +PYTHON_M2R_SITE = https://files.pythonhosted.org/packages/39/e7/9fae11a45f5e1a3a21d8a98d02948e597c4afd7848a0dbe1a1ebd235f13e
>  PYTHON_M2R_SETUP_TYPE = setuptools
>  PYTHON_M2R_LICENSE = MIT
>  PYTHON_M2R_LICENSE_FILES = LICENSE
> 
