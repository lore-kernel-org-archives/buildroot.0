From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Jan 2021 09:19:51 +0100
Subject: [Buildroot] [git commit] package/libgtk2: bump to version 2.24.33
Message-ID: <20210106080219.98A868156C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=170cdf8872b403deed2eb169e8fb261d860b0f79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk2/libgtk2.hash | 6 +++---
 package/libgtk2/libgtk2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgtk2/libgtk2.hash b/package/libgtk2/libgtk2.hash
index 49bec78da1..9b10a1f0ce 100644
--- a/package/libgtk2/libgtk2.hash
+++ b/package/libgtk2/libgtk2.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.32.sha256sum
-sha256 b6c8a93ddda5eabe3bfee1eb39636c9a03d2a56c7b62828b359bf197943c582e  gtk+-2.24.32.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.33.sha256sum
+sha256  ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da  gtk+-2.24.33.tar.xz
 
 # Hash for license file:
-sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 9b7d39a532..bcdf3e5d8c 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).32
+LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).33
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
