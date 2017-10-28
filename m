From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Oct 2017 09:53:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.85
Message-ID: <20171028075335.23212-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Needed to compute the hash locally because upstream did not release an
announcement for the new version yet.

 package/libdrm/libdrm.hash | 7 ++-----
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index be24658b41..109be315d0 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-October/154645.html
-md5 35b9544bc2ad864acd1abaa1a2b99092  libdrm-2.4.84.tar.bz2
-sha1 3a8835aaef89648757593f00008de9eff95990dd  libdrm-2.4.84.tar.bz2
-sha256 7ae9c24d91139ac9a2cdee06fe46dbe1c401a1eda1c0bd2a6d1ecf72f479e0aa  libdrm-2.4.84.tar.bz2
-sha512 860ebc5fa934edee97e9e7e13aaa2f2e70a68b946f4f3893cd7f93b8296c10b3cd4ce4c23b1676eefe375286e6e2292b96e917d7976f65c61da3fa661e5e641a  libdrm-2.4.84.tar.bz2
+# Locally computed
+sha256 64e4cd87eaee38ae60b2984ef02b66159b9bdd33030040db2a04339cf15f6173  libdrm-2.4.85.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index da100b853b..e93864e556 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.84
+LIBDRM_VERSION = 2.4.85
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.11.0
