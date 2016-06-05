From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:11 +0200
Subject: [Buildroot] [PATCH 18/28] package/zxing-cpp: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-18-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zxing-cpp/zxing-cpp.hash | 2 +-
 package/zxing-cpp/zxing-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index e38a612..4625fbf 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 164c0bc9f1ce2ff5659fddce6da71f8cdda091751f3b71140c090b58451a2b04 zxing-cpp-fa34227d26e0b388e65b81936a2681952928f5be.tar.gz
+sha256 643c931a35c363109cd38c5a1526505b75f57c0634907cb7b6bc24f6f48eb32b zxing-cpp-0db7f855135222becff193671faae79c083424b6.tar.gz
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 7344dc1..7113ae2 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_CPP_VERSION = fa34227d26e0b388e65b81936a2681952928f5be
+ZXING_CPP_VERSION = 0db7f855135222becff193671faae79c083424b6
 ZXING_CPP_SITE = $(call github,glassechidna,zxing-cpp,$(ZXING_CPP_VERSION))
 ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = COPYING
-- 
2.8.1
