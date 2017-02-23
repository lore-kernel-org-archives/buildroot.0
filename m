From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Feb 2017 15:55:20 -0300
Subject: [Buildroot] [PATCH master 0/9] Gstreamer security bump
Message-ID: <20170223185529.14129-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest gstreamer release fixes security bugs in at least gst-libav,
gst1-plugins-bad and gst1-plugins-ugly.
However for consistency commiting the whole series would be recommended.

Gustavo Zacarias (9):
  gstreamer1: bump to version 1.10.4
  gst1-plugins-base: bump to version 1.10.4
  gst1-plugins-good: bump to version 1.10.4
  gst1-plugins-bad: security bump to version 1.10.4
  gst1-plugins-ugly: security bump to version 1.10.4
  gst1-libav: security bump to version 1.10.4
  gst1-rtsp-server: bump to version 1.10.4
  gst1-validate: bump to version 1.10.4
  gst-omx: bump to version 1.10.4

 package/gstreamer1/gst-omx/gst-omx.hash                     | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk                       | 2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash               | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk                 | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash   | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk     | 2 +-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash   | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk     | 2 +-
 package/gstreamer1/gst1-validate/gst1-validate.hash         | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk           | 2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash               | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk                 | 2 +-
 18 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.10.2
