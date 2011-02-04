From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Fri,  4 Feb 2011 20:25:11 +0200
Subject: [Buildroot] [PATCH 0/2] GStreamer updates
Message-ID: <1296843913-22321-1-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

First I update the versions, and then I add the optional orc dependency.

Cheers.

Felipe Contreras (2):
  Update to the latest GStreamer packages
  Add orc package

 package/Config.in                                  |    1 +
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    4 +-
 .../gst-plugins-base/gst-plugins-base.mk           |    4 +-
 .../gst-plugins-good/gst-plugins-good.mk           |    2 +-
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
 ....10.25-fix-unaligned-detectiob-for-x86-64.patch |   36 --------------------
 package/multimedia/gstreamer/gstreamer.mk          |    2 +-
 package/orc/Config.in                              |    6 +++
 package/orc/orc.mk                                 |    7 ++++
 9 files changed, 21 insertions(+), 43 deletions(-)
 delete mode 100644 package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch
 create mode 100644 package/orc/Config.in
 create mode 100644 package/orc/orc.mk

-- 
1.7.4.1.g4f7e4
