From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jul 2020 21:11:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.8.4
In-Reply-To: <20200720171241.882043-1-aduskett@gmail.com>
References: <20200720171241.882043-1-aduskett@gmail.com>
Message-ID: <20200720191103.GA2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-07-20 10:12 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index fc34e8aa59..2ca3f5a335 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,5 @@
> -# From https://www.python.org/downloads/release/python-383/
> -md5  3000cf50aaa413052aef82fd2122ca78  Python-3.8.3.tar.xz
> +# From https://www.python.org/downloads/release/python-384/
> +md5  e16df33cd7b58702e57e137f8f5d13e7  Python-3.8.4.tar.xz
>  # Locally computed
> -sha256  dfab5ec723c218082fe3d5d7ae17ecbdebffa9a1aea4d64aa3a2ecdd2e795864  Python-3.8.3.tar.xz
> +sha256  5f41968a95afe9bc12192d7e6861aab31e80a46c46fa59d3d837def6a4cd4d37  Python-3.8.4.tar.xz
>  sha256  de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 4e43027cff..b79d320cbf 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.8
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
> -- 
> 2.26.2
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
