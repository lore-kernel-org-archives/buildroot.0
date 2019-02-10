From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 11:17:21 +0100
Subject: [Buildroot] [PATCH] gst1-shark: select
 BR2_PACKAGE_GSTREAMER1_GST_DEBUG
In-Reply-To: <20190210080732.4651-1-judge.packham@gmail.com>
References: <20190210080732.4651-1-judge.packham@gmail.com>
Message-ID: <20190210111721.1af05ba9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Feb 2019 21:07:32 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> gst-shark needs gstreamer to be compiled with debugging support enabled.
> Make this selection automatically when the gst-shark package is
> selected.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/09b894b0775df2dd87d8fb2d53c6a243d8668aba/
>  - and many more
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
> I'm not entirely sure how I didn't notice this originally. I swear I did
> compile it before submitting it, still I can't dispute the fact that
> BR2_PACKAGE_GSTREAMER1_GST_DEBUG has been there since gstreamer1 was
> introduced.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
