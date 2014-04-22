From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 22 Apr 2014 20:40:40 +0200
Subject: [Buildroot] [PATCH 1/1] mongrel2: bump to version v1.9.1
Message-ID: <1398192040-4882-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/mongrel2/mongrel2.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index 590a522..1614bcc 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGREL2_VERSION = v1.9.0
+MONGREL2_VERSION = v1.9.1
 MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)/
 MONGREL2_LICENSE = BSD-3c
 MONGREL2_LICENSE_FILES = LICENSE
-- 
1.7.9.5
