From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:05:02 +0200
Subject: [Buildroot] [PATCH 2/3] mpv: bump version to 0.27.0
In-Reply-To: <20170914150238.31289-1-mahyar.koshkouei@gmail.com>
References: <20170914150238.31289-1-mahyar.koshkouei@gmail.com>
Message-ID: <25c1a16e-b76c-ceb5-99ef-d4d282ea0ee2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-17 17:02, Mahyar Koshkouei wrote:
> Includes some fixes for the Raspberry Pi, amongst many others.
> 
> Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/mpv/mpv.hash | 2 +-
>  package/mpv/mpv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
> index 10a91cfb2c..60fb84335e 100644
> --- a/package/mpv/mpv.hash
> +++ b/package/mpv/mpv.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 07423ffad6921ec4da32f703cd7fbfb27012301dcb736ac8542ac8e6083b0bce  v0.25.0.tar.gz
> +sha256 341d8bf18b75c1f78d5b681480b5b7f5c8b87d97a0d4f53a5648ede9c219a49c v0.27.0.tar.gz
> diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
> index 37548c9074..730ced6c64 100644
> --- a/package/mpv/mpv.mk
> +++ b/package/mpv/mpv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MPV_VERSION = 0.25.0
> +MPV_VERSION = 0.27.0
>  MPV_SITE = https://github.com/mpv-player/mpv/archive
>  MPV_SOURCE = v$(MPV_VERSION).tar.gz
>  MPV_DEPENDENCIES = \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
