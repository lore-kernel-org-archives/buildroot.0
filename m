From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun,  6 Oct 2013 22:04:36 +0200
Subject: [Buildroot] [PATCH 2/2] gob2: bump to version 2.0.19
In-Reply-To: <1381089876-23875-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1381089876-23875-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1381089876-23875-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/gob2/gob2.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 9f6cc3e..58d0c60 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOB2_VERSION = 2.0.18
+GOB2_VERSION = 2.0.19
 GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconf host-flex
 HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
-- 
1.7.9.5
