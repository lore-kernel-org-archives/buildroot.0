From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jun 2021 14:40:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/fuse-overlayfs: bump to version
 1.5.0
In-Reply-To: <20210607060158.1471289-1-christian@paral.in>
References: <20210607060158.1471289-1-christian@paral.in>
Message-ID: <9f472621-ed5c-d5ee-bc51-f004a6c67298@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/06/2021 08:01, Christian Stewart wrote:
> Signed-off-by: Christian Stewart <christian@paral.in>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
>  package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
> index 9770ee0d3f..f9473c154a 100644
> --- a/package/fuse-overlayfs/fuse-overlayfs.hash
> +++ b/package/fuse-overlayfs/fuse-overlayfs.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  7e5666aef4f2047e6a5202d6438b08c2d314dba5b40e431014e7dbb8168d9018  fuse-overlayfs-1.4.0.tar.gz
> +sha256  6c81b65b71067b303aaa9871f512c2cabc23e2b793f19c6c854d01a492b5a923  fuse-overlayfs-1.5.0.tar.gz
>  # Locally computed
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
> index 707cacce03..0ad7dbc51d 100644
> --- a/package/fuse-overlayfs/fuse-overlayfs.mk
> +++ b/package/fuse-overlayfs/fuse-overlayfs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FUSE_OVERLAYFS_VERSION = 1.4.0
> +FUSE_OVERLAYFS_VERSION = 1.5.0
>  FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
>  FUSE_OVERLAYFS_LICENSE = GPL-3.0
>  FUSE_OVERLAYFS_LICENSE_FILES = COPYING
> 
