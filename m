From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 19:56:18 +0100
Subject: [Buildroot] [git commit] wireless-regdb: bump to version 2015.10.22
Message-ID: <20151029190717.58E567FAF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05072f6ab5d9ad5c420425d052cd66de6182a698
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireless-regdb/wireless-regdb.hash |    2 +-
 package/wireless-regdb/wireless-regdb.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index f377fa2..4c98067 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	1ec943322a63625b753acfd9a712044219b76961f16f9853f8b54aaa2a775622	wireless-regdb-2015.10.13.tar.xz
+sha256	19ef80c2b9d24f0c483c32294258640b2510df1775ea1c6323e84cced02f1612	wireless-regdb-2015.10.22.tar.xz
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 406790f..b82bbce 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2015.10.13
+WIRELESS_REGDB_VERSION = 2015.10.22
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
