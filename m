From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  7 Nov 2016 07:51:32 +0100
Subject: [Buildroot] [PATCH 1/2] ser2net: bump to version 3.1
Message-ID: <1478501493-30411-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Version 3.1 adds librt to the list of required libraries.

Fixes:
http://autobuild.buildroot.net/results/7f1/7f152e2255f8d2cf9378812998fe9a239319c116

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ser2net/ser2net.hash | 2 +-
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 3e62f1c..f3b5692 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 e8aaf6c629c78bbc424e8a6810758061f9c68a4ffea0faf7c5031de26ce1c3e1  ser2net-3.0.tar.gz
+sha256 ad0db28e2a4b79a6d4e4b38ec1e50a22cc80fbbb4d7cad0a42f651457b00475e  ser2net-3.1.tar.gz
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index c4dcaf3..9a4a8d5 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 3.0
+SER2NET_VERSION = 3.1
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.1.4
