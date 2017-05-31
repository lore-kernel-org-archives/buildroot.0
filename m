From: =?UTF-8?q?Gon=C3=A7alo=20Salazar?= <glbsalazar@gmail.com>
Date: Wed, 31 May 2017 20:08:56 +0100
Subject: [Buildroot] [PATCH 1/1] mosh: bump to version 1.3.0
Message-ID: <1496257736-10820-1-git-send-email-glbsalazar@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gon?alo Salazar <glbsalazar@gmail.com>
---
 package/mosh/Config.in | 2 +-
 package/mosh/mosh.hash | 4 ++--
 package/mosh/mosh.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 1806520..f9d36e9 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -31,4 +31,4 @@ config BR2_PACKAGE_MOSH
 	  with a version above 1.3.0 and the --no-ssh-pty option needs to be passed
 	  when starting the connection.
 
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
-- 
2.7.4
