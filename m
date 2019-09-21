From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 19:52:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 4.2.1
In-Reply-To: <20190921133104.8285-1-bernd.kuhls@t-online.de>
References: <20190921133104.8285-1-bernd.kuhls@t-online.de>
Message-ID: <998fea23-b094-32f3-dd39-797e9441d47d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 15:31, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/ffmpeg/ffmpeg.hash | 2 +-
>  package/ffmpeg/ffmpeg.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
> index e648bbf0b0..a31811b903 100644
> --- a/package/ffmpeg/ffmpeg.hash
> +++ b/package/ffmpeg/ffmpeg.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256 023f10831a97ad93d798f53a3640e55cd564abfeba807ecbe8524dac4fedecd5  ffmpeg-4.2.tar.xz
> +sha256 cec7c87e9b60d174509e263ac4011b522385fd0775292e1670ecc1180c9bb6d4  ffmpeg-4.2.1.tar.xz
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
>  sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
>  sha256 cad1218c22121b169fb1380178ab7a0b33cb38a3ff6d3915b8533d1d954f3ce7  LICENSE.md
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 2b459aec18..3dd2e3ef76 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FFMPEG_VERSION = 4.2
> +FFMPEG_VERSION = 4.2.1
>  FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
>  FFMPEG_SITE = http://ffmpeg.org/releases
>  FFMPEG_INSTALL_STAGING = YES
> 
