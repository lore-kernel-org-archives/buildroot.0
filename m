From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 22:26:28 +0200
Subject: [Buildroot] [git commit] package/rauc: add license file details
Message-ID: <20190611202957.83F058F600@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a269163f4da274adbeae98ddbc9010aa9c7b400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/rauc.hash | 1 +
 package/rauc/rauc.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index c7b73f79ed..ad4f74409e 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,4 @@
 # Locally calculated, after verifying against
 # https://github.com/rauc/rauc/releases/download/v1.1/rauc-1.1.tar.xz.asc
 sha256 e49086da3a72564806963d2309e8e2b255492fb314db61f84c9b4cebece98e3f rauc-1.1.tar.xz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index fa324e6ddb..47ce242ca1 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -8,6 +8,7 @@ RAUC_VERSION = 1.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
+RAUC_LICENSE_FILES = COPYING
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
 
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
