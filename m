From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 14 Oct 2019 13:00:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/haveged: bump to version 1.9.8
In-Reply-To: <20191014101730.103256-1-james.hilliard1@gmail.com>
References: <20191014101730.103256-1-james.hilliard1@gmail.com>
Message-ID: <a176e94f-f2f2-73e4-67a4-3a14cb665f61@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

Le 14/10/2019 ? 12:17, James Hilliard a ?crit?:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Acked-by: Pierre-Jean Texier <pjtexier@koncepto.io>

> ---
>   package/haveged/haveged.hash | 2 +-
>   package/haveged/haveged.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
> index fc7858787d..2bb1fdd846 100644
> --- a/package/haveged/haveged.hash
> +++ b/package/haveged/haveged.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  4d4c046755476d3734ffb78772c242c25913ff0eb7509c143671dae6ec9d1189	haveged-1.9.6.tar.gz
> +sha256  99aa1996c6e39ea2459cfc37addfb8b1eecc63f3a2b6da9db17b22e76b6851ae	haveged-1.9.8.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
> diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
> index afb54df1ad..05b59a1685 100644
> --- a/package/haveged/haveged.mk
> +++ b/package/haveged/haveged.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HAVEGED_VERSION = 1.9.6
> +HAVEGED_VERSION = 1.9.8
>   HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
>   HAVEGED_LICENSE = GPL-3.0+
>   HAVEGED_LICENSE_FILES = COPYING
> 

Thanks !

-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
