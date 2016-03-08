From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  8 Mar 2016 22:58:05 +0100
Subject: [Buildroot] [PATCH 3/4] ltp-testsuite: indentation cleanup
In-Reply-To: <1457474286-18685-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1457474286-18685-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1457474286-18685-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ltp-testsuite/ltp-testsuite.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 81b1d87..7d455de 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -41,9 +41,9 @@ LTP_TESTSUITE_CONF_ENV += \
 # Requires uClibc fts and bessel support, normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 define LTP_TESTSUITE_REMOVE_UNSUPPORTED
-        rm -rf $(@D)/testcases/kernel/controllers/cpuset/
-        rm -rf $(@D)/testcases/misc/math/float/bessel/
-        rm -f $(@D)/testcases/misc/math/float/float_bessel.c
+	rm -rf $(@D)/testcases/kernel/controllers/cpuset/
+	rm -rf $(@D)/testcases/misc/math/float/bessel/
+	rm -f $(@D)/testcases/misc/math/float/float_bessel.c
 endef
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
 endif
-- 
1.9.1
