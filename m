From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:27:15 +0200
Subject: [Buildroot] [PATCH/next v3 7/7] package/ffmpeg: bump version to
 4.0.2
In-Reply-To: <20180825073118.14980-7-bernd.kuhls@t-online.de>
References: <20180825073118.14980-1-bernd.kuhls@t-online.de>
 <20180825073118.14980-7-bernd.kuhls@t-online.de>
Message-ID: <20180908232715.14f5b0ce@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 09:31:18 +0200, Bernd Kuhls wrote:
> ffserver was removed upstream:
> http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=6b35a83214f1bc3fb38c9ea9c2cd3676f28709fa
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Since I did not apply the gst-libav and freeswitch patches, they are
not yet compatible with ffmpeg 4.x, so I did not apply this one either.

Could you resend it as part of the next series with the freeswitch and
gst-libav fixes ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
