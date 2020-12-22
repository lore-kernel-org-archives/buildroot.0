From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 15:16:51 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/rauc: bump to
 version 1.3
Message-ID: <20201222140041.611E3885D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55b00b50d0da3d824c82b1b7ad57c4eff2937d4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

See: https://github.com/rauc/rauc/releases/tag/v1.3

And update hash file formatting (2 spaces).

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce6b0ace35ff176e9116227bba7952874b026305)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.hash | 6 +++---
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 54760347c7..b73eb60d86 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.2/rauc-1.2.tar.xz.asc
-sha256 224683fc1fac50ccb89128aa786445cd8e26bb25deafd4410e0807187376e661 rauc-1.2.tar.xz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
+# https://github.com/rauc/rauc/releases/download/v1.3/rauc-1.3.tar.xz.asc
+sha256  4f6144447254753fcd19f2c5c70e79fa91d27253185b8928436f01528aa65e6c  rauc-1.3.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 7e09ba9a8d..a827c5e9d3 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.2
+RAUC_VERSION = 1.3
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
