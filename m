From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 20:19:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-synaptics:
 bump version to 1.9.1
In-Reply-To: <20190929181939.27012-1-bernd.kuhls@t-online.de>
References: <20190929181939.27012-1-bernd.kuhls@t-online.de>
Message-ID: <20190929181939.27012-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-synaptics.hash                    | 9 +++++++--
 .../xdriver_xf86-input-synaptics.mk                      | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
index 2c31600b0a..b482a1db3b 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2016-November/002744.html
-sha256 afba3289d7a40217a19d90db98ce181772f9ca6d77e1898727b0afcf02073b5a  xf86-input-synaptics-1.9.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-May/002899.html
+md5 cfb79d3c975151f9bbf30b727c260cb9  xf86-input-synaptics-1.9.1.tar.bz2
+sha1 07eeef716820105cae959bbc3aa103e2fcfd0084  xf86-input-synaptics-1.9.1.tar.bz2
+sha256 7af83526eff1c76e8b9e1553b34245c203d029028d8044dd9dcf71eef1001576  xf86-input-synaptics-1.9.1.tar.bz2
+sha512 978eddd456aa7361047bc3d72e5127b24b13de29b0dddb6a0acc9f9da93931baa2b22fb5d1e6be164f629a11e5d97d753b835426435396b45b1af5eb8d546c3f  xf86-input-synaptics-1.9.1.tar.bz2
+# Locally computed
+sha256 e14dc9a27158cadaeea8bcc2c70069762f05adb29030a444336bfde268751dc7  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 0708110e91..c8ef98f8e4 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.9.0
+XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.9.1
 XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
-- 
2.20.1
