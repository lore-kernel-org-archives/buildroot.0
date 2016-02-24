From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 23:30:42 +0100
Subject: [Buildroot] [git commit branch/next] debianutils: bump to version
	4.7
Message-ID: <20160224223213.5745D818DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eec7853b253ff02b9ff44ec972ba165e5b56cd22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/debianutils/debianutils.hash | 4 ++--
 package/debianutils/debianutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index 43f1225..4d1b574 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.5.1.dsc
-sha256	a531c23e0105fe01cfa928457a8343a1e947e2621b3cd4d05f4e9656020c63b7	debianutils_4.5.1.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.7.dsc
+sha256	a269cacd40f52f2fa5d5636357714a49e8538459c16d77772efaa23711fe53d9	debianutils_4.7.tar.xz
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index 5c78504..17f0240 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.5.1
+DEBIANUTILS_VERSION = 4.7
 DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
-DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20150526T034723Z/pool/main/d/debianutils
+DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20160126T220153Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 # Make sure we override the busybox tools, such as which
 DEBIANUTILS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
