From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:24:39 +0200
Subject: [Buildroot] [PATCH v4 00/19] Bump ffmpeg to 3.0
In-Reply-To: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160329032439.69c9ec72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 21:49:26 +0200, Bernd Kuhls wrote:

> Bernd Kuhls (16):
>   package/kodi: add support for ffmpeg 3.0
>   package/libdcadec: bump version to v0.2.0
>   package/ortp: bump version to 0.25.0
>   package/mediastreamer: bump version to 2.12.1
>   package/linphone: add support for ffmpeg 3.0
>   package/opencv: bump version to 2.4.12.3
>   package/opencv3: bump version to 3.1.0
>   package/squeezelite: fix compilation with ffmpeg >= 2.9
>   package/freerdp: bump version

I've applied all those ones. Regarding linphone, I'm not too happy to
use the bundled versions of ortp and mediastreamer, but oh well, if we
don't have the choice and Debian does it, so be it.

>   package/vlc: mark as broken due to incompatibility with ffmpeg 3.0

This is rather annoying IMO. I don't think it's really reasonable to
mark VLC as broken. When is VLC 3.0 due to be released ?

If ffmpeg 3 is such a major change, I am wondering if we need to add it
as a separate package called ffmpeg3.

>   package/ffmpeg: Add patch required by Kodi 16.0-Jarvis

Not paplied for now.

>   package/x264: bump version
>   package/x265: bump version to 1.9
>   package/dtv-scan-tables: bump version
>   package/tvheadend: bump version
>   package/live555: bump version to 2016.03.16

I've applied those ones.

> Vicente Olivert Riera (3):
>   package/ffmpeg: bump to version 3.0
>   package/ffmpeg: cosmetic change for the mips fpu option
>   package/ffmpeg: default to --cpu=generic for MIPS architecture

Not applied for now, since there is the VLC issue to be resolved first.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
