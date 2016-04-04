From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Apr 2016 18:12:58 -0300
Subject: [Buildroot] [PATCH] librsvg: bump to version 2.40.15
Message-ID: <1459804378-5083-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 5147cda..71d96c8 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/librsvg-2.40.13.sha256sum
-sha256	4d6ea93ec05f5dabe7262d711d246a0a99b2311e215360dd3dcabd6afe3b9804	librsvg-2.40.13.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/librsvg-2.40.15.sha256sum
+sha256	d9cac4a123eec6e553a26e120979bab7425def9ae7ce7c079eba5e4a45db05f4	librsvg-2.40.15.tar.xz
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 80d2cba..dadffe8 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.40
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).13
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).15
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-- 
2.7.3
