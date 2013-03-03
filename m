From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun,  3 Mar 2013 19:37:52 +0100
Subject: [Buildroot] [PATCH] aumix.mk: fix typo
Message-ID: <1362335872-2643-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/multimedia/aumix/aumix.mk |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
index 534f3cf..130bda0 100644
--- a/package/multimedia/aumix/aumix.mk
+++ b/package/multimedia/aumix/aumix.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-AUMIX_VERSION=2.8
-AUMIX_SOURCE=aumix-$(AUMIX_VERSION).tar.bz2
-AUMIX_SITE=http://jpj.net/~trevor/aumix/releases
-AUMIX_AUTORECONF=YES
+AUMIX_VERSION = 2.8
+AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
+AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
+AUMIX_AUTORECONF = YES
 
 AUMIX_CONF_OPT = \
 	--without-gtk \
-- 
1.7.9.5
