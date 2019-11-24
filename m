From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 22:46:44 +0100
Subject: [Buildroot] [git commit branch/next] package/libndp: bump version
 to 1.7
Message-ID: <20191124213954.065D784009@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6274f4191335cf8c9b88796f59da8af04e3abf7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libndp/libndp.hash | 2 +-
 package/libndp/libndp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libndp/libndp.hash b/package/libndp/libndp.hash
index fd28dce825..8d4b6ef524 100644
--- a/package/libndp/libndp.hash
+++ b/package/libndp/libndp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 565d6c4167f83ec697c762ea002f23e8f0b00828d0749b1ce928f068543e5aad  libndp-1.6.tar.gz
+sha256 44be73630ee785ed9f571f9aaaeba0e1d375fa337fd841270034c813b5b0e6fd  libndp-1.7.tar.gz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index 50a1cc9581..3783eb135a 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = 1.6
+LIBNDP_VERSION = 1.7
 LIBNDP_SITE = $(call github,jpirko,libndp,v$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPL-2.1+
 LIBNDP_LICENSE_FILES = COPYING
