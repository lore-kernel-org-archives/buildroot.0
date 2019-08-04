From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 18:32:04 +0200
Subject: [Buildroot] [git commit] package/xapian: bump to version 1.4.12
Message-ID: <20190804162952.301578E361@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab2c051e95e6d71d80996b92002b0439b0f6c580
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index e31b9dad4c..8e8cda8f39 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2019-March/009736.html
-sha256 9f16b2f3e2351a24034d7636f73566ab74c3f0729e9e0492934e956b25c5bc07 xapian-core-1.4.11.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2019-July/009742.html
+sha256 4f8a36da831712db41d38a039fefb5251869761a58be28ba802994bb930fac7c xapian-core-1.4.12.tar.xz
 
 # locally computed
 sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42 COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index e02d4cc8b1..fd2693b42c 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.11
+XAPIAN_VERSION = 1.4.12
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
