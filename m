From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 May 2014 22:42:08 -0300
Subject: [Buildroot] [PATCH 2/3] grep: bump to version 2.19
In-Reply-To: <1401068529-4738-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401068529-4738-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1401068529-4738-2-git-send-email-gustavo@zacarias.com.ar>
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
index 78e60dc..8d199d1 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.18
+GREP_VERSION = 2.19
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
-- 
1.8.5.5
