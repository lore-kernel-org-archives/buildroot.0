From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 13:34:22 +0200
Subject: [Buildroot] [git commit] micropython-lib: use SPDX short identifier
	for Python license
Message-ID: <20170409115341.2812D826E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=665f17150420b037ea34b819a3a09f4cd15d5721
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython-lib/micropython-lib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
index 066572e..c9423fe 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -6,7 +6,7 @@
 
 MICROPYTHON_LIB_VERSION = v1.8.6
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
-MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
+MICROPYTHON_LIB_LICENSE = Python-2.0 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
 
 define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
