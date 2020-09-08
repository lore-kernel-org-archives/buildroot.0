From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 22:23:53 +0200
Subject: [Buildroot] [PATCH] package/iptables: bump to version 1.8.5
In-Reply-To: <20200908184116.1750845-1-francois.perrad@gadz.org>
References: <20200908184116.1750845-1-francois.perrad@gadz.org>
Message-ID: <20200908202353.GX14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2020-09-08 20:41 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/iptables/iptables.hash | 2 +-
>  package/iptables/iptables.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
> index 2811daf5e..725770543 100644
> --- a/package/iptables/iptables.hash
> +++ b/package/iptables/iptables.hash
> @@ -1,4 +1,4 @@
>  # From https://netfilter.org/projects/iptables/downloads.html
> -sha256  993a3a5490a544c2cbf2ef15cf7e7ed21af1845baf228318d5c36ef8827e157c  iptables-1.8.4.tar.bz2
> +sha256  d457d74512e63aa3f50336e0597d4023c0e3c6845594d38532efb6ebcb294309  iptables-1.8.5.tar.bz2
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
> index 4dc7a174a..442639f15 100644
> --- a/package/iptables/iptables.mk
> +++ b/package/iptables/iptables.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IPTABLES_VERSION = 1.8.4
> +IPTABLES_VERSION = 1.8.5
>  IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
>  IPTABLES_SITE = https://netfilter.org/projects/iptables/files
>  IPTABLES_INSTALL_STAGING = YES
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
