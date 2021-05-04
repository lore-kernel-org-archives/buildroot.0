From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 22:07:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: bump version to 3.10.3
In-Reply-To: <20210503022955.160567-1-christian@paral.in>
References: <20210503022955.160567-1-christian@paral.in>
Message-ID: <20210504200758.GO2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2021-05-02 19:29 -0700, Christian Stewart spake thusly:
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfuse3/libfuse3.hash | 2 +-
>  package/libfuse3/libfuse3.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
> index 9b2f8cc144..49c71f402f 100644
> --- a/package/libfuse3/libfuse3.hash
> +++ b/package/libfuse3/libfuse3.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated sha256 checksums
> -sha256  a16f93cc083264afd0d2958a0dc88f24c6c5d40a9f3842c645b1909e13edb75f  libfuse3-3.10.2.tar.gz
> +sha256  c32527782cef620df58b162aa29901d1fb13253b029375d5860a2253a810344e  libfuse3-3.10.3.tar.gz
>  sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> index f805eda506..d61e313391 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFUSE3_VERSION = 3.10.2
> +LIBFUSE3_VERSION = 3.10.3
>  LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
>  LIBFUSE3_LICENSE = LGPL-2.1
>  LIBFUSE3_LICENSE_FILES = LICENSE
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
