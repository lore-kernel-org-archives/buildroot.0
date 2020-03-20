From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 21:45:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/x265: bump version to 3.3
In-Reply-To: <20200318213333.313708-1-bernd.kuhls@t-online.de>
References: <20200318213333.313708-1-bernd.kuhls@t-online.de>
Message-ID: <20200320204542.GQ10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-03-18 22:33 +0100, Bernd Kuhls spake thusly:
> Release notes:
> https://mailman.videolan.org/pipermail/x265-devel/2020-February/012880.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/x265/x265.hash | 6 +++---
>  package/x265/x265.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x265/x265.hash b/package/x265/x265.hash
> index 4e9524d134..bd9a173a3a 100644
> --- a/package/x265/x265.hash
> +++ b/package/x265/x265.hash
> @@ -1,5 +1,5 @@
> -# From https://mailman.videolan.org/pipermail/x265-devel/2019-October/012721.html
> -md5 94808045a34d88a857e5eaf3f68f4bca  x265_3.2.1.tar.gz
> +# From https://mailman.videolan.org/pipermail/x265-devel/2020-February/012880.html
> +md5 0c8c747b59b5411dea8cf557554636c1  x265_3.3.tar.gz
>  # Locally generated
> -sha256 fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc  x265_3.2.1.tar.gz
> +sha256 f26e148ed1f4dfb33fd1eb3ff5e60e08078d1b2017e88bcbb045b3fb58300b9c  x265_3.3.tar.gz
>  sha256 d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
> diff --git a/package/x265/x265.mk b/package/x265/x265.mk
> index 5082d0ca27..ae9e0acb64 100644
> --- a/package/x265/x265.mk
> +++ b/package/x265/x265.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -X265_VERSION = 3.2.1
> +X265_VERSION = 3.3
>  X265_SOURCE = x265_$(X265_VERSION).tar.gz
>  X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
>  X265_LICENSE = GPL-2.0+
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
