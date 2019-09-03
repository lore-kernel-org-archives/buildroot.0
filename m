From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  3 Sep 2019 13:53:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/less: bump to version 530
Message-ID: <20190903115358.35061-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/less/less.hash | 3 ++-
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 3a6c799aae..23febacac8 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 f3dc8455cb0b2b66e0c6b816c00197a71bf6d1787078adeee0bcf2aea4b12706  less-487.tar.gz
+# using DSA key F153A7C833235259
+sha256 503f91ab0af4846f34f0444ab71c4b286123f0044a4964f1ae781486c617f2e2  less-530.tar.gz
diff --git a/package/less/less.mk b/package/less/less.mk
index ef3643c0aa..4f6a7c5e77 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 487
+LESS_VERSION = 530
 LESS_SITE = $(BR2_GNU_MIRROR)/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.21.0
