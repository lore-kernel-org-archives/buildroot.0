From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 15:49:37 +0200
Subject: [Buildroot] [PATCH 1/1] normalize separator size to 80
In-Reply-To: <1374472573-10247-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1374472573-10247-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20130727154937.447d0964@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Mon, 22 Jul 2013 07:56:13 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/bind/bind.mk                               |    2 +-
>  package/elf2flt/elf2flt.mk                         |    4 ++--
>  package/multimedia/gst-omx/gst-omx.mk              |    4 ++--
>  .../gst1-plugins-bad/gst1-plugins-bad.mk           |    4 ++--
>  .../gst1-plugins-good/gst1-plugins-good.mk         |    4 ++--
>  .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    4 ++--
>  package/multimedia/gstreamer1/gstreamer1.mk        |    4 ++--
>  package/ramsmp/ramsmp.mk                           |    4 ++--
>  package/ti-gfx/ti-gfx.mk                           |    4 ++--
>  package/w_scan/w_scan.mk                           |    4 ++--
>  10 files changed, 19 insertions(+), 19 deletions(-)

Committed, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
