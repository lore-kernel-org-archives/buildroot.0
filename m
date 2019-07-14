From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:35:36 +0200
Subject: [Buildroot] [git commit] package/xapian: bump to version 1.4.11
Message-ID: <20190714103359.6B7F3802B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c072ec18c0cbbabae49bffcbcca313a2ee60cdc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xapian/xapian.hash | 4 +++-
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 4e41402274..e31b9dad4c 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,3 +1,5 @@
+# From https://lists.xapian.org/pipermail/xapian-discuss/2019-March/009736.html
+sha256 9f16b2f3e2351a24034d7636f73566ab74c3f0729e9e0492934e956b25c5bc07 xapian-core-1.4.11.tar.xz
+
 # locally computed
-sha256 cde9c39d014f04c09b59d9c21551db9794c10617dc69ab4c9826352a533df5cc xapian-core-1.4.9.tar.xz
 sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42 COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index df039d4440..e02d4cc8b1 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.9
+XAPIAN_VERSION = 1.4.11
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
