From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:44:21 +0100
Subject: [Buildroot] [PATCH 1/3] package/at-spi2-core: bump to version
 2.34.0
In-Reply-To: <20191028172658.923021-1-joseph.kogut@gmail.com>
References: <20191028172658.923021-1-joseph.kogut@gmail.com>
Message-ID: <3aa4d5f7-9180-55de-7015-d55ad937d7bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 18:26, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  ...001-Fix-meson.build-for-meson-0.50.0.patch | 35 -------------------
>  package/at-spi2-core/at-spi2-core.hash        |  2 +-
>  package/at-spi2-core/at-spi2-core.mk          |  2 +-
[snip]
> diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
> index 9c96da312b..2ccbe27aba 100644
> --- a/package/at-spi2-core/at-spi2-core.hash
> +++ b/package/at-spi2-core/at-spi2-core.hash
> @@ -1,3 +1,3 @@
>  # locally calculated
> -sha256 42a2487ab11ce43c288e73b2668ef8b1ab40a0e2b4f94e80fca04ad27b6f1c87  at-spi2-core-2.28.0.tar.xz
> +sha256 d629cdbd674e539f8912028512af583990938c7b49e25184c126b00121ef11c6  at-spi2-core-2.34.0.tar.xz
>  sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING

 The license hash has changed. Please investigate why (e.g., has the license
changed, or are there additional terms) and explain in the commit message.

 Also, in the future, please run 'make legal-info' before submitting a version bump.

 Regards,
 Arnout


> diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
> index 3a5197eb03..38426fef59 100644
> --- a/package/at-spi2-core/at-spi2-core.mk
> +++ b/package/at-spi2-core/at-spi2-core.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -AT_SPI2_CORE_VERSION_MAJOR = 2.28
> +AT_SPI2_CORE_VERSION_MAJOR = 2.34
>  AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
>  AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
>  AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
> 
