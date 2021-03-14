From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 13:51:33 +0100
Subject: [Buildroot] [PATCH] package/python-rpi-ws281x: bump to version
 4.2.6
In-Reply-To: <20210310225813.374664-1-grzegorz@blach.pl>
References: <20210310225813.374664-1-grzegorz@blach.pl>
Message-ID: <20210314125133.GX2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grzegorz, All,

On 2021-03-10 23:58 +0100, Grzegorz Blach spake thusly:
> Set proper license.

I've split this commit in two:

  - one to fix the license, so it can easily be backported to the
    2021.02 LTS branch

  - one to do the actual bump.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
> Changes v1 -> v2:
>   - bump to version 4.2.6
> ---
>  package/python-rpi-ws281x/python-rpi-ws281x.hash | 4 ++--
>  package/python-rpi-ws281x/python-rpi-ws281x.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
> index 54d91a6df0..cb021a821d 100644
> --- a/package/python-rpi-ws281x/python-rpi-ws281x.hash
> +++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/rpi-ws281x/json
> -md5  8eb175e05905ee7a00bb5fd2f1b15e40  rpi_ws281x-4.2.4.tar.gz
> -sha256  7175e708d6085bc02a9d0b8227797d697e34fd00787030ae5f119fe2f4f90889  rpi_ws281x-4.2.4.tar.gz
> +md5  5da00a092ac3755c4913f5a53451744b  rpi_ws281x-4.2.6.tar.gz
> +sha256  65a9918fbdd9df1ac612ccc1a385d4a550f1bc74cc6bbf6b9035ad26dc41b3ce  rpi_ws281x-4.2.6.tar.gz
>  # Locally computed sha256 checksums
>  sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
>  sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
> diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
> index 4af1d268af..b8ba119919 100644
> --- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
> +++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -PYTHON_RPI_WS281X_VERSION = 4.2.4
> +PYTHON_RPI_WS281X_VERSION = 4.2.6
>  PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
> -PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/3b/99/0f74f2d303e03432d10b11dab240cb15afad1bc6ab9a1449c9bc08af2ee4
> +PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/7f/1e/ea9ff56d9823fc55c79748630ffe0ceb30f619c9218743050bbf96d08704
>  PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
> -PYTHON_RPI_WS281X_LICENSE = MIT
> +PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
>  PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
>  
>  $(eval $(python-package))
> -- 
> 2.27.0
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
