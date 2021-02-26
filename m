From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Feb 2021 23:53:04 +0100
Subject: [Buildroot] [PATCH] package/tar: bump version to 1.34
In-Reply-To: <20210217215738.1759972-1-mmayer@broadcom.com>
References: <20210217215738.1759972-1-mmayer@broadcom.com>
Message-ID: <20210226225304.GD2390841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2021-02-17 13:57 -0800, Markus Mayer via buildroot spake thusly:
> Bump the version of tar to 1.34 for host and target.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tar/tar.hash | 4 ++--
>  package/tar/tar.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tar/tar.hash b/package/tar/tar.hash
> index 72f0cd6fcbe6..1914a9f3b483 100644
> --- a/package/tar/tar.hash
> +++ b/package/tar/tar.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking signature
> -sha256  d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8  tar-1.32.tar.xz
> -sha256  9fbfba0cba05233421dd619b8825e1ceb7c144e433c15ae48b68f17ede8d404a  tar-1.32.cpio.gz
> +sha256  63bebd26879c5e1eea4352f0d03c991f966aeb3ddeb3c7445c902568d5411d28  tar-1.34.tar.xz
> +sha256  51337b19c71df92cd4f51c50efe4dc6ddc267d31fd54679be9e9bc2e6ce8132b  tar-1.34.cpio.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index 2da731f80ad9..690a5952ba02 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TAR_VERSION = 1.32
> +TAR_VERSION = 1.34
>  TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
>  TAR_SITE = $(BR2_GNU_MIRROR)/tar
>  # busybox installs in /bin, so we need tar to install as well in /bin
> -- 
> 2.25.1
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
