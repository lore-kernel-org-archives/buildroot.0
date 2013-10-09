From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  9 Oct 2013 09:02:04 +0200
Subject: [Buildroot] [PATCH 1/1] poppler: bump to version 0.24.2
Message-ID: <1381302125-5854-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/poppler/poppler.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 81bdbbb..56a4d3f 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.22.3
+POPPLER_VERSION = 0.24.2
+POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig
 POPPLER_LICENSE = GPLv2+
-- 
1.7.9.5
