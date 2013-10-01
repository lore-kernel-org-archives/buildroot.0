From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Tue,  1 Oct 2013 11:06:28 -0700
Subject: [Buildroot] [PATCH 0/2] i.MX: update gst-fsl-plugin version
Message-ID: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series updates the version of gst-fsl-plugins to match the
latest release from Freescale.

Since the gst-fsl-plugin package is in a separate tree from
other freescale-imx components, this required splitting up
freescale-imx.mk into two parts.

Eric Nelson (2):
  freescale-imx: separate variable assignment from Makefile
  gst-fsl-plugins: Bump version and change URL to match other i.MX
    components

 package/freescale-imx/freescale-imx.inc              | 9 +++++++++
 package/freescale-imx/freescale-imx.mk               | 6 +-----
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk | 8 +++++---
 3 files changed, 15 insertions(+), 8 deletions(-)
 create mode 100644 package/freescale-imx/freescale-imx.inc

-- 
1.8.1.2
