From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 28 Aug 2019 02:47:22 -0300
Subject: [Buildroot] [PATCH] package/stella: bump version to 6.0.1
Message-ID: <1566971242-11272-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/stella/stella.hash | 2 +-
 package/stella/stella.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 72a28f70a4ad..b0b8aeec6919 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 17aa8c5f08e09c51dd7dd933f93b0a1929d2832bd66f3bd994fa50ebb2b9a2b1  stella-6.0-src.tar.xz
+sha256 d611f98bb35ed9eacfb63826b12b4e8b67b874a2a87019d4bdaf1e7f4724c40d  stella-6.0.1-src.tar.xz
 sha256 c946a9ee632ee40111bad6e81c84b3e0bc1e49183b7a809f05d4d371f5f587bb  Copyright.txt
 sha256 58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index a4df6ea65946..01520532ee58 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.0
+STELLA_VERSION = 6.0.1
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.7.4
