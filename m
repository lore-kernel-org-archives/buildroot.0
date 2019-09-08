From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:12:04 -0700
Subject: [Buildroot] [PATCH 16/27] package/waf: bump to version 2.0.18
Message-ID: <20190908161204.26761-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update _SOURCE

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/waf/waf.hash | 7 ++++---
 package/waf/waf.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 9d610b2c1e..01108f7eeb 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,3 +1,4 @@
-# Locally computed
-sha1    33d170c738ed8c92dda2945b445272972f558244                          waf-1.9.5
-sha256  101f14e0f47a6410c00b8feda094948516cd3989491c56eb8268907fcd164909  waf-1.9.5
+# Checked with https://waf.io/waf-2.0.18.tar.bz2.asc
+# with key 8AF22DE5A06822E3474F3C7049B4C67C05277AAA
+# Locally calculated
+sha256 263d7ad4a75fd278399a1eae3eff6e8256a27617b3231b48e9b8992d1b6c7064 waf-2.0.18.tar.bz2
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 97bc2a8963..715cbe136d 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WAF_VERSION = 1.9.5
-WAF_SOURCE = waf-$(WAF_VERSION)
+WAF_VERSION = 2.0.18
+WAF_SOURCE = waf-$(WAF_VERSION).tar.bz2
 WAF_SITE = https://waf.io
 
 define HOST_WAF_EXTRACT_CMDS
-- 
2.20.1
