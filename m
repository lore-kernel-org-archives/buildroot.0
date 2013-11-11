From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Nov 2013 11:25:22 -0300
Subject: [Buildroot] [PATCH 4/4] grep: bump to version 2.15
In-Reply-To: <1384179922-14765-1-git-send-email-gustavo@zacarias.com.ar>
References: <1384179922-14765-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1384179922-14765-4-git-send-email-gustavo@zacarias.com.ar>
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
index 2d815fe..91ef7de 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.14
+GREP_VERSION = 2.15
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
-- 
1.8.3.2
