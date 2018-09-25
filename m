From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:57:02 +0200
Subject: [Buildroot] [PATCH 5/5] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20180922235333.85642-6-aperez@igalia.com>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-6-aperez@igalia.com>
Message-ID: <20180925225702.1b1ff215@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Sep 2018 02:53:33 +0300, Adrian Perez de Castro wrote:
> Make the USE_GSTREAMER_GL CMake build option depend on
> BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL being enabled. This
> allows building WebKitGTK+ for targets where GL/GLES is
> available but either GStreamer-GL is disabled or cannot be
> built.

What is GStreamer-GL ? How is it possible to have GStreamer-GL
disabled, but BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL enabled ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
