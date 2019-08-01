From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Aug 2019 19:14:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/gmrender-resurrect: bump to version
 a7b0b1b9ca482d2d34ac62c2f2dc0cf0dfbb702b
Message-ID: <20190801171409.27105-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gmrender-resurrect/gmrender-resurrect.hash | 3 ++-
 package/gmrender-resurrect/gmrender-resurrect.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
index 522bd2ae87..85d6ad4629 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.hash
+++ b/package/gmrender-resurrect/gmrender-resurrect.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 dcbde3601c3389e8dd21fe1842a92abf4cc06f6e3a375f1df63fdbf784a6650b  gmrender-resurrect-33600ab663f181c4f4f5c48aba25bf961760a300.tar.gz
+sha256 79dba7cbd275098026a16829597b7013ab71a9cca4c9762af6f210637099c39a  gmrender-resurrect-a7b0b1b9ca482d2d34ac62c2f2dc0cf0dfbb702b.tar.gz
+sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index 2b6a56f0e5..432ed8424e 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMRENDER_RESURRECT_VERSION = 33600ab663f181c4f4f5c48aba25bf961760a300
+GMRENDER_RESURRECT_VERSION = a7b0b1b9ca482d2d34ac62c2f2dc0cf0dfbb702b
 GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,$(GMRENDER_RESURRECT_VERSION))
 # Original distribution does not have default configure,
 # so we need to autoreconf:
-- 
2.20.1
