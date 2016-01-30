From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 14:17:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/leafpad: bump version to 0.8.18.1
Message-ID: <1454159823-23541-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/leafpad/leafpad.hash | 2 +-
 package/leafpad/leafpad.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafpad/leafpad.hash b/package/leafpad/leafpad.hash
index 5c4cd78..be56d41 100644
--- a/package/leafpad/leafpad.hash
+++ b/package/leafpad/leafpad.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a047d2f82fb88b361ae7f382b4cae8ce1a30bef5ead503a68ae886d19be5fec0	leafpad-0.8.18.tar.gz
+sha256	959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c	leafpad-0.8.18.1.tar.gz
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 6366cab..9551a75 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEAFPAD_VERSION = 0.8.18
+LEAFPAD_VERSION = 0.8.18.1
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
 LEAFPAD_LICENSE = GPLv2+
-- 
2.7.0.rc3
