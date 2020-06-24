From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 18:59:50 +0200
Subject: [Buildroot] [PATCH] package/wireguard-tools: bump version to
 1.0.20200513
In-Reply-To: <20200624055525.13352-1-peter@korsgaard.com>
References: <20200624055525.13352-1-peter@korsgaard.com>
Message-ID: <20200624165950.GC20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-06-24 07:55 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

I wonder on much hand-in-hand tools and linux-compat need to be in sync,
though.... Probably not much, I guess, as tools are also supposed to
work on a wide range of kernels, now that wireguard has been upstreamed,
right?

Regards,
Yann E. MORIN.

> ---
>  package/wireguard-tools/wireguard-tools.hash | 4 ++--
>  package/wireguard-tools/wireguard-tools.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
> index 475a7450a9..96134074f3 100644
> --- a/package/wireguard-tools/wireguard-tools.hash
> +++ b/package/wireguard-tools/wireguard-tools.hash
> @@ -1,4 +1,4 @@
> -# https://lists.zx2c4.com/pipermail/wireguard/2020-March/005191.html
> -sha256  757ed31d4d48d5fd7853bfd9bfa6a3a1b53c24a94fe617439948784a2c0ed987  wireguard-tools-1.0.20200319.tar.xz
> +# https://lists.zx2c4.com/pipermail/wireguard/2020-May/005431.html
> +sha256  e73409a9fb8c90506db241d1e1a4e7372a60dbfa400e37f4ab2fd70a92ba495f  wireguard-tools-1.0.20200513.tar.xz
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
> index fc2ec876b3..c4890f9337 100644
> --- a/package/wireguard-tools/wireguard-tools.mk
> +++ b/package/wireguard-tools/wireguard-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIREGUARD_TOOLS_VERSION = 1.0.20200319
> +WIREGUARD_TOOLS_VERSION = 1.0.20200513
>  WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
>  WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
>  WIREGUARD_TOOLS_LICENSE = GPL-2.0
> -- 
> 2.20.1
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
