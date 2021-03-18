From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Mar 2021 20:47:31 +0100
Subject: [Buildroot] [PATCH v1 00/12] GStreamer 1.18.4 stable bug fix release
Message-ID: <20210318194743.30623-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GStreamer 1.18.4 stable bug fix release

For details see [1].

[1] https://gstreamer.freedesktop.org/releases/1.18/#1.18.4

Peter Seiderer (12):
  package/gstreamer1: bump version to 1.18.4
  package/gst1-plugins-base: bump version to 1.18.4
  package/gst1-plugins-good: bump version to 1.18.4
  package/gst1-plugins-bad: bump version to 1.18.4
  package/gst1-plugins-ugly: bump version to 1.18.4
  package/gst1-devtools: bump version to 1.18.4
  package/gst1-libav: bump version to 1.18.4
  package/gst1-vaapi: bump version to 1.18.4
  package/gst1-rtsp-server: bump version to 1.18.4
  package/gstreamer1-editing-services: bump version to 1.18.4
  package/gst-omx: bump version to 1.18.4
  package/gst1-python: bump version to 1.18.4

 package/gstreamer1/gst-omx/gst-omx.hash                       | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk                         | 2 +-
 package/gstreamer1/gst1-devtools/gst1-devtools.hash           | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk             | 2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash                 | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk                   | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash     | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk       | 2 +-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash   | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk     | 2 +-
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash   | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk     | 2 +-
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash   | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk     | 2 +-
 package/gstreamer1/gst1-python/gst1-python.hash               | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk                 | 2 +-
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash     | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk       | 2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash                 | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk                   | 2 +-
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash                 | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk                   | 2 +-
 24 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.30.2
