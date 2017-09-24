From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:02:05 +0200
Subject: [Buildroot] [PATCH] package/tslib: update to 1.13
In-Reply-To: <20170914072033.24536-1-martink@posteo.de>
References: <20170914072033.24536-1-martink@posteo.de>
Message-ID: <f4fdbb73-4b6c-e7ee-a142-5d7d6151df65@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-17 09:20, Martin Kepplinger wrote:
> see https://github.com/kergoth/tslib/releases
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>

 Applied to master, thanks. Thank you for you patience :-)

 Regards,
 Arnout

> ---
>  package/tslib/tslib.hash | 4 ++--
>  package/tslib/tslib.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
> index f053c6cabd..3ed49008fb 100644
> --- a/package/tslib/tslib.hash
> +++ b/package/tslib/tslib.hash
> @@ -1,2 +1,2 @@
> -# https://github.com/kergoth/tslib/releases/download/1.12/tslib-1.12.tar.xz.sha256
> -sha256  237f66c9e53789429b1bcc89a36eb7a37f1deb2877e6e7d928e994e3c48d0b83  tslib-1.12.tar.xz
> +# https://github.com/kergoth/tslib/releases/download/1.13/tslib-1.13.tar.xz.sha256
> +sha256  b381279f2d6ad6acb80cfc4852860853b7bcd1a9440821e9fe920c33f4e4f8da  tslib-1.13.tar.xz
> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
> index 2b4320dca3..06f887a151 100644
> --- a/package/tslib/tslib.mk
> +++ b/package/tslib/tslib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TSLIB_VERSION = 1.12
> +TSLIB_VERSION = 1.13
>  TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
>  TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
>  TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
