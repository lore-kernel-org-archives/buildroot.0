From: Joris OFFOUGA <offougajoris@gmail.com>
Date: Mon, 5 Apr 2021 22:41:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-colorlog: bump to
 version 4.8.0
In-Reply-To: <20210405203631.791084-1-fontaine.fabrice@gmail.com>
References: <20210405203631.791084-1-fontaine.fabrice@gmail.com>
Message-ID: <CACr73kDEmX+PrAArSmZuf=2=HPgV7hyZqO4+4-OpZDag3A6O7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Thanks for update.

Acked-by Joris Offouga <offougajoris@gmail.com>

Best regards,

Le lun. 5 avr. 2021 ? 22:36, Fabrice Fontaine <fontaine.fabrice@gmail.com>
a ?crit :

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-colorlog/python-colorlog.hash | 4 ++--
>  package/python-colorlog/python-colorlog.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-colorlog/python-colorlog.hash
> b/package/python-colorlog/python-colorlog.hash
> index 4613cf0d3c..7c6fb73be7 100644
> --- a/package/python-colorlog/python-colorlog.hash
> +++ b/package/python-colorlog/python-colorlog.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/colorlog/json
> -md5  28500337c5bffc2a90dd19551479c992  colorlog-4.7.2.tar.gz
> -sha256  18d05b616438a75762d7d214b9ec3b05d274466c9f3ddd92807e755840c88251
> colorlog-4.7.2.tar.gz
> +md5  2111508f7c512976a34b107c17586f79  colorlog-4.8.0.tar.gz
> +sha256  59b53160c60902c405cdec28d38356e09d40686659048893e026ecbd589516b1
> colorlog-4.8.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  915d2c0c578d5015fb561f69ce2970a0d0ed566f0b99bdb6a4ebb439e9c81b0d
> LICENSE
> diff --git a/package/python-colorlog/python-colorlog.mk
> b/package/python-colorlog/python-colorlog.mk
> index ba1ef7247b..eb4074d464 100644
> --- a/package/python-colorlog/python-colorlog.mk
> +++ b/package/python-colorlog/python-colorlog.mk
> @@ -4,9 +4,9 @@
>  #
>
>  ################################################################################
>
> -PYTHON_COLORLOG_VERSION = 4.7.2
> +PYTHON_COLORLOG_VERSION = 4.8.0
>  PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
> -PYTHON_COLORLOG_SITE =
> https://files.pythonhosted.org/packages/b2/d8/7bd0e6aa6b7dc93611f90a847eefcd048d3cae66dc8867c72486362bdfbd
> +PYTHON_COLORLOG_SITE =
> https://files.pythonhosted.org/packages/75/32/cdfba08674d72fe7895a8ec7be8f171e8502274999cae9497e4545404873
>  PYTHON_COLORLOG_SETUP_TYPE = setuptools
>  PYTHON_COLORLOG_LICENSE = MIT
>  PYTHON_COLORLOG_LICENSE_FILES = LICENSE
> --
> 2.30.2
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210405/fce8f6ea/attachment.html>
