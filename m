From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 19 Jun 2019 22:58:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/psplash: add license file details
Message-ID: <1560977915-29794-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add copyright file.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/psplash/psplash.hash | 1 +
 package/psplash/psplash.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 68c6ffa..c886569 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 aaddb20ef892dfb03d4e046cc634159bbcdfe555f7291652dde2b7d4cf491289  psplash-5b3c1cc28f5abdc2c33830150b48b278cc4f7bca.tar.gz
+sha256 f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index fe00978..4a2e0de 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -7,6 +7,7 @@
 PSPLASH_VERSION = 5b3c1cc28f5abdc2c33830150b48b278cc4f7bca
 PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPL-2.0+
+PSPLASH_LICENSE_FILES = COPYING
 PSPLASH_AUTORECONF = YES
 
 define PSPLASH_INSTALL_INIT_SYSTEMD
-- 
2.7.4
