From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 10:39:58 +0100
Subject: [Buildroot] [PATCH v2 4/6] ffmpeg: bump to version 4.1.
 ffserver is not supported anymore.
In-Reply-To: <mfmiifx78d.ln2@ID-313208.user.individual.net>
References: <20190131121526.11816-1-lpdev@cordier.org>
 <20190131121526.11816-5-lpdev@cordier.org>
 <20190202155400.6547fba9@windsurf>
 <mfmiifx78d.ln2@ID-313208.user.individual.net>
Message-ID: <20190204103958.561e7069@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 03 Feb 2019 09:48:22 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> afaik the only package left over to be fixed before we bump ffmpeg to 4.x 
> is gstreamer1/gst1-libav, see my patch:
> http://patchwork.ozlabs.org/patch/962138/

OK, I see this patch is marked as Changes Requested. Louis-Paul:
before we can update ffmpeg to 4.x, we need to solve this issue. So we
need to have a solution to this gstreamer1/gst1-libav ffmpeg 4.x
compatibiility issue in your patch series, prior to the ffmpeg 4.x bump.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
