From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Dec 2016 21:30:02 +0100
Subject: [Buildroot] [git commit] debianutils: bump to version 4.8.1
Message-ID: <20161218203346.7482181963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad446bb3774b2474ce215f823308bfa1c16ccaa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/debianutils/debianutils.hash | 4 ++--
 package/debianutils/debianutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index 212d321..cd54e0b 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.8.dsc
-sha256	afa95bbe6b6fd3ef3c0c838b2d7232f09fabeff593ca4b5583cffa6748567ee2	debianutils_4.8.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.8.1.dsc
+sha256	2c395c0bdcfe89de30828b1d25cc5549ded5225a6d3625fbcb2cc0881ef5f026	debianutils_4.8.1.tar.xz
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index 566d0ad..83cf744 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.8
+DEBIANUTILS_VERSION = 4.8.1
 DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
-DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20160629T224408Z/pool/main/d/debianutils
+DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20161118T033019Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 # Make sure we override the busybox tools, such as which
 DEBIANUTILS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
