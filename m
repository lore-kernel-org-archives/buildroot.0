From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Fri, 29 Jan 2021 13:43:50 +0800
Subject: [Buildroot] [PATCH 1/1] package/ttyd: bump to version 1.6.3
Message-ID: <20210129054350.2447996-1-tianyuanhao@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
---
 package/ttyd/ttyd.hash | 2 +-
 package/ttyd/ttyd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index 8448c978a4..c4263d6e94 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  fd3256099e1cc5c470220cbfbb3ab2c7fa1f92232c503f583556a8965aa83bac  ttyd-1.6.2.tar.gz
+sha256  1116419527edfe73717b71407fb6e06f46098fc8a8e6b0bb778c4c75dc9f64b9  ttyd-1.6.3.tar.gz
 sha256  711762f081c180ade3d09d7b0b7537eaf35eca8d1671e47bc66eaa39376edb12  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index 9c456d16cd..856270a88d 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.6.2
+TTYD_VERSION = 1.6.3
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
-- 
2.25.1
