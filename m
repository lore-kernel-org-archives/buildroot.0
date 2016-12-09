From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Dec 2016 09:55:17 -0300
Subject: [Buildroot] [PATCH] poppler: bump to version 0.49.0
Message-ID: <1481288117-27569-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 533178f..6c69589 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	85a003968074c85d8e13bf320ec47cef647b496b56dcff4c790b34e5482fef93	poppler-0.48.0.tar.xz
+sha256	14485f0e1e43dcddf49cfc02c2ccb92910ba3e0e91e06f4bd2642ec00cb3a79f	poppler-0.49.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 202eac2..d2f8c2e 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.48.0
+POPPLER_VERSION = 0.49.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
-- 
2.7.3
