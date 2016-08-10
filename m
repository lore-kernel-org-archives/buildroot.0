From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 10 Aug 2016 18:35:45 -0400
Subject: [Buildroot] [PATCH 1/2] fwup: bump version to v0.8.2
Message-ID: <1470868546-8237-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version brings in several bug fixes: one of which partially
addresses Buildroot autobuilder failures for static configurations.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/fwup/fwup.hash | 2 +-
 package/fwup/fwup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 6d9a1ea..e21eff0 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	  56d30f4ddf7929d693c022455978aebef1f6adb5896437a199bde43d5459da68	fwup-v0.8.0.tar.gz
+sha256   64c3a0ac38dc11c0c05b2588a89638cbc37f5552ac0f1c290f7ee5365f2bba49      fwup-v0.8.2.tar.gz
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index ae85716..3d3e3be 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FWUP_VERSION = v0.8.0
+FWUP_VERSION = v0.8.2
 FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
-- 
2.7.4
