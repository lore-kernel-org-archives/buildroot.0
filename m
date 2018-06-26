From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:21:41 +0200
Subject: [Buildroot] [PATCH v6 0/9] gstreamer1: bump to 1.14.1
In-Reply-To: <20180623223529.13629-1-ps.report@gmx.net>
References: <20180623223529.13629-1-ps.report@gmx.net>
Message-ID: <20180626232141.23ec9771@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jun 2018 00:35:20 +0200, Peter Seiderer wrote:

> Adam Duskett (8):
>   gstreamer1: bump to 1.14.1
>   gst1-plugins-${base, good, bad, ugly}: bump to 1.14.1
>   gst-omx: bump to 1.14.1
>   gst1-rtsp-server: bump to 1.14.1
>   gst1-vaapi: bump to 1.14.1
>   gst1-libav: bump to 1.14.1
>   gst1-validate: bump to 1.14.1
>   gst1-imx: add hash for license file
> 
> Peter Seiderer (1):
>   gstreamer1-editing-services: bump to 1.14.1

Thanks a lot for working on this! I've applied the whole series, with a
few changes on PATCH 2/9. I'll reply separately to this patch to point
out the things I've fixed.

Once again, many thanks to Adam for the initial work, and to you for
polishing the patches. GStreamer is an important software stack to have
in Buildroot, so it's good to have people taking care of its packaging.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
