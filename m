From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Apr 2020 19:54:57 +0300
Subject: [Buildroot] [PATCH] package/lldpd: bump to version 1.0.5
Message-ID: <449140f382302aa015df218429e2e071b6ed55ba.1586796897.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add tarball signature information.

Use https for site.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lldpd/lldpd.hash | 8 +++++---
 package/lldpd/lldpd.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index c12e004784c8..4283b4aec8ed 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256 5319bc032fabf1008d5d91e280276aa7f1bbfbb70129d8526cd4526d7c22724f  lldpd-1.0.4.tar.gz
-sha256 0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
+# Locally computed after checking gpg key
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.5.tar.gz.gpg
+# using key AEF2348766F371C689A7360095A42FE8353525F9
+sha256  2dd3b212f4dbabfcbb2794c0010b245f9f8e74b387984e757be6243a74c6cb99  lldpd-1.0.5.tar.gz
+sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 264323a879e5..585d1ed7bad2 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.4
-LLDPD_SITE = http://media.luffy.cx/files/lldpd
+LLDPD_VERSION = 1.0.5
+LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
 	host-pkgconf \
-- 
2.25.1
