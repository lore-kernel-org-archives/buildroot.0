From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Fri,  2 Feb 2018 17:55:24 +0300
Subject: [Buildroot] [PATCH v2 0/2] Xorg: enable Etnaviv support
Message-ID: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Evgeniy Didin <didin@synopsys.com>

This patch series enables Etnaviv support in Xorg.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com

Evgeniy Didin (2):
  libdrm-armada: new package
  xf86-video-armada: new package

 DEVELOPERS                                         |  2 ++
 package/Config.in                                  |  1 +
 package/libdrm-armada/Config.in                    |  8 +++++
 package/libdrm-armada/libdrm-armada.hash           |  5 +++
 package/libdrm-armada/libdrm-armada.mk             | 22 +++++++++++++
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-armada/Config.in  | 11 +++++++
 .../xdriver_xf86-video-armada.hash                 |  6 ++++
 .../xdriver_xf86-video-armada.mk                   | 37 ++++++++++++++++++++++
 9 files changed, 93 insertions(+)
 create mode 100644 package/libdrm-armada/Config.in
 create mode 100644 package/libdrm-armada/libdrm-armada.hash
 create mode 100644 package/libdrm-armada/libdrm-armada.mk
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk

-- 
2.11.0
