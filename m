From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 10:44:19 -0300
Subject: [Buildroot] [PATCH] wireless-regdb: bump to version 2015.10.13
Message-ID: <1444830259-17307-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 2b46b45..f377fa2 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	06dbcfcd4c0835440b0787084e726b7ea1a707acfb53e17a3be08efbbbbf4ee2	wireless-regdb-2015.09.25.tar.xz
+sha256	1ec943322a63625b753acfd9a712044219b76961f16f9853f8b54aaa2a775622	wireless-regdb-2015.10.13.tar.xz
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 7ce580c..406790f 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2015.09.25
+WIRELESS_REGDB_VERSION = 2015.10.13
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.4.9
