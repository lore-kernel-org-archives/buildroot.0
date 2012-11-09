From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri,  9 Nov 2012 16:34:29 +0400
Subject: [Buildroot] [PATCH] automake version update 1.12.4
Message-ID: <1352464469-22784-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---
 package/automake/automake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index faa1b36..518bf1a 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-AUTOMAKE_VERSION = 1.11.6
+AUTOMAKE_VERSION = 1.12.4
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPLv2+
 AUTOMAKE_LICENSE_FILES = COPYING
-- 
1.7.11.3
