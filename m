From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:47:49 +0100
Subject: [Buildroot] [PATCH v3 3/4] package/ffmpeg: bump to version 4.1
In-Reply-To: <ea-mime-5c5aa9fc-6f58-26e2ec99@www-1.netcourrier.com>
References: <20190206094727.24dfa441@windsurf>
 <ea-mime-5c5aa9fc-6f58-26e2ec99@www-1.netcourrier.com>
Message-ID: <20190206104749.1ae23e1b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(It would be good to configure your e-mail client to wrap lines at 72
characters)

On Wed,  6 Feb 2019 10:33:48 +0100 (CET)
lpdev at cordier.org wrote:

> What decision should be taken on this? We have 2 solutions has Bernd
> stated: either bumping GStreamer to a more recent version (that seems
> to be not welcomed by some people), or applying Bernd patch. What
> about the latter? 
> 
> I can modify my patch serie to include Bernd's patch. Would it
> possibly convince everyone for a final merge?

Is there a stable version of gstreamer that was released and that is
compatible with ffmpeg 4.x ? If so, that's what we want to use.

If not, then presumably there are upstream GStreamer changes that make
it compatible with ffmpeg 4.x, and we would like to see those patches
backported rather than using home-grown patches.

> In the meantime, I think you can merge intel media driver and
> mediasdk patches. Thanks for your time!

Yes, sure thing.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
