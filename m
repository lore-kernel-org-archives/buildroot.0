From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 22:26:04 +0200
Subject: [Buildroot] [git commit] package/rauc: bump to version 1.1
Message-ID: <20190611202957.7C9A9814A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e00f12e6f8af182126f1e2cb7966f3e6cc962b25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See: https://github.com/rauc/rauc/releases/tag/v1.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 54c6c93229..c7b73f79ed 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v0.4/rauc-0.4.tar.xz.asc
-sha256 8875ab0d02b4cb38a211b236855361c18b874b385e6f18dde394ac699f2cf2aa rauc-1.0.tar.xz
+# https://github.com/rauc/rauc/releases/download/v1.1/rauc-1.1.tar.xz.asc
+sha256 e49086da3a72564806963d2309e8e2b255492fb314db61f84c9b4cebece98e3f rauc-1.1.tar.xz
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 3848a010b3..fa324e6ddb 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.0
+RAUC_VERSION = 1.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
