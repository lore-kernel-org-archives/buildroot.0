From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 30 Jan 2014 09:48:11 +0100
Subject: [Buildroot] [PATCH 1/1] jasper: fix license typo
Message-ID: <1391071692-23853-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/jasper/jasper.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index b349cfc..7917c6a 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -10,6 +10,6 @@ JASPER_SOURCE = jasper-$(JASPER_VERSION).tar.bz2
 JASPER_INSTALL_STAGING = YES
 JASPER_DEPENDENCIES = jpeg
 JASPER_LICENSE = MIT
-JASPER_LICENSE_FILE = LICENSE
+JASPER_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
1.7.9.5
