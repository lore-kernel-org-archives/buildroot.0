From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Oct 2013 09:28:45 -0300
Subject: [Buildroot] [PATCH 2/3] bison: bump to version 3.0
In-Reply-To: <1380716926-24611-1-git-send-email-gustavo@zacarias.com.ar>
References: <1380716926-24611-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1380716926-24611-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bison/bison.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 1fbbf91..47a7560 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 2.7.1
+BISON_VERSION = 3.0
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
-- 
1.8.1.5
