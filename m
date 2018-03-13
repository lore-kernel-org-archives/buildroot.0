From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 13 Mar 2018 22:05:25 +0100
Subject: [Buildroot] [PATCH 20/22] package/x11r7/xapp_xwud: bump version to
 1.0.5
In-Reply-To: <20180313210527.309-1-bernd.kuhls@t-online.de>
References: <20180313210527.309-1-bernd.kuhls@t-online.de>
Message-ID: <20180313210527.309-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xwud/xapp_xwud.hash | 9 +++++++--
 package/x11r7/xapp_xwud/xapp_xwud.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xwud/xapp_xwud.hash b/package/x11r7/xapp_xwud/xapp_xwud.hash
index 44e9c60753..e42057819d 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.hash
+++ b/package/x11r7/xapp_xwud/xapp_xwud.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2012-March/001927.html
-sha256	d6b3a09ccfe750868e26bd2384900ab5ff0d434f7f40cd272a50eda8aaa1f8bd	xwud-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002878.html
+md5 79972093bb0766fcd0223b2bd6d11932  xwud-1.0.5.tar.bz2
+sha1 a85d84a1b81f8e667ea6ac126d447590c93eb079  xwud-1.0.5.tar.bz2
+sha256 99997051f8a892313f22edf41dab45864e86e7062ee9012d5dbb6a40fc6b10a9  xwud-1.0.5.tar.bz2
+sha512 27a0ce7481978ae6cd94b0d94374af72185e270d68f2496620e148bb00945427c4827138d9efc48745e6382e3da3390ed0cdff7dbd02dcf9706e8ecccae97184  xwud-1.0.5.tar.bz2
+# Locally computed
+sha256 be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e COPYING
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 60afd86287..2c2e1ad497 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XWUD_VERSION = 1.0.4
+XAPP_XWUD_VERSION = 1.0.5
 XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
 XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWUD_LICENSE = MIT
-- 
2.11.0
