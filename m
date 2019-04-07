From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Sun,  7 Apr 2019 22:06:29 +0300
Subject: [Buildroot] [PATCH 1/1] [v2] package/freerdp: bump version to
 2.0.0-rc4
Message-ID: <20190407190629.5380-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>

Add support to set tls security level (for openssl >= 1.1.0), for RDP
protocol version 10(needed for windows 10 and windows server 2016). Also have some fix and features, see
https://github.com/FreeRDP/FreeRDP/commit/e21b72c95f857817b4b32b5ef5406355c005a9e8

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 package/freerdp/freerdp.hash | 2 +-
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 44b7b876a9..7a6859551f 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a09e338b996fada44bf1277f423240d0fa82289799e2e5dea9d9c63201554de1 freerdp-2.0.0-rc2.tar.gz
+sha256 3406f3bfab63f81c1533029a5bf73949ff60f22f6e155c5a08005b8b8afe6d49 freerdp-2.0.0-rc4.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 91e4ae47ee..0f32ff4718 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.0.0-rc2
+FREERDP_VERSION = 2.0.0-rc4
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.20.1
