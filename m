From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Feb 2014 17:54:21 +0100
Subject: [Buildroot] [PATCH v12 10/11] libav: add new package
In-Reply-To: <1371766066-676-11-git-send-email-spenser@gillilanding.com>
References: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
 <1371766066-676-11-git-send-email-spenser@gillilanding.com>
Message-ID: <20140204175421.2a7310a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 20 Jun 2013 17:07:45 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/multimedia/Config.in       |    1 +
>  package/multimedia/libav/Config.in |  158 ++++++++++++++++++++++++++++
>  package/multimedia/libav/libav.mk  |  200 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 359 insertions(+)
>  create mode 100644 package/multimedia/libav/Config.in
>  create mode 100644 package/multimedia/libav/libav.mk

It's been a while, but this patch is actually the last one of your
patch series that hasn't been applied in one form or another. You
originally created this patch as a dependency of gst-libav, but in the
mean time, a different gst1-libav package was added, which uses the
internal copy of libav in the GStreamer plugin sources, as recommended
by upstream.

Therefore, are you interested in pursuing the effort around this patch?

Also, do you know if libav conflicts with ffmpeg in terms of installed
files? Is it a drop-in replacement for ffmpeg or something different?

Please let us know what your intentions are around this patch: as you
can imagine we are trying to clean up the patchwork from the oldest
patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
