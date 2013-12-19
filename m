From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Dec 2013 21:59:29 +0100
Subject: [Buildroot] [PATCH 0 of 2] gstreamer(1): factorize dependency
Message-ID: <patchbomb.1387486769@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Proposed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/gstreamer/Config.in                    |  3 +++
 package/gstreamer/gst-dsp/Config.in            |  2 +-
 package/gstreamer/gst-ffmpeg/Config.in         |  2 --
 package/gstreamer/gst-fsl-plugins/Config.in    |  3 +--
 package/gstreamer/gst-omapfb/Config.in         |  2 +-
 package/gstreamer/gst-plugin-x170/Config.in    |  3 +--
 package/gstreamer/gst-plugins-bad/Config.in    |  1 -
 package/gstreamer/gst-plugins-base/Config.in   |  1 -
 package/gstreamer/gst-plugins-good/Config.in   |  1 -
 package/gstreamer/gst-plugins-ugly/Config.in   |  1 -
 package/gstreamer/gstreamer/Config.in          |  6 ++++--
 package/gstreamer1/Config.in                   |  3 +++
 package/gstreamer1/gst-omx/Config.in           |  4 ++--
 package/gstreamer1/gst1-plugins-bad/Config.in  |  1 -
 package/gstreamer1/gst1-plugins-base/Config.in |  1 -
 package/gstreamer1/gst1-plugins-good/Config.in |  1 -
 package/gstreamer1/gst1-plugins-ugly/Config.in |  1 -
 17 files changed, 16 insertions(+), 20 deletions(-)
