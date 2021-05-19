From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 12:50:25 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: bump version to 2021.03.0
In-Reply-To: <20210510092853.1481441-1-m.niestroj@grinn-global.com>
References: <20210510092853.1481441-1-m.niestroj@grinn-global.com>
Message-ID: <20210519105025.GR2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin, All,

On 2021-05-10 11:28 +0200, Marcin Niestroj spake thusly:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dt-utils/dt-utils.hash | 2 +-
>  package/dt-utils/dt-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
> index e42e82578d..74819158bb 100644
> --- a/package/dt-utils/dt-utils.hash
> +++ b/package/dt-utils/dt-utils.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  737313719d7c04d7b9576fdc572d838c81ea22ea41a44c7646467018e67a0b97  dt-utils-v2019.01.0-br1.tar.gz
> +sha256  8b29d3a8799170afdb1b077e655528bf4e6afe0c789107b1eec8fff9d4482771  dt-utils-v2021.03.0-br1.tar.gz
>  sha256  a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
> diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
> index 25c287d434..bc7fd90631 100644
> --- a/package/dt-utils/dt-utils.mk
> +++ b/package/dt-utils/dt-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DT_UTILS_VERSION = v2019.01.0
> +DT_UTILS_VERSION = v2021.03.0
>  DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
>  DT_UTILS_SITE_METHOD = git
>  DT_UTILS_LICENSE = GPL-2.0
> -- 
> 2.31.1
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
