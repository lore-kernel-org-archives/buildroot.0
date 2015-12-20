From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 Dec 2015 17:34:36 -0300
Subject: [Buildroot] [PATCH] debianutils: bump to version 4.5.1
Message-ID: <1450643676-16489-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/debianutils/debianutils.hash | 4 ++--
 package/debianutils/debianutils.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index 089dd42..43f1225 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.4.dsc
-sha256	190850cdd6b5302e0a1ba1aaed1bc7074d67d3bd8d04c613f242f7145afa53a6	debianutils_4.4.tar.gz
+# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.5.1.dsc
+sha256	a531c23e0105fe01cfa928457a8343a1e947e2621b3cd4d05f4e9656020c63b7	debianutils_4.5.1.tar.xz
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index dd78774..5c78504 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.4
-DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.gz
-DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20130728T034252Z/pool/main/d/debianutils
+DEBIANUTILS_VERSION = 4.5.1
+DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
+DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20150526T034723Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 # Make sure we override the busybox tools, such as which
 DEBIANUTILS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-- 
2.4.10
