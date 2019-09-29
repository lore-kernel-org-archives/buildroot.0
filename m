From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 20:02:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/xdotool: bump version to
 3.20160805.1
Message-ID: <20190929180218.11694-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xdotool/xdotool.hash | 3 ++-
 package/xdotool/xdotool.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xdotool/xdotool.hash b/package/xdotool/xdotool.hash
index 5f32ca5f39..b0d5a7582a 100644
--- a/package/xdotool/xdotool.hash
+++ b/package/xdotool/xdotool.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 b097ef0e3897d1a24e3f45f0faed58329742d3d9434b9b46eb97eb1040f999bf  xdotool-3.20150503.1.tar.gz
+sha256 ddafca1239075c203769c17a5a184587731e56fbe0438c09d08f8af1704e117a  xdotool-3.20160805.1.tar.gz
+sha256 129d156c35b1cb19350f3716129173c8c89e019c0497d9df073db5b801becef2  COPYRIGHT
diff --git a/package/xdotool/xdotool.mk b/package/xdotool/xdotool.mk
index 93d7d64a45..5c5603bd62 100644
--- a/package/xdotool/xdotool.mk
+++ b/package/xdotool/xdotool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDOTOOL_VERSION = 3.20150503.1
+XDOTOOL_VERSION = 3.20160805.1
 XDOTOOL_SITE = $(call github,jordansissel,xdotool,v$(XDOTOOL_VERSION))
 XDOTOOL_LICENSE = BSD-3-Clause
 XDOTOOL_LICENSE_FILES = COPYRIGHT
-- 
2.20.1
