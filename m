From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri,  9 Nov 2012 16:40:03 +0400
Subject: [Buildroot] [PATCH] make version update 3.82
Message-ID: <1352464803-23068-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---
 package/make/make.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index 02b2741..cfb53f1 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -3,7 +3,7 @@
 # make
 #
 #############################################################
-MAKE_VERSION:=3.81
+MAKE_VERSION:=3.82
 MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE:=$(BR2_GNU_MIRROR)/make
 
-- 
1.7.11.3
