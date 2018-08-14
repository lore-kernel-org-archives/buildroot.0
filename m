From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:56:44 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/kodi: switch to
 internal ffmpeg version 3.1.11 build
In-Reply-To: <20180812202352.15128-1-bernd.kuhls@t-online.de>
References: <20180812202352.15128-1-bernd.kuhls@t-online.de>
Message-ID: <20180814155644.41b94694@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 22:23:52 +0200, Bernd Kuhls wrote:

> +# taken from tools/depends/target/ffmpeg/FFMPEG-VERSION
> +KODI_FFMPEG_VERSION = 3.1.11-Krypton-17.5
> +KODI_EXTRA_DOWNLOADS += \
> +	https://github.com/xbmc/FFmpeg/archive/$(KODI_FFMPEG_VERSION).tar.gz \

There was a trailing backslash on this line, which check-package didn't
like, so I fixed that in a follow-up commit.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
