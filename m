From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  3 May 2017 15:46:34 +0300
Subject: [Buildroot] [PATCH 1/2] picocom: bump to version 2.2
Message-ID: <04e1e4d95a425dfc0e0650088cb0120a9f3e46a8.1493815595.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/picocom/picocom.hash | 2 +-
 package/picocom/picocom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
index 674b6209d3bd..16db03e10485 100644
--- a/package/picocom/picocom.hash
+++ b/package/picocom/picocom.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6b152fc5f816eaef6b86336a4cec7cf1496b7c712061e5aea5a36f143a0b09ed  picocom-2.1.tar.gz
+sha256 3e3904158d675541f0fcfdcd1f671b38445338f536080f5de8d6674b5f33d4ce  picocom-2.2.tar.gz
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 8e77f1d425c4..07bda0e745cd 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 2.1
+PICOCOM_VERSION = 2.2
 PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
-- 
2.11.0
