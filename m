From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:01:08 +0100
Subject: [Buildroot] [git commit] package/radvd: bump to version 2.18
Message-ID: <20190324220643.6E72E81827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b63dc9bfef0ed3213344c71ec1615a8fb257c60f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd.hash | 5 +++--
 package/radvd/radvd.mk   | 3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index ac6014b776..9ade027d27 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,2 +1,3 @@
-# From http://www.litech.org/radvd/dist/radvd-2.12.tar.gz.sha256
-sha256	b070e77238e789e298a82cba2b1bfb0b0180b4ebc1adfc4e75058adfdbff747b	radvd-2.12.tar.xz
+# From http://www.litech.org/radvd/dist/radvd-2.18.tar.gz.sha256
+sha256	4f573e36b96ba92d03b5abbbd5f059b9c8994967812c77852f44049ac5a448fd	radvd-2.18.tar.gz
+sha256	40a6db00cf0b97f031eaa6c6e87157788f40ced1b88e3ea6d78779bd2a39dc80	COPYRIGHT
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 88221875a3..5679e613d4 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.12
-RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
+RADVD_VERSION = 2.18
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
 # We need to ignore <linux/if_arp.h>, because radvd already includes
