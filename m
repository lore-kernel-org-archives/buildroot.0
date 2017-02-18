From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Feb 2017 15:54:00 +0100
Subject: [Buildroot] [PATCH for-next] package/enlightenment: bump to version
	0.21.6
Message-ID: <20170218145400.10527-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 1548f20..777ee2d 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://www.enlightenment.org/news/e-0.21.5-release
-sha256	f0745a660f70851c4ada9866b2a525185bfc5cd1685aa86e4cdb68f2c1c154bb 	enlightenment-0.21.5.tar.xz
+# From https://www.enlightenment.org/news/e-0.21.6-release
+sha256	ed0714b54d692cbcec412bdb169e5360355347ce775d27d6ae0cee25111b563d 	enlightenment-0.21.6.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 7037afe..6529287 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.21.5
+ENLIGHTENMENT_VERSION = 0.21.6
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
-- 
2.9.3
