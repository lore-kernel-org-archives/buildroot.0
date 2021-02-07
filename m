From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2021 13:58:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgsm: bump version to 1.0.19
Message-ID: <20210207125818.1441818-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgsm/libgsm.hash | 2 +-
 package/libgsm/libgsm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgsm/libgsm.hash b/package/libgsm/libgsm.hash
index 32e20c8f48..88d2573f56 100644
--- a/package/libgsm/libgsm.hash
+++ b/package/libgsm/libgsm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  04f68087c3348bf156b78d59f4d8aff545da7f6e14f33be8f47d33f4efae2a10  gsm-1.0.18.tar.gz
+sha256  4903652f68a8c04d0041f0d19b1eb713ddcd2aa011c5e595b3b8bca2755270f6  gsm-1.0.19.tar.gz
 sha256  81c68a3374937ed9b5e4929c709e81a2c4b35b5d1f450ecf8c473e2daea46ff6  COPYRIGHT
diff --git a/package/libgsm/libgsm.mk b/package/libgsm/libgsm.mk
index b9ae7d3eeb..e3ebee4b11 100644
--- a/package/libgsm/libgsm.mk
+++ b/package/libgsm/libgsm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSM_VERSION = 1.0.18
+LIBGSM_VERSION = 1.0.19
 LIBGSM_SOURCE = gsm-$(LIBGSM_VERSION).tar.gz
 LIBGSM_SITE = http://www.quut.com/gsm
 LIBGSM_LICENSE = gsm
-- 
2.29.2
