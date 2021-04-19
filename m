From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:29:15 +0200
Subject: [Buildroot] [git commit] package/bitwise: bump version to 0.42
Message-ID: <20210419210252.BBAAC83995@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18c3d44a0ad04dc0b4aa4adfe0e61b8d78f92d0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitwise/bitwise.hash | 2 +-
 package/bitwise/bitwise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
index 061c5e529e..5493c642a6 100644
--- a/package/bitwise/bitwise.hash
+++ b/package/bitwise/bitwise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c  bitwise-v0.41.tar.gz
+sha256  d3d43cef47bf8f49e85f7ed381c3eaf1df921ca51805e0962f1a97a517e1d1d2  bitwise-v0.42.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
index 581eac6fb4..237f7753cd 100644
--- a/package/bitwise/bitwise.mk
+++ b/package/bitwise/bitwise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITWISE_VERSION = 0.41
+BITWISE_VERSION = 0.42
 BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/v$(BITWISE_VERSION)
 BITWISE_SOURCE = bitwise-v$(BITWISE_VERSION).tar.gz
 BITWISE_DEPENDENCIES = ncurses readline
