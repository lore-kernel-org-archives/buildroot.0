From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 15 May 2019 20:56:35 +0300
Subject: [Buildroot] [PATCH] package/openjpeg: bump to version 2.3.1
In-Reply-To: <20190515164446.800-1-francois.perrad@gadz.org>
References: <20190515164446.800-1-francois.perrad@gadz.org>
Message-ID: <20190515205635.GB5634@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 May 2019 18:44:45 +0200, Francois Perrad <fperrad@gmail.com> wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/openjpeg/openjpeg.hash | 2 +-
>  package/openjpeg/openjpeg.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
> index 8a6fda48c..31c5b5040 100644
> --- a/package/openjpeg/openjpeg.hash
> +++ b/package/openjpeg/openjpeg.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256 3389a1aa908c2b577863da213db3a170df3edbb1432e99ae5fd3f2ac721d69d3  openjpeg-51f097e6d5754ddae93e716276fe8176b44ec548.tar.gz
> +sha256 63f5a4713ecafc86de51bfad89cc07bb788e9bba24ebbf0c4ca637621aadb6a9  openjpeg-2.3.1.tar.gz
>  sha256 a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
> diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
> index 6036ab95a..1b119fa5f 100644
> --- a/package/openjpeg/openjpeg.mk
> +++ b/package/openjpeg/openjpeg.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -OPENJPEG_VERSION = 51f097e6d5754ddae93e716276fe8176b44ec548
> -OPENJPEG_SITE = $(call github,uclouvain,openjpeg,$(OPENJPEG_VERSION))
> +OPENJPEG_VERSION = 2.3.1
> +OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
>  OPENJPEG_LICENSE = BSD-2-Clause
>  OPENJPEG_LICENSE_FILES = LICENSE
>  OPENJPEG_INSTALL_STAGING = YES
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190515/b1e50396/attachment.asc>
