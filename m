From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 20 Dec 2017 18:08:41 +0300
Subject: [Buildroot] [PATCH 0/2] Xorg: enable Etnaviv support
Message-ID: <20171220150843.21154-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series enables Etnaviv support in Xorg.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com

Evgeniy Didin (2):
  libdrm-armada: new package
  xf86-video-armada: new package

 package/Config.in                                  |  1 +
 package/libdrm-armada/Config.in                    |  7 +++++
 package/libdrm-armada/libdrm-armada.hash           |  2 ++
 package/libdrm-armada/libdrm-armada.mk             | 24 +++++++++++++++
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-armada/Config.in  | 11 +++++++
 .../xdriver_xf86-video-armada.hash                 |  2 ++
 .../xdriver_xf86-video-armada.mk                   | 36 ++++++++++++++++++++++
 8 files changed, 84 insertions(+)
 create mode 100644 package/libdrm-armada/Config.in
 create mode 100644 package/libdrm-armada/libdrm-armada.hash
 create mode 100644 package/libdrm-armada/libdrm-armada.mk
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.mk

-- 
2.11.0
