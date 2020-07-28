From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Jul 2020 12:07:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/easydbus: bump to version 0.1.0
Message-ID: <20200728100707.2536999-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/easydbus/easydbus.hash | 4 ++--
 package/easydbus/easydbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/easydbus/easydbus.hash b/package/easydbus/easydbus.hash
index 49245709f6..08a4f038d7 100644
--- a/package/easydbus/easydbus.hash
+++ b/package/easydbus/easydbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4626d6af3d9000d7e6ee9723abba7cd5f01d1c52420a80d8259dfa2d884faa11 easydbus-b86721147b265dfefc9a857669408cb6eb3d6560.tar.gz
-sha256 dec3b3103cd6889045da86fc7da22bd25545966e5bd7c214791b922dec19588b LICENSE
+sha256  8cec24bff40f056d4874ed9d6fb73c9f1efbc5eff14528e1b49f1a162b197f26  easydbus-0.1.0.tar.gz
+sha256  dec3b3103cd6889045da86fc7da22bd25545966e5bd7c214791b922dec19588b  LICENSE
diff --git a/package/easydbus/easydbus.mk b/package/easydbus/easydbus.mk
index 5e6de73c31..57d0c22392 100644
--- a/package/easydbus/easydbus.mk
+++ b/package/easydbus/easydbus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EASYDBUS_VERSION = b86721147b265dfefc9a857669408cb6eb3d6560
-EASYDBUS_SITE = $(call github,mniestroj,easydbus,$(EASYDBUS_VERSION))
+EASYDBUS_VERSION = 0.1.0
+EASYDBUS_SITE = $(call github,mniestroj,easydbus,v$(EASYDBUS_VERSION))
 EASYDBUS_DEPENDENCIES = luainterpreter libglib2
 EASYDBUS_LICENSE = MIT
 EASYDBUS_LICENSE_FILES = LICENSE
-- 
2.27.0
