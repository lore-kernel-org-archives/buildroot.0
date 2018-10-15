From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Oct 2018 18:47:33 +0200
Subject: [Buildroot] [PATCH 4/4] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 0.28.1
In-Reply-To: <20181015164734.16624-1-bernd.kuhls@t-online.de>
References: <20181015164734.16624-1-bernd.kuhls@t-online.de>
Message-ID: <20181015164734.16624-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput.hash                   | 10 +++++-----
 .../xdriver_xf86-input-libinput.mk                     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index cb41765f4f..c6f2577bd6 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-July/002908.html
-md5 2d7519ac0e39d4c88f3be32e81a637aa  xf86-input-libinput-0.28.0.tar.bz2
-sha1 07f5559bcf0363d4ecaf0b2cecb88ee7d2b16fc6  xf86-input-libinput-0.28.0.tar.bz2
-sha256 21994d065fc26e85d1c3fc87d8479b9c22699ed5a0119df98fbe0000e84630a1  xf86-input-libinput-0.28.0.tar.bz2
-sha512 4276b6aea87ddc83fa1f5e8d8949e34ad117186a6b5b599549231cb90424cd0fa69f3a4701ce529739c676665bb5c936eb447817c9420511d23bc048f6be92a4  xf86-input-libinput-0.28.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-October/002923.html
+md5  9d2fb3d6b452d568a275908b856de0e2  xf86-input-libinput-0.28.1.tar.bz2
+sha1 f72f298c23fa993857ff1a9a06754f2f5962b376  xf86-input-libinput-0.28.1.tar.bz2
+sha256 9ada448e076c0078a84b48e5298fa8ce317565f9b342b74c20429214a707d98b  xf86-input-libinput-0.28.1.tar.bz2
+sha512 2b8cabfbc3490edbe928771ed9d62a0d4a423bc1373fc6cf9d3a6b5937e17ddc48ebb1b70f1191e507024e4b8220c137495cbba825292b51e50709daa7d31623  xf86-input-libinput-0.28.1.tar.bz2
 # Locally computed
 sha256 b808a8a077995380c6064bec41616f98546b0b2e79bb7f3d0247d290e275b396  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index b427d154cb..83de5c9610 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.28.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.28.1
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
2.19.1
