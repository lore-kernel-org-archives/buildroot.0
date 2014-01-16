From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 16 Jan 2014 08:45:00 +0100
Subject: [Buildroot] [PATCH 2/2] gob2: bump to version 2.0.20
In-Reply-To: <1389858300-6881-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1389858300-6881-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1389858300-6881-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/gob2/gob2.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 58d0c60..e4f1396 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-GOB2_VERSION = 2.0.19
+GOB2_VERSION = 2.0.20
+GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.xz
 GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconf host-flex
 HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
-- 
1.7.9.5
