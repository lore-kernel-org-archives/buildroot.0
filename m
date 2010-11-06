From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Nov 2010 19:33:33 +0100
Subject: [Buildroot] [PATCH 0/5] GStreamer patches for OMAP3
In-Reply-To: <1284939779-32754-1-git-send-email-felipe.contreras@gmail.com>
References: <1284939779-32754-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <20101106193333.12a7a0ee@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Sep 2010 02:42:54 +0300
Felipe Contreras <felipe.contreras@gmail.com> wrote:

> The first patch is a bit of improvement for GStreamer, the next two enable TI's
> OMAP3 DSP (by using tidspbridge driver), the fourth ist some tools to test the
> afforementioned DSP, and the final one is another video sink optimized for
> OMAP.
> 
> I've tested these on a Nokia N900, but should work on any OMAP3 device.
> 
> Felipe Contreras (5):
>   gstreamer: remove unnecessary feature
>   Add tidsp-binaries package
>   Add gst-dsp package
>   Add dsp-tools package
>   Add gst-omapfb package

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
