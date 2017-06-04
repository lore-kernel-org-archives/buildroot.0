From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jun 2017 15:08:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/gssdp: bump version to 1.0.2
Message-ID: <20170604130853.30223-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index b646d185b..aac5f74ec 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.0/gssdp-1.0.1.sha256sum:
-sha256	601d67f40bc28c067742b7c46f3018da96b364fd3e83f30ddac6e190e323d2e1	gssdp-1.0.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.0/gssdp-1.0.2.sha256sum:
+sha256 a1e17c09c7e1a185b0bd84fd6ff3794045a3cd729b707c23e422ff66471535dc  gssdp-1.0.2.tar.xz
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index e94c92448..2ce1f9b0b 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GSSDP_VERSION_MAJOR = 1.0
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).1
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).2
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.0+
-- 
2.11.0
