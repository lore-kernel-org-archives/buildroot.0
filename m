From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Jan 2021 17:09:16 +0100
Subject: [Buildroot] [PATCH] package/clinfo: bump to version 3.0.20.11.20
Message-ID: <20210107160916.1156610-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces).

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/clinfo/clinfo.hash | 6 +++---
 package/clinfo/clinfo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/clinfo/clinfo.hash b/package/clinfo/clinfo.hash
index d5766e6322..2528a9e6c8 100644
--- a/package/clinfo/clinfo.hash
+++ b/package/clinfo/clinfo.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256 64b02e68ccff3b95437bd0bd70dcb88438c58adec16a7145a5d4e5c26a898ccf clinfo-2.2.18.03.26.tar.gz
-sha256 a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499 legalcode.txt
-sha256 2a7a9321be169ea6edbc6b1010e8f7bb0f4c1482a2f65c34a49e9719f129b79a LICENSE
+sha256  3c506083e72e9ee09fc7d5de513be7c5eff0284f198a60fb60ab493f6f0a549a  clinfo-3.0.20.11.20.tar.gz
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  legalcode.txt
+sha256  2a7a9321be169ea6edbc6b1010e8f7bb0f4c1482a2f65c34a49e9719f129b79a  LICENSE
diff --git a/package/clinfo/clinfo.mk b/package/clinfo/clinfo.mk
index cf08692316..404e5f7535 100644
--- a/package/clinfo/clinfo.mk
+++ b/package/clinfo/clinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLINFO_VERSION = 2.2.18.03.26
+CLINFO_VERSION = 3.0.20.11.20
 CLINFO_SITE = $(call github,Oblomov,clinfo,$(CLINFO_VERSION))
 CLINFO_LICENSE = CC0-1.0
 CLINFO_LICENSE_FILES = legalcode.txt LICENSE
-- 
2.25.4
