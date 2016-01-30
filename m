From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 10:29:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/input-tools: fix broken download URL
Message-ID: <1454146185-29856-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/3db/3dbd112b8fc82d3ce7508ec31f212969685e53a9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/input-tools/input-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index c70ef47..48c1e53 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -7,7 +7,7 @@
 INPUT_TOOLS_VERSION = 20051019
 INPUT_TOOLS_SOURCE = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
 INPUT_TOOLS_PATCH = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
-INPUT_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/joystick
+INPUT_TOOLS_SITE = http://archive.debian.org/debian/pool/main/j/joystick
 INPUT_TOOLS_LICENSE = GPLv2+
 INPUT_TOOLS_LICENSE_FILES = utils/Makefile
 
-- 
2.7.0.rc3
