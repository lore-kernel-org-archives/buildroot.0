From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Jan 2016 20:56:30 -0300
Subject: [Buildroot] [PATCH] nbd: bump to version 3.13
Message-ID: <1452124590-4248-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nbd/nbd.hash | 6 +++---
 package/nbd/nbd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index 306e11b..c90682f 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.11/
-md5	73d11644a28b9f335292cdb3bdc4b74b	nbd-3.11.tar.xz
-sha1	a9823a656ef3411c7a14f3c1ae843d92a9141476	nbd-3.11.tar.xz
+# From http://sourceforge.net/projects/nbd/files/nbd/3.13/
+md5	784be37497cc2f9a53c67c8c77d1676d	nbd-3.13.tar.xz
+sha1	e43674a2d2b42d20719cba3149748e8f5683e554	nbd-3.13.tar.xz
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index fee2cf8..d91c2d7 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.11
+NBD_VERSION = 3.13
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-- 
2.4.10
