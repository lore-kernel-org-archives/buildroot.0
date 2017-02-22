From: Wojciech Nizinski <niziak@spox.org>
Date: Wed, 22 Feb 2017 11:19:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/turbolua: bump version to v2.1.0
Message-ID: <1487758746-22935-1-git-send-email-niziak@spox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wojciech Nizinski <niziak@spox.org>
---
 package/turbolua/turbolua.hash | 2 +-
 package/turbolua/turbolua.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index d460b4f66..40917ef27 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 bff771b6a670f764366eff50e1644f1c5d8d526324e0b6adfda42d9f69791833 turbolua-6fbc5cbfed1cc8c3820d4c1bfb55258c764040f0.tar.gz
+sha256 c03ec98b6b12ae8620a24fa8cc116a0ada4260bfaa1094fcfe8be42f678f7a86 turbolua-ee71ef081254c38ecb0f5cd8ea5eeea9a7aa23cb.tar.gz
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index bf9e27f16..de3344b1a 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TURBOLUA_VERSION = 6fbc5cbfed1cc8c3820d4c1bfb55258c764040f0
+TURBOLUA_VERSION = ee71ef081254c38ecb0f5cd8ea5eeea9a7aa23cb
 TURBOLUA_SITE = $(call github,kernelsauce,turbo,$(TURBOLUA_VERSION))
 TURBOLUA_DEPENDENCIES = luajit
 TURBOLUA_LICENSE = Apache-2.0
-- 
2.11.0
