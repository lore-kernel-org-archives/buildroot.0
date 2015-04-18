From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:16 +0200
Subject: [Buildroot] [PATCH 04/32]
	package/x11r7/xdriver_xf86-input-synaptics: bump version to 1.8.2
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash |    4 ++--
 .../xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
index 60dfee2..7b7216d 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-January/002516.html
-sha256	14e7d54f81c2a2503f8acbe5e265dc336a0f2b30d007657d7afbeff979821c11	xf86-input-synaptics-1.7.8.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-March/002556.html
+sha256	7b0e164ebd02a680e0c695955e783059f37edb0c2656398e0a972adc8e698c80	xf86-input-synaptics-1.8.2.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 1c625ea..f180405 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.7.8
+XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.8.2
 XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
-- 
1.7.10.4
