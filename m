From: =?UTF-8?q?Tam=C3=A1s=20L=C3=A9vai?= <levai.tamas@t-online.hu>
Date: Sat,  1 Mar 2014 14:21:04 +0100
Subject: [Buildroot] [PATCH 1/1] grep: bump version to 2.18
Message-ID: <1393680064-11021-1-git-send-email-levai.tamas@t-online.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tam?s L?vai <levai.tamas@t-online.hu>
---
 package/grep/grep.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index ee6de39..78e60dc 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.16
+GREP_VERSION = 2.18
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
-- 
1.8.5.3
