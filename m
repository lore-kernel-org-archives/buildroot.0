From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 18:58:23 +0200
Subject: [Buildroot] [PATCH] package/wireguard-linux-compat: bump
 version to 1.0.20200623
In-Reply-To: <20200624064144.27566-1-peter@korsgaard.com>
References: <20200624064144.27566-1-peter@korsgaard.com>
Message-ID: <20200624165823.GB20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-06-24 08:41 +0200, Peter Korsgaard spake thusly:
> Includes a number of bugfixes and updates to build against newer stable
> kernels.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
>  package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
> index 54af5af956..ac160cdf9d 100644
> --- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
> +++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
> @@ -1,4 +1,4 @@
> -# https://lists.zx2c4.com/pipermail/wireguard/2020-May/005408.html
> -sha256  98a99f2b825a82d57a7213e666f1ee4f7cc02bddb09bf4908b4b09447a8f121e  wireguard-linux-compat-1.0.20200506.tar.xz
> +# https://lists.zx2c4.com/pipermail/wireguard/2020-June/005597.html
> +sha256  130937724515799edf05ff8216bc837df8acda879428f3a7f96a3287758f9445  wireguard-linux-compat-1.0.20200623.tar.xz
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
> index f1b117d258..5e8636072c 100644
> --- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
> +++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200506
> +WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200623
>  WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
>  WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
>  WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
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
