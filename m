From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 May 2019 18:46:39 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/nbd: bump to version 3.19
Message-ID: <20190521164639.21877-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nbd/nbd.hash | 10 +++++++---
 package/nbd/nbd.mk   |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index 03234fd876..fab14072c9 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,3 +1,7 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.13/
-md5	f52a4ef8979d81e6c15a745236582fdf	nbd-3.15.2.tar.xz
-sha1	c8248dd76641a31189735407cd4d55fe63969c08	nbd-3.15.2.tar.xz
+# From http://sourceforge.net/projects/nbd/files/nbd/3.19/
+md5	162da84302abb5b9be06143c7943a642	nbd-3.19.tar.xz
+sha1	97edd98f7323a2fcd0dcf441f307d348cdbbb807	nbd-3.19.tar.xz
+
+# Locally calculated
+sha256	b4466412f13e057659f25d35e1e8e181afd62c7179bff22a6add81445ecb8690	nbd-3.19.tar.xz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 82de1c487d..484f3e695b 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.15.2
+NBD_VERSION = 3.19
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-- 
2.20.1
