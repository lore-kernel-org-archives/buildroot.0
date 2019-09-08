From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:12:29 -0700
Subject: [Buildroot] [PATCH 20/27] package/xtables-addons: bump to version
 3.4
Message-ID: <20190908161229.27032-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for LICENSE

This version works with linux kernel 5.0 and newer

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/xtables-addons/xtables-addons.hash | 7 +++----
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 9aa9c0e539..5ecc4197b7 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,4 +1,3 @@
-# From https://sourceforge.net/projects/xtables-addons/files/Xtables-addons/
-sha1	70ace437ec84d9ec1970505cecf270ed0cbd273e	xtables-addons-2.12.tar.xz
-# Calculated based on the hash above
-sha256	c4865aa1c64c5ff173ff7b5d69425466c71f0f9b5eb5299c52c68bdcd46fa63b	xtables-addons-2.12.tar.xz
+# Locally calculated
+sha256 1152205156ceb4ea02307a361d7c4888f07eabc6bb844bd82e7ffab8d1ebd627 xtables-addons-3.4.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 5c3be16052..6b7114f5f7 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.12
+XTABLES_ADDONS_VERSION = 3.4
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
-- 
2.20.1
