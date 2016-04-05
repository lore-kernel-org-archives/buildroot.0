From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 21:31:55 +0200
Subject: [Buildroot] [git commit] librsvg: bump to version 2.40.15
Message-ID: <20160405194001.A63E28024D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e67b75ed9b900ba4a39196177f868ccfc9d98c82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
