From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:03:37 +0200
Subject: [Buildroot] [git commit] wireless-regdb: bump to version 2014.06.13
Message-ID: <20140618123419.EFE129D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c4bf21bed274c9335d6dcfba5d56811f3e34df9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireless-regdb/wireless-regdb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index a3d71ae..f4d3195 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2014.05.19
+WIRELESS_REGDB_VERSION = 2014.06.13
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
