From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Apr 2014 22:57:55 +0200
Subject: [Buildroot] [PATCH 3/8] luajson: bump to version 1.3.3
In-Reply-To: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
References: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1397941080-24157-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajson/luajson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
index 3a4f81d..8269a79 100644
--- a/package/luajson/luajson.mk
+++ b/package/luajson/luajson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJSON_VERSION = 1.3.2-1
+LUAJSON_VERSION = 1.3.3-1
 LUAJSON_SUBDIR  = luajson
 LUAJSON_LICENSE = MIT
 LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
-- 
1.9.1
