From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Mar 2016 23:03:45 +0200
Subject: [Buildroot] [git commit] gtkmm3: bump to version 3.20.0
Message-ID: <20160328210554.6FD3A7FAAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf8909ee4c7d9d31b8eb4d3c9264fb87d54f6af2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtkmm3/gtkmm3.hash | 4 ++--
 package/gtkmm3/gtkmm3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index fcbadab..3ab2513 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.18/gtkmm-3.18.0.sha256sum
-sha256	829fa113daed74398c49c3f2b7672807f58ba85d0fa463f5bc726e1b0138b86b	gtkmm-3.18.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.20/gtkmm-3.20.0.sha256sum
+sha256	f021573f870df8a0b40ba37a7864c37be517c7a88cc957a193dbab28449b028a	gtkmm-3.20.0.tar.xz
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index a895d85..b62d592 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTKMM3_VERSION_MAJOR = 3.18
+GTKMM3_VERSION_MAJOR = 3.20
 GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
