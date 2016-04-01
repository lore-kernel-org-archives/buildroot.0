From: Alexander Dahl <post@lespocky.de>
Date: Fri,  1 Apr 2016 08:39:45 +0200
Subject: [Buildroot] [PATCH 1/2] libuecc: bump to v7
In-Reply-To: <1459492786-14594-1-git-send-email-post@lespocky.de>
References: <1459492786-14594-1-git-send-email-post@lespocky.de>
Message-ID: <1459492786-14594-2-git-send-email-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From v6 to v7 just few changes were made for performance improvement and
compatibility.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/libuecc/libuecc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuecc/libuecc.mk b/package/libuecc/libuecc.mk
index bddb7d5..d5323c9 100644
--- a/package/libuecc/libuecc.mk
+++ b/package/libuecc/libuecc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUECC_VERSION = v6
+LIBUECC_VERSION = v7
 LIBUECC_SITE = git://git.universe-factory.net/libuecc
 LIBUECC_LICENSE = BSD-2c
 LIBUECC_LICENSE_FILES = COPYRIGHT
-- 
2.1.4
