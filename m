From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 May 2013 23:49:08 +0200
Subject: [Buildroot] [PATCH v2 6/6] libvpx: new package libvpx
In-Reply-To: <1368132677-1261-6-git-send-email-spenser@gillilanding.com>
References: <1368132677-1261-1-git-send-email-spenser@gillilanding.com>
 <1368132677-1261-6-git-send-email-spenser@gillilanding.com>
Message-ID: <20130509234908.797dfc45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu,  9 May 2013 15:51:17 -0500, Spenser Gilliland wrote:

>  package/multimedia/Config.in                       |    1 +
>  package/multimedia/gst-plugins-good1/Config.in     |    4 ++
>  .../gst-plugins-good1/gst-plugins-good1.mk         |   10 +++-

The gst-plugins-good1 changes should be in a separate patch from the
patch...

>  package/multimedia/libvpx/Config.in                |    6 +++
>  package/multimedia/libvpx/libvpx.mk                |   52 ++++++++++++++++++++

...introducing the libvpx package.

So, first a patch introducing libvpx, and then a patch adding support
for it in gst-plugins-good1.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
