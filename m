From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 09:18:39 +0200
Subject: [Buildroot] [PATCH v1] gstreamer1: bump to 1.14.2
In-Reply-To: <20180726212353.32617-1-ps.report@gmx.net>
References: <20180726212353.32617-1-ps.report@gmx.net>
Message-ID: <20180727091839.471c175e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jul 2018 23:23:53 +0200, Peter Seiderer wrote:
> For release desription see [1].
> 
> - gst1-vaapi: remove upstream patch 0001-plugins-guard-GstGL-code.patch
> 
> [1] https://gstreamer.freedesktop.org/releases/1.14/#1.14.2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/gst-omx/gst-omx.hash       |  4 +--
>  package/gstreamer1/gst-omx/gst-omx.mk         |  2 +-
>  package/gstreamer1/gst1-libav/gst1-libav.hash |  4 +--
>  package/gstreamer1/gst1-libav/gst1-libav.mk   |  2 +-
>  .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +--
>  .../gst1-plugins-bad/gst1-plugins-bad.mk      |  2 +-
>  .../gst1-plugins-base/gst1-plugins-base.hash  |  4 +--
>  .../gst1-plugins-base/gst1-plugins-base.mk    |  2 +-
>  .../gst1-plugins-good/gst1-plugins-good.hash  |  4 +--
>  .../gst1-plugins-good/gst1-plugins-good.mk    |  2 +-
>  .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |  4 +--
>  .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  2 +-
>  .../gst1-rtsp-server/gst1-rtsp-server.hash    |  4 +--
>  .../gst1-rtsp-server/gst1-rtsp-server.mk      |  2 +-
>  .../0001-plugins-guard-GstGL-code.patch       | 35 -------------------
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  4 +--
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |  2 +-
>  .../gst1-validate/gst1-validate.hash          |  4 +--
>  .../gstreamer1/gst1-validate/gst1-validate.mk |  2 +-
>  .../gstreamer1-editing-services.hash          |  4 +--
>  .../gstreamer1-editing-services.mk            |  2 +-
>  package/gstreamer1/gstreamer1/gstreamer1.hash |  4 +--
>  package/gstreamer1/gstreamer1/gstreamer1.mk   |  2 +-
>  23 files changed, 33 insertions(+), 68 deletions(-)
>  delete mode 100644 package/gstreamer1/gst1-vaapi/0001-plugins-guard-GstGL-code.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
