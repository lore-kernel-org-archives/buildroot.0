From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 17 Feb 2016 13:27:49 +0100
Subject: [Buildroot] [PATCH v4 0/2] gst1-imx: bump version to 0.12.0
Message-ID: <1455712071-14629-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series is the follow-up of the previous update of Freescale packages.
http://lists.busybox.net/pipermail/buildroot/2016-February/151334.html

It takes the following comments into account:
http://lists.busybox.net/pipermail/buildroot/2016-February/151607.html
http://lists.busybox.net/pipermail/buildroot/2016-February/151605.html
http://lists.busybox.net/pipermail/buildroot/2016-February/152814.html

Thanks,
Gary

Gary Bisson (2):
  libimxvpuapi: add new package
  gst1-imx: bump to version 0.12.0

 package/Config.in                         |  1 +
 package/gstreamer1/gst1-imx/Config.in     | 18 +++++++---------
 package/gstreamer1/gst1-imx/gst1-imx.hash |  2 ++
 package/gstreamer1/gst1-imx/gst1-imx.mk   | 20 +++++++++++++++---
 package/libimxvpuapi/Config.in            | 12 +++++++++++
 package/libimxvpuapi/libimxvpuapi.hash    |  2 ++
 package/libimxvpuapi/libimxvpuapi.mk      | 35 +++++++++++++++++++++++++++++++
 7 files changed, 76 insertions(+), 14 deletions(-)
 create mode 100644 package/gstreamer1/gst1-imx/gst1-imx.hash
 create mode 100644 package/libimxvpuapi/Config.in
 create mode 100644 package/libimxvpuapi/libimxvpuapi.hash
 create mode 100644 package/libimxvpuapi/libimxvpuapi.mk

-- 
2.7.0
