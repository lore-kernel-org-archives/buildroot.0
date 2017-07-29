From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 29 Jul 2017 21:59:09 +0300
Subject: [Buildroot] [PATCH v2 1/1] libpng: bump to version 1.6.31
In-Reply-To: <20170729153154.597-1-Adamduskett@outlook.com>
References: <20170729153154.597-1-Adamduskett@outlook.com>
Message-ID: <20170729185909.56s46oh5t5ajy3yl@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Sat, Jul 29, 2017 at 11:31:54AM -0400, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2
>   - Reverted to sourceforge. (Arnout)
> 
>  package/libpng/libpng.hash | 4 ++--
>  package/libpng/libpng.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
> index 279420a70..58304032a 100644
> --- a/package/libpng/libpng.hash
> +++ b/package/libpng/libpng.hash
> @@ -1,4 +1,4 @@
>  # From http://sourceforge.net/projects/libpng/files/libpng16/1.6.29/

Please update the link.

> -sha1 7dbe6a5088b938545fc0857c507d4e0cf5d9023e  libpng-1.6.29.tar.xz
> +sha1 de695064363df331734466981ef7f6546ef516bf  libpng-1.6.31.tar.xz
>  # Locally computed:
> -sha256 4245b684e8fe829ebb76186327bb37ce5a639938b219882b53d64bd3cfc5f239  libpng-1.6.29.tar.xz
> +sha256 232a602de04916b2b5ce6f901829caf419519e6a16cc9cd7c1c91187d3ee8b41  libpng-1.6.31.tar.xz
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index c82c4efff..0c19b29c1 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPNG_VERSION = 1.6.29
> +LIBPNG_VERSION = 1.6.31
>  LIBPNG_SERIES = 16
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
>  LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
