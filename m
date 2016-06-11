From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:05:51 +0200
Subject: [Buildroot] [git commit] librsvg: bump to version 2.40.16
Message-ID: <20160611130625.34137816A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e4b983970ed4091394fd5d3cabaf2f3d2ab4cbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 71d96c8..f9844b2 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/librsvg-2.40.15.sha256sum
-sha256	d9cac4a123eec6e553a26e120979bab7425def9ae7ce7c079eba5e4a45db05f4	librsvg-2.40.15.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/librsvg-2.40.16.sha256sum
+sha256	d48bcf6b03fa98f07df10332fb49d8c010786ddca6ab34cbba217684f533ff2e	librsvg-2.40.16.tar.xz
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index dadffe8..b711de4 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.40
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).15
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).16
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
