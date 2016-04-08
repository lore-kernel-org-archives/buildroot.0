From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  8 Apr 2016 14:18:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.87
Message-ID: <1460117903-28107-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 8f4338b..83be731 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	7756deafd0583776e091f2efcba9b36203e668cf420d8876f314980803636eb3	exim-4.86.2.tar.bz2
+# Locally calculated
+sha256	74691e0dff4d1b5d387e9c33c86f96a8f6d2adbc781c0dec9d2061a847b07dc9	exim-4.87.tar.bz2
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 73044c2..c967fef 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.86.2
+EXIM_VERSION = 4.87
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
-- 
2.8.0.rc3
