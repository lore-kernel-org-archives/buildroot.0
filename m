From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 20:25:08 +0200
Subject: [Buildroot] [PATCH v7 00/10] add Gstreamer 1.X for gst-omx
 support
In-Reply-To: <1369588343-13950-1-git-send-email-spenser@gillilanding.com>
References: <1369588343-13950-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130527202508.662f74ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Sun, 26 May 2013 12:12:13 -0500, Spenser Gilliland wrote:
> This patch adds gst-omx support to buildroot. Thus, making it possible to use
> gstreamer applications which utilize hardware acceleration on OpenMAX supported
> systems.
> 
> To add gst-omx, libglib2 is bumped to 2.36.1 and gstreamer1 is added.

As explained on IRC, bumping libglib2 to 2.36.1 breaks the build of
webkit. Besides that, I've built a number of packages that use
libglib2, and I've built gstreamer1 itself, and it was fine here.

So, the webkit problem needs to be fixed, either by adding a patch to
the current version of webkit, or by bumping webkit. In the end,
bumping webkit is certainly the nicest solution, but it may turn this
patch series into a much larger one.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
