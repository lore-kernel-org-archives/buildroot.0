From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 4 Oct 2019 18:08:29 +0200
Subject: [Buildroot] [PATCH] libostree: bump to version 2019.3
In-Reply-To: <20190825065508.29260-1-marcus.folkesson@gmail.com>
References: <20190825065508.29260-1-marcus.folkesson@gmail.com>
Message-ID: <20191004160815.GA3160@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 25, 2019 at 08:55:08AM +0200, Marcus Folkesson wrote:

bump

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libostree/libostree.hash | 2 +-
>  package/libostree/libostree.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
> index ddd15b5099..b16ca8cf44 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 f263cfed75dcc9e312a874d28241e7143d8a0d8c774938f2165327bae67dbe06  libostree-2018.9.1.tar.xz
> +sha256 c09fe363bd2331b774050464547d4966bb32dabd3edfb03f0538c6c416f607e4  libostree-2019.3.tar.xz
>  sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index e8cdd64d6e..db8e72952a 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBOSTREE_VERSION_MAJOR = 2018.9
> -LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR).1
> +LIBOSTREE_VERSION_MAJOR = 2019.3
> +LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR)
>  LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
>  LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION_MAJOR)
>  
> -- 
> 2.23.0
> 
