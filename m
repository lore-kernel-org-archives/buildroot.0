From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Nov 2018 09:04:58 +0100
Subject: [Buildroot] [git commit] package/fontconfig: bump version to 2.13.1
Message-ID: <20181202071601.9574981829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2408d11abf500ef4856ba0d9d6f23fbcde0df13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fontconfig/fontconfig.hash | 4 ++--
 package/fontconfig/fontconfig.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index e9963f6f3f..5243c09615 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/fontconfig/2017-July/005961.html
-sha256 668293fcc4b3c59765cdee5cee05941091c0879edcc24dfec5455ef83912e45c  fontconfig-2.12.4.tar.bz2
+# From https://lists.freedesktop.org/archives/fontconfig/2018-August/006324.html
+sha256 f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741 fontconfig-2.13.1.tar.bz2
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 71a0b4579c..9ac18886d3 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.12.4
+FONTCONFIG_VERSION = 2.13.1
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_INSTALL_STAGING = YES
