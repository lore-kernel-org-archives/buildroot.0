From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 14 Jan 2014 11:30:57 +0100
Subject: [Buildroot] [PATCH 1/2] rings: add the version major variable
Message-ID: <1389695458-19578-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/rings/rings.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index d052f5d..2876162 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-RINGS_VERSION = 1.3.0-1
+RINGS_VERSION_MAJOR = 1.3.0
+RINGS_VERSION = $(RINGS_VERSION_MAJOR)-1
 RINGS_SUBDIR  = rings-v_1_3_0
 RINGS_LICENSE = MIT
 
-- 
1.7.9.5
