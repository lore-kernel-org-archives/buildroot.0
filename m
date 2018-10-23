From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 23 Oct 2018 13:49:16 +0200
Subject: [Buildroot] [PATCH] redis: bump to version 4.0.11
In-Reply-To: <20181022225640.5296-1-peter@korsgaard.com>
References: <20181022225640.5296-1-peter@korsgaard.com>
Message-ID: <1540295356.4710.2.camel@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-10-23 at 00:56 +0200, Peter Korsgaard wrote:
> From the release notes
> (https://raw.githubusercontent.com/antirez/redis/4.0/00-RELEASENOTES)
> :
> 
> Upgrade urgency HIGH: not critical but very important bugs fixed.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index d448228b56..0b4e25c61d 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/antirez/redis-hashes/blob/master/README
> -sha256
> 1db67435a704f8d18aec9b9637b373c34aa233d65b6e174bdac4c1b161f38ca4  red
> is-4.0.10.tar.gz
> +sha256
> fc53e73ae7586bcdacb4b63875d1ff04f68c5474c1ddeda78f00e5ae2eed1bbb  red
> is-4.0.11.tar.gz
>  
>  # Locally calculated
>  sha256
> cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COP
> YING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index a14ae2283f..da2307d693 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ####################################################################
> ############
>  
> -REDIS_VERSION = 4.0.10
> +REDIS_VERSION = 4.0.11
>  REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses
> (Bundled components)
>  REDIS_LICENSE_FILES = COPYING
