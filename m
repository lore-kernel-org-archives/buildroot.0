From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 28 Apr 2021 23:50:18 +0200
Subject: [Buildroot] [PATCH] package/clinfo: bump to version 3.0.21.02.21
In-Reply-To: <20210428215020.3748123-1-romain.naour@gmail.com>
References: <20210428215020.3748123-1-romain.naour@gmail.com>
Message-ID: <20210428215020.3748123-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/clinfo/clinfo.hash | 2 +-
 package/clinfo/clinfo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clinfo/clinfo.hash b/package/clinfo/clinfo.hash
index 2528a9e6c8..e433b6740c 100644
--- a/package/clinfo/clinfo.hash
+++ b/package/clinfo/clinfo.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  3c506083e72e9ee09fc7d5de513be7c5eff0284f198a60fb60ab493f6f0a549a  clinfo-3.0.20.11.20.tar.gz
+sha256  e52f5c374a10364999d57a1be30219b47fb0b4f090e418f2ca19a0c037c1e694  clinfo-3.0.21.02.21.tar.gz
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  legalcode.txt
 sha256  2a7a9321be169ea6edbc6b1010e8f7bb0f4c1482a2f65c34a49e9719f129b79a  LICENSE
diff --git a/package/clinfo/clinfo.mk b/package/clinfo/clinfo.mk
index 404e5f7535..d4c1df90d4 100644
--- a/package/clinfo/clinfo.mk
+++ b/package/clinfo/clinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLINFO_VERSION = 3.0.20.11.20
+CLINFO_VERSION = 3.0.21.02.21
 CLINFO_SITE = $(call github,Oblomov,clinfo,$(CLINFO_VERSION))
 CLINFO_LICENSE = CC0-1.0
 CLINFO_LICENSE_FILES = legalcode.txt LICENSE
-- 
2.30.2
