From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 16:30:16 +0200
Subject: [Buildroot] [git commit] gupnp: bump to version 0.99.0
Message-ID: <20160902142941.AD6637FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df3df495c4ed0e3611cd845c769dd5edb97a7eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index e0082ac..6bdc0c0 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/0.20/gupnp-0.20.18.sha256sum:
-sha256	c5e0e11061f8d0ff9c8dccc196f39c45a49c0153c9a72abf6290ab34d1cbb021	gupnp-0.20.18.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/0.99/gupnp-0.99.0.sha256sum:
+sha256	695c745ae7ecef9482bd91821d84bb98764cbcca0d0f71acb6d46ac1be23a1be	gupnp-0.99.0.tar.xz
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index f7c32b5..fe80838 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_VERSION_MAJOR = 0.20
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).18
+GUPNP_VERSION_MAJOR = 0.99
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).0
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPLv2+
