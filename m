From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:31:30 +0200
Subject: [Buildroot] [git commit branch/next] mosh: bump to version 1.3.0
Message-ID: <20170531193144.4D2C5827CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08660e224f60cc9da876eacda1d8d7322704c2f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gon??alo Salazar <glbsalazar@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosh/Config.in | 2 +-
 package/mosh/mosh.hash | 4 ++--
 package/mosh/mosh.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index e0ff2cf..96c3b94 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -24,4 +24,4 @@ config BR2_PACKAGE_MOSH
 	  allows roaming, and provides speculative local echo and line editing
 	  of user keystrokes.
 
-	  https://mosh.mit.edu
+	  https://mosh.org
diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
index 31f59c7..4dae51d 100644
--- a/package/mosh/mosh.hash
+++ b/package/mosh/mosh.hash
@@ -1,2 +1,2 @@
-# From https://mailman.mit.edu/pipermail/mosh-users/2016-August/000330.html
-sha256 7e82b7fbfcc698c70f5843bb960dadb8e7bd7ac1d4d2151c9d979372ea850e85 mosh-1.2.6.tar.gz
+# From https://mailman.mit.edu/pipermail/mosh-users/2017-March/000340.html
+sha256 320e12f461e55d71566597976bd9440ba6c5265fa68fbf614c6f1c8401f93376 mosh-1.3.0.tar.gz
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index 0da9105..06502f6 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MOSH_VERSION = 1.2.6
-MOSH_SITE = https://mosh.mit.edu
+MOSH_VERSION = 1.3.0
+MOSH_SITE = https://mosh.org
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
