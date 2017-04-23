From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 12:07:20 +0200
Subject: [Buildroot] [PATCH v5 26/34]
 package/kodi-audiodecoder-timidity: bump version
In-Reply-To: <20170417195433.26672-27-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-27-bernd.kuhls@t-online.de>
Message-ID: <20170423100720.GH7228@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> kodi-platform is not a dependency anymore:
> https://github.com/notspiff/audiodecoder.timidity/commit/b7ae86ad860b562f08ab02d9e87a546d99f1bb51
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi-audiodecoder-timidity/Config.in                       | 1 -
>  package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash | 2 +-
>  package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk   | 4 ++--
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/kodi-audiodecoder-timidity/Config.in b/package/kodi-audiodecoder-timidity/Config.in
> index 8f604adf0..3372dc5c0 100644
> --- a/package/kodi-audiodecoder-timidity/Config.in
> +++ b/package/kodi-audiodecoder-timidity/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_KODI_AUDIODECODER_TIMIDITY
>  	bool "kodi-audiodecoder-timidity"
> -	select BR2_PACKAGE_KODI_PLATFORM
>  	help
>  	  Timidity decoder addon for Kodi
>  
> diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
> index d4af0197b..5711b87a6 100644
> --- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
> +++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 2e220b7d279fce73ff289536cd9e94b159ae648514fb8b423977dddb99c50e85 kodi-audiodecoder-timidity-a84559da92aa67744069fc9e9dc885732588c8ce.tar.gz
> +sha256 83a740010dc7fa01101da370c74e79287ebd67bd28d27125e4372abe2fb3bb47  kodi-audiodecoder-timidity-v1.1.1.tar.gz
> diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
> index 0d5f6ef2e..e4a97fa7f 100644
> --- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
> +++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -KODI_AUDIODECODER_TIMIDITY_VERSION = a84559da92aa67744069fc9e9dc885732588c8ce
> +KODI_AUDIODECODER_TIMIDITY_VERSION = v1.1.1
>  KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
>  KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
>  KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
> -KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi-platform
> +KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi
>  
>  $(eval $(cmake-package))
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
