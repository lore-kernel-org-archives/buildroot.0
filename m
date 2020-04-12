From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2020 10:46:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/mc: bump version to 4.8.24
In-Reply-To: <20200412082959.853319-1-bernd.kuhls@t-online.de>
References: <20200412082959.853319-1-bernd.kuhls@t-online.de>
Message-ID: <20200412084656.GR29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-04-12 10:29 +0200, Bernd Kuhls spake thusly:
> Changelog: https://midnight-commander.org/wiki/NEWS-4.8.24
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Both patches applied. However, I first applied the gpm dependency
because that hidden dependency already exists wuth 4.8.23. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/mc/mc.hash | 4 ++--
>  package/mc/mc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mc/mc.hash b/package/mc/mc.hash
> index 963b2ad2f9..50da2a070b 100644
> --- a/package/mc/mc.hash
> +++ b/package/mc/mc.hash
> @@ -1,4 +1,4 @@
> -# Hash from http://ftp.midnight-commander.org/mc-4.8.23.sha256:
> -sha256 dd7f7ce74183307b0df25b5c3e60ad3293fd3d3d27d2f37dd7a10efce13dff1c  mc-4.8.23.tar.xz
> +# Hash from http://ftp.midnight-commander.org/mc-4.8.24.sha256
> +sha256 859f1cc070450bf6eb4d319ffcb6a5ac29deb0ac0d81559fb2e71242b1176d46  mc-4.8.24.tar.xz
>  # sha256 locally computed:
>  sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
> diff --git a/package/mc/mc.mk b/package/mc/mc.mk
> index 24f6ac36ac..ca93da1756 100644
> --- a/package/mc/mc.mk
> +++ b/package/mc/mc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MC_VERSION = 4.8.23
> +MC_VERSION = 4.8.24
>  MC_SOURCE = mc-$(MC_VERSION).tar.xz
>  MC_SITE = http://ftp.midnight-commander.org
>  MC_LICENSE = GPL-3.0+
> -- 
> 2.25.0
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
