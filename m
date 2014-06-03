From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Jun 2014 19:11:11 -0300
Subject: [Buildroot] [PATCH] grep: bump to version 2.20
Message-ID: <1401833471-31336-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grep/grep.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 8d199d1..5a3314f 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.19
+GREP_VERSION = 2.20
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
-- 
1.8.5.5
