From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jan 2016 09:03:59 -0300
Subject: [Buildroot] [PATCH] librsvg: bump to version 2.40.13
Message-ID: <1452254639-10979-1-git-send-email-gustavo@zacarias.com.ar>
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
index 2920487..5147cda 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/librsvg-2.40.12.sha256sum
-sha256	ffe40c4378bf3899f4d679a475726bab03a127a5bdccddec86404cc329ffb550	librsvg-2.40.12.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/librsvg-2.40.13.sha256sum
+sha256	4d6ea93ec05f5dabe7262d711d246a0a99b2311e215360dd3dcabd6afe3b9804	librsvg-2.40.13.tar.xz
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 042aa10..80d2cba 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.40
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).12
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).13
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-- 
2.4.10
