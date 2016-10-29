From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Oct 2016 14:10:10 +0200
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-input-libinput:
	bump version to 0.22.0
In-Reply-To: <20161029121010.25575-1-bernd.kuhls@t-online.de>
References: <20161029121010.25575-1-bernd.kuhls@t-online.de>
Message-ID: <20161029121010.25575-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash      | 4 ++--
 .../x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 103e515..6edc391 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-September/002717.html
-sha256 c54e8155d0ba0e5abba9de7bb227c4e4930959a01a904de96b6c0e52bb2a39b0  xf86-input-libinput-0.20.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002732.html
+sha256 c762b4072ed448e2ae9f35cebd7fec8df7fd42b3ae61462cc3b2f720a873eae2  xf86-input-libinput-0.22.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index eacacea..517e5d2 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.20.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.22.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
2.10.1
