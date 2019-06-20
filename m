From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 16:01:59 +0200
Subject: [Buildroot] [git commit] package/psplash: add license file details
Message-ID: <20190620140513.830778270E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32a0d3a8e2cf78f0f36b948ba5ea5aa85c2ceeb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/psplash/psplash.hash | 1 +
 package/psplash/psplash.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 68c6ffa8a9..c8865697c4 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 aaddb20ef892dfb03d4e046cc634159bbcdfe555f7291652dde2b7d4cf491289  psplash-5b3c1cc28f5abdc2c33830150b48b278cc4f7bca.tar.gz
+sha256 f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index fe009785b9..4a2e0de5ce 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -7,6 +7,7 @@
 PSPLASH_VERSION = 5b3c1cc28f5abdc2c33830150b48b278cc4f7bca
 PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPL-2.0+
+PSPLASH_LICENSE_FILES = COPYING
 PSPLASH_AUTORECONF = YES
 
 define PSPLASH_INSTALL_INIT_SYSTEMD
