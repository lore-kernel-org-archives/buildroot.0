From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 19 Jul 2013 18:37:50 -0500
Subject: [Buildroot] [PATCH 0/4] ARM Mali Graphics Drivers
Message-ID: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the ARM Mali graphics driver for Allwinner based systems.

Spenser Gilliland (4):
  a10disp: new package
  sunxi-mali: new package
  opengl: add sunxi-mali as possible egl/gles provider
  sunxi-cedar: add cedar hardware video decoding library

 package/Config.in                          |  4 ++
 package/a10disp/Config.in                  | 12 +++++
 package/a10disp/a10disp.mk                 | 21 ++++++++
 package/opengl/libegl/libegl.mk            |  4 ++
 package/opengl/libgles/libgles.mk          |  4 ++
 package/sunxi-cedar/Config.in              | 10 ++++
 package/sunxi-cedar/sunxi-cedar.mk         | 49 ++++++++++++++++++
 package/sunxi-mali-prop/Config.in          |  4 ++
 package/sunxi-mali-prop/sunxi-mali-prop.mk | 10 ++++
 package/sunxi-mali/Config.in               | 52 +++++++++++++++++++
 package/sunxi-mali/S80mali                 | 54 ++++++++++++++++++++
 package/sunxi-mali/egl.pc                  | 12 +++++
 package/sunxi-mali/glesv2.pc               | 12 +++++
 package/sunxi-mali/sunxi-mali.mk           | 82 ++++++++++++++++++++++++++++++
 14 files changed, 330 insertions(+)
 create mode 100644 package/a10disp/Config.in
 create mode 100644 package/a10disp/a10disp.mk
 create mode 100644 package/sunxi-cedar/Config.in
 create mode 100644 package/sunxi-cedar/sunxi-cedar.mk
 create mode 100644 package/sunxi-mali-prop/Config.in
 create mode 100644 package/sunxi-mali-prop/sunxi-mali-prop.mk
 create mode 100644 package/sunxi-mali/Config.in
 create mode 100644 package/sunxi-mali/S80mali
 create mode 100644 package/sunxi-mali/egl.pc
 create mode 100644 package/sunxi-mali/glesv2.pc
 create mode 100644 package/sunxi-mali/sunxi-mali.mk

-- 
1.8.1.2
