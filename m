From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 18:07:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/faad2: bump version to 2.9.2
In-Reply-To: <20200613154121.2483961-1-bernd.kuhls@t-online.de>
References: <20200613154121.2483961-1-bernd.kuhls@t-online.de>
Message-ID: <20200614160744.GY2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-13 17:41 +0200, Bernd Kuhls spake thusly:
> Changelog: https://github.com/knik0/faad2/blob/master/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/faad2/faad2.hash | 2 +-
>  package/faad2/faad2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
> index 1a03bc9b7b..e9aa78051f 100644
> --- a/package/faad2/faad2.hash
> +++ b/package/faad2/faad2.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  7fa33cff76abdda5a220ca5de0b2e05a77354f3b97f735193c2940224898aa9a  faad2-2.9.1.tar.gz
> +sha256  9728b2b94f94ab49363cd229e7377fbe6ef3c311c5cd80da662d53ddb0ee091d  faad2-2.9.2.tar.gz
>  sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
> diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
> index 9ec9d8f52c..69c44461f2 100644
> --- a/package/faad2/faad2.mk
> +++ b/package/faad2/faad2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FAAD2_VERSION = 2.9.1
> +FAAD2_VERSION = 2.9.2
>  FAAD2_SITE = $(call github,knik0,faad2,$(subst .,_,$(FAAD2_VERSION)))
>  FAAD2_LICENSE = GPL-2.0
>  FAAD2_LICENSE_FILES = COPYING
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
