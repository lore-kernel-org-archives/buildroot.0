From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:32:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/libyang: bump version to 1.0-r4
In-Reply-To: <20191028075033.8121-1-heiko.thiery@gmail.com>
References: <20191028075033.8121-1-heiko.thiery@gmail.com>
Message-ID: <95120865-168f-db5d-bb39-b9e99557b4b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 08:50, Heiko Thiery wrote:
> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libyang/libyang.hash | 2 +-
>  package/libyang/libyang.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
> index e48ea20fa3..442eb7bc4a 100644
> --- a/package/libyang/libyang.hash
> +++ b/package/libyang/libyang.hash
> @@ -1,2 +1,2 @@
> -sha256 351f712433d50494aad153bfd4aa92ff50299058428620eabddb7a41d781e756  libyang-1.0-r3.tar.gz
> +sha256 411f0c675b0858f8deabc0545e33fbd791ff7c7a5b7d2c27e347e3973d5b8ae4  libyang-1.0-r4.tar.gz
>  sha256 f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
> diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
> index a4333540da..cfec08cd16 100644
> --- a/package/libyang/libyang.mk
> +++ b/package/libyang/libyang.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBYANG_VERSION = 1.0-r3
> +LIBYANG_VERSION = 1.0-r4
>  LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
>  LIBYANG_LICENSE = BSD-3-Clause
>  LIBYANG_LICENSE_FILES = LICENSE
> 
